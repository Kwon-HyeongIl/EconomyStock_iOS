//
//  HomeView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/4/24.
//

import SwiftUI
import Charts

struct HomeView: View {
    @Environment(NavigationRouter.self) var navRouter
    @State private var viewModel = HomeViewModel()
    
    @State private var chartAni = false
    @State private var currentActiveGestureItem: EconomicIndicatorCycleData?
    @State private var plotWidth: CGFloat = 0
    
    @State private var BRInfo = false
    @State private var CPIInfo = false
    @State private var WDERInfo = false
    @State private var M1Info = false
    @State private var M2Info = false
    @State private var EGRInfo = false
    @State private var URInfo = false
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                Spacer()
                
                HStack {
                    Image("ES_TitleLogo_Blue")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Rectangle())
                        .frame(width: 120)
                        .padding(.leading)
                    
                    Spacer()
                    
//                    Button {
//                        
//                    } label: {
//                        ZStack {
//                            Image(systemName: "bell")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 21)
//                                .foregroundStyle(Color.ESTitle)
//                                .padding(.trailing)
//                            
//                            if viewModel.isNotificationBadge {
//                                Circle()
//                                    .scaledToFit()
//                                    .frame(width: 7)
//                                    .foregroundStyle(.red)
//                                    .padding(.leading, 18)
//                                    .padding(.bottom, 24)
//                            }
//                        }
//                    }
                }
                .padding(.bottom, 5)
            }
            .frame(height: 105)
            .background(.regularMaterial)
            
            ZStack {
                ScrollView {
                    VStack(spacing: 15) {
                        if !viewModel.isRedacted {
                            ZStack {
                                VStack {
                                    HStack {
                                        Text("기준금리")
                                            .font(.system(size: 23).bold())
                                            .fixedSize()
                                        
                                        if let dataValue = viewModel.BR.last?.dataValue {
                                            (Text("\(dataValue)")
                                             + Text(" ")
                                                .font(.system(size: 15))
                                             + Text("%")
                                                .font(.system(size: 15))
                                            )
                                            .font(.system(size: 21).bold())
                                            .padding(.leading, 13)
                                            .padding(.trailing, 5)
                                            .padding(.bottom, 1)
                                        }
                                        
                                        if let diffData = viewModel.calculateRecentDataValueChangeDifference(for: viewModel.BR) {
                                            VStack {
                                                HStack(spacing: 0) {
                                                    if diffData.difference > 0 {
                                                        LottieView(fileName: "EconomicIndicatorUp", loopMode: .playOnce, scale: 2.5, width: 20, height: 20)
                                                            .rotationEffect(.degrees(180))
                                                        
                                                        (Text("\(String(format: "%.2f", diffData.difference))")
                                                         + Text(" ")
                                                            .font(.system(size: 11))
                                                         + Text("%")
                                                            .font(.system(size: 10))
                                                        )
                                                        .font(.system(size: 15).bold())
                                                        .foregroundStyle(Color(hex: "D92B2B"))
                                                        
                                                    } else {
                                                        LottieView(fileName: "EconomicIndicatorDown", loopMode: .playOnce, scale: 2.5, width: 20, height: 20)
                                                            .padding(.top, 3)
                                                        
                                                        (Text("\(String(format: "%.2f", diffData.difference))")
                                                         + Text(" ")
                                                            .font(.system(size: 11))
                                                         + Text("%")
                                                            .font(.system(size: 10))
                                                        )
                                                        .font(.system(size: 15).bold())
                                                        .foregroundStyle(Color.ESTitle)
                                                    }
                                                }
                                                
                                                Text("(\(diffData.date) 대비)")
                                                    .font(.system(size: 9))
                                                    .fontWeight(.semibold)
                                                    .foregroundStyle(.gray)
                                                    .padding(.leading, 5)
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                    
                                    Chart {
                                        ForEach(viewModel.BR) { cycleData in
                                            LineMark(
                                                x: .value("일", cycleData.time),
                                                y: .value("기준금리", chartAni ? (Double(cycleData.dataValue) ?? 0) : 0)
                                            )
                                            .foregroundStyle(Color.ESTitle)
                                            .interpolationMethod(.catmullRom)
                                            
                                            AreaMark(
                                                x: .value("일", cycleData.time),
                                                y: .value("기준금리", chartAni ? (Double(cycleData.dataValue) ?? 0) : 0)
                                            )
                                            .foregroundStyle(Color.ESTitle.opacity(0.1).gradient)
                                            .interpolationMethod(.catmullRom)
                                            
                                            if let currentActiveGestureItem, currentActiveGestureItem.id == cycleData.id {
                                                RuleMark(x: .value("일", currentActiveGestureItem.time))
                                                    .lineStyle(.init(lineWidth: 2, miterLimit: 2, dash: [2], dashPhase: 5))
                                                    .offset(x: (plotWidth / CGFloat(viewModel.BR.count)) / 2)
                                                    .annotation(position: .top) {
                                                        VStack(alignment: .leading, spacing: 6) {
                                                            Text("기준금리")
                                                                .font(.caption)
                                                                .foregroundStyle(.gray)
                                                            
                                                            Text(currentActiveGestureItem.time)
                                                                .font(.caption)
                                                                .foregroundStyle(.gray)
                                                            
                                                            Text("\(currentActiveGestureItem.dataValue)%")
                                                                .font(.title3.bold())
                                                        }
                                                        .padding(.horizontal, 10)
                                                        .padding(.vertical, 4)
                                                        .background {
                                                            RoundedRectangle(cornerRadius: 6, style: .continuous)
                                                                .fill(.white)
                                                                .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
                                                        }
                                                    }
                                            }
                                        }
                                    }
                                    .chartXAxis {
                                        AxisMarks(values: viewModel.BRYearFilter) { value in
                                            if let dateString = value.as(String.self) {
                                                AxisGridLine()
                                                
                                                let year = String(dateString.prefix(4))
                                                AxisValueLabel {
                                                    Text("\(year)")
                                                        .fixedSize()
                                                        .padding(.leading, value.index == 0 ? 15 : 0)
                                                }
                                            }
                                        }
                                    }
                                    .chartYScale(domain: 0...5)
                                    .chartYAxis {
                                        AxisMarks(values: [0, 1, 2, 3, 4, 5])
                                    }
                                    .chartOverlay(content: { proxy in
                                        GeometryReader{innerProxy in
                                            Rectangle()
                                                .fill(.clear).contentShape(Rectangle())
                                                .gesture(
                                                    DragGesture()
                                                        .onChanged { value in
                                                            let location = value.location
                                                            if let day: String = proxy.value(atX: location.x) {
                                                                if let currentItem = viewModel.BR.first(where: { $0.time == day }) {
                                                                    self.currentActiveGestureItem = currentItem
                                                                    self.plotWidth = proxy.plotSize.width
                                                                }
                                                            }
                                                        }
                                                        .onEnded { value in
                                                            self.currentActiveGestureItem = nil
                                                        }
                                                )
                                        }
                                    })
                                    .frame(height: 200)
                                    .onAppear {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 0.8, blendDuration: 0.8)) {
                                                chartAni = true
                                            }
                                        }
                                    }
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(.white)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(lineWidth: 1)
                                                .foregroundStyle(.gray.opacity(0.3))
                                        }
                                }
                                
                                VStack {
                                    HStack {
                                        Spacer()
                                        
                                        Button {
                                            self.BRInfo = true
                                        } label: {
                                            Image(systemName: "info.circle")
                                                .scaledToFit()
                                                .frame(width: 18, height: 18)
                                                .foregroundStyle(.gray.opacity(0.6))
                                                .padding(.top, 8)
                                                .padding(.trailing, 8)
                                        }
                                        .alert("기준금리", isPresented: $BRInfo) {
                                            Button {
                                                
                                            } label: {
                                                Text("확인")
                                            }
                                        } message: {
                                            Text("금리 체계의 기준이 되는 금리를 의미하며, 매월 금융통화위원회에서 결정돼요.")
                                        }
                                    }
                                    
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                            
                        } else {
                            DummyGraphIndicatorView()
                        }
                        
                        // 배너 AD
                        if !viewModel.isRedacted {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .frame(maxWidth: .infinity)
                                .frame(height: 80)
                                .foregroundStyle(.white)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(lineWidth: 1)
                                        .foregroundStyle(.gray.opacity(0.3))
                                }
                                .overlay {
                                    BannerAd()
                                        .frame(height: 80)
                                        .frame(maxWidth: .infinity)
                                        .cornerRadius(10, corners: .allCorners)
                                }
                            
                        } else {
                            DummyHorizontalIndicatorView()
                        }
                        
                        if !viewModel.isRedacted {
                            ZStack(alignment: .top) {
                                VStack {
                                    HStack {
                                        Text("소비자물가지수")
                                            .font(.system(size: 23).bold())
                                            .fixedSize()
                                        
                                        if let dataValue = viewModel.CPI.last?.dataValue {
                                            Text("\(dataValue)")
                                                .font(.system(size: 21).bold())
                                                .padding(.leading, 13)
                                                .padding(.trailing, 5)
                                                .padding(.bottom, 1)
                                        }
                                        
                                        if let diffData = viewModel.calculateRecentDataValueChangeDifference(for: viewModel.CPI) {
                                            VStack {
                                                HStack(spacing: 0) {
                                                    if diffData.difference > 0 {
                                                        LottieView(fileName: "EconomicIndicatorUp", loopMode: .playOnce, scale: 2.5, width: 20, height: 20)
                                                            .rotationEffect(.degrees(180))
                                                        
                                                        (Text("\(String(format: "%.1f", diffData.difference))")
                                                         + Text(" ")
                                                            .font(.system(size: 11))
                                                         + Text("%")
                                                            .font(.system(size: 10))
                                                        )
                                                        .font(.system(size: 15).bold())
                                                        .foregroundStyle(Color(hex: "D92B2B"))
                                                        
                                                    } else {
                                                        LottieView(fileName: "EconomicIndicatorDown", loopMode: .playOnce, scale: 2.5, width: 20, height: 20)
                                                            .padding(.top, 3)
                                                        
                                                        (Text("\(String(format: "%.1f", diffData.difference))")
                                                         + Text(" ")
                                                            .font(.system(size: 11))
                                                         + Text("%")
                                                            .font(.system(size: 10))
                                                        )
                                                        .font(.system(size: 15).bold())
                                                        .foregroundStyle(Color.ESTitle)
                                                    }
                                                }
                                                
                                                Text("(\(diffData.date) 대비)")
                                                    .font(.system(size: 9))
                                                    .fontWeight(.semibold)
                                                    .foregroundStyle(.gray)
                                                    .padding(.leading, 5)
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(.white)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(lineWidth: 1)
                                                .foregroundStyle(.gray.opacity(0.3))
                                        }
                                }
                                
                                VStack {
                                    HStack {
                                        Spacer()
                                        
                                        Button {
                                            self.CPIInfo = true
                                        } label: {
                                            Image(systemName: "info.circle")
                                                .scaledToFit()
                                                .frame(width: 18, height: 18)
                                                .foregroundStyle(.gray.opacity(0.6))
                                                .padding(.top, 8)
                                                .padding(.trailing, 8)
                                        }
                                        .alert("소비자물가지수", isPresented: $CPIInfo) {
                                            Button {
                                                
                                            } label: {
                                                Text("확인")
                                            }
                                        } message: {
                                            Text("소비자가 소비하는 재화나 서비스의 가격 수준을 나타내는 지수로, 기준연도를 100으로 놓고 현재의 물가 수준을 나타내며, 매월 산출돼요.")
                                        }
                                    }
                                    
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                            
                        } else {
                            DummyHorizontalIndicatorView()
                        }
                        
                        if !viewModel.isRedacted {
                            ZStack(alignment: .top) {
                                VStack {
                                    HStack {
                                        Text("원달러환율")
                                            .font(.system(size: 23).bold())
                                        
                                        if let dataValue = viewModel.WDER.last?.dataValue {
                                            (Text("\(dataValue)")
                                             + Text(" ")
                                                .font(.system(size: 15))
                                             + Text("원")
                                                .font(.system(size: 15))
                                            )
                                            .font(.system(size: 21).bold())
                                            .padding(.leading, 13)
                                            .padding(.trailing, 5)
                                            .padding(.bottom, 1)
                                        }
                                        
                                        if let diffData = viewModel.calculateRecentDataValueChangeDifference(for: viewModel.WDER) {
                                            VStack {
                                                HStack(spacing: 0) {
                                                    if diffData.difference > 0 {
                                                        LottieView(fileName: "EconomicIndicatorUp", loopMode: .playOnce, scale: 2.5, width: 20, height: 20)
                                                            .rotationEffect(.degrees(180))
                                                        
                                                        (Text("\(String(format: "%.1f", diffData.difference))")
                                                         + Text(" ")
                                                            .font(.system(size: 11))
                                                         + Text("원")
                                                            .font(.system(size: 10))
                                                        )
                                                        .font(.system(size: 15).bold())
                                                        .foregroundStyle(Color(hex: "D92B2B"))
                                                    } else {
                                                        LottieView(fileName: "EconomicIndicatorDown", loopMode: .playOnce, scale: 2.5, width: 20, height: 20)
                                                            .padding(.top, 3)
                                                        
                                                        (Text("\(String(format: "%.1f", diffData.difference))")
                                                         + Text(" ")
                                                            .font(.system(size: 11))
                                                         + Text("원")
                                                            .font(.system(size: 10))
                                                        )
                                                        .font(.system(size: 15).bold())
                                                        .foregroundStyle(Color.ESTitle)
                                                    }
                                                }
                                                
                                                Text("(\(diffData.date) 대비)")
                                                    .font(.system(size: 9))
                                                    .fontWeight(.semibold)
                                                    .foregroundStyle(.gray)
                                                    .padding(.leading, 5)
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(.white)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(lineWidth: 1)
                                                .foregroundStyle(.gray.opacity(0.3))
                                        }
                                }
                                
                                VStack {
                                    HStack {
                                        Spacer()
                                        
                                        Button {
                                            self.WDERInfo = true
                                        } label: {
                                            Image(systemName: "info.circle")
                                                .scaledToFit()
                                                .frame(width: 18, height: 18)
                                                .foregroundStyle(.gray.opacity(0.6))
                                                .padding(.top, 8)
                                                .padding(.trailing, 8)
                                        }
                                        .alert("원달러환율", isPresented: $WDERInfo) {
                                            Button {
                                                
                                            } label: {
                                                Text("확인")
                                            }
                                        } message: {
                                            Text("1달러와 교환되는 원화의 양을 나타내며, 실시간으로 변화하지만 현재의 수치는 외환시장이 마감될 때의 환율을 나타내요.")
                                        }
                                    }
                                    
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                            
                        } else {
                            DummyHorizontalIndicatorView()
                        }
                        
                        HStack(spacing: 15) {
                            if !viewModel.isRedacted {
                                ZStack(alignment: .top) {
                                    VStack {
                                        Text("M1")
                                            .font(.system(size: 23).bold())
                                            .padding(.bottom, 5)
                                        
                                        if let dataValue = viewModel.M1.last?.dataValue {
                                            (Text("\(dataValue)")
                                             + Text(" ")
                                                .font(.system(size: 15))
                                             + Text("십억원")
                                                .font(.system(size: 12))
                                            )
                                            .font(.system(size: 18).bold())
                                        }
                                        
                                        if let diffData = viewModel.calculateRecentDataValueChangeDifference(for: viewModel.M1) {
                                            VStack {
                                                HStack(spacing: 0) {
                                                    if diffData.difference > 0 {
                                                        LottieView(fileName: "EconomicIndicatorUp", loopMode: .playOnce, scale: 2.4, width: 20, height: 20)
                                                            .rotationEffect(.degrees(180))
                                                        
                                                        (Text("\(String(format: "%.1f", diffData.difference))")
                                                         + Text(" ")
                                                            .font(.system(size: 11))
                                                         + Text("십억원")
                                                            .font(.system(size: 8))
                                                        )
                                                        .font(.system(size: 13).bold())
                                                        .foregroundStyle(Color(hex: "D92B2B"))
                                                    } else {
                                                        LottieView(fileName: "EconomicIndicatorDown", loopMode: .playOnce, scale: 2.4, width: 20, height: 20)
                                                            .padding(.top, 3)
                                                        
                                                        (Text("\(String(format: "%.1f", diffData.difference))")
                                                         + Text(" ")
                                                            .font(.system(size: 11))
                                                         + Text("십억원")
                                                            .font(.system(size: 8))
                                                        )
                                                        .font(.system(size: 13).bold())
                                                        .foregroundStyle(Color.ESTitle)
                                                    }
                                                }
                                                
                                                Text("(\(diffData.date) 대비)")
                                                    .font(.system(size: 8))
                                                    .fontWeight(.semibold)
                                                    .foregroundStyle(.gray)
                                                    .padding(.leading, 5)
                                            }
                                        }
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 120)
                                    .padding()
                                    .background {
                                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                                            .fill(.white)
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(lineWidth: 1)
                                                    .foregroundStyle(.gray.opacity(0.3))
                                            }
                                    }
                                    
                                    VStack {
                                        HStack {
                                            Spacer()
                                            
                                            Button {
                                                self.M1Info = true
                                            } label: {
                                                Image(systemName: "info.circle")
                                                    .scaledToFit()
                                                    .frame(width: 18, height: 18)
                                                    .foregroundStyle(.gray.opacity(0.6))
                                                    .padding(.top, 8)
                                                    .padding(.trailing, 8)
                                            }
                                            .alert("M1", isPresented: $M1Info) {
                                                Button {
                                                    
                                                } label: {
                                                    Text("확인")
                                                }
                                            } message: {
                                                Text("현금, 요구불 예금 등 즉시 유통 가능하고 거래에 직접 사용되는 통화로 구성되며, 매월 산출돼요.")
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                }
                                
                            } else {
                                DummyVerticalInticatorView()
                            }
                            
                            if !viewModel.isRedacted {
                                ZStack(alignment: .top) {
                                    VStack {
                                        Text("M2")
                                            .font(.system(size: 23).bold())
                                            .padding(.bottom, 5)
                                        
                                        if let dataValue = viewModel.M2.last?.dataValue {
                                            (Text("\(dataValue)")
                                             + Text(" ")
                                                .font(.system(size: 15))
                                             + Text("십억원")
                                                .font(.system(size: 12))
                                            )
                                            .font(.system(size: 18).bold())
                                        }
                                        
                                        if let diffData = viewModel.calculateRecentDataValueChangeDifference(for: viewModel.M2) {
                                            VStack {
                                                HStack(spacing: 0) {
                                                    if diffData.difference > 0 {
                                                        LottieView(fileName: "EconomicIndicatorUp", loopMode: .playOnce, scale: 2.4, width: 20, height: 20)
                                                            .rotationEffect(.degrees(180))
                                                        
                                                        (Text("\(String(format: "%.1f", diffData.difference))")
                                                         + Text(" ")
                                                            .font(.system(size: 11))
                                                         + Text("십억원")
                                                            .font(.system(size: 8))
                                                        )
                                                        .font(.system(size: 13).bold())
                                                        .foregroundStyle(Color(hex: "D92B2B"))
                                                    } else {
                                                        LottieView(fileName: "EconomicIndicatorDown", loopMode: .playOnce, scale: 2.4, width: 20, height: 20)
                                                            .padding(.top, 3)
                                                        
                                                        (Text("\(String(format: "%.1f", diffData.difference))")
                                                         + Text(" ")
                                                            .font(.system(size: 11))
                                                         + Text("십억원")
                                                            .font(.system(size: 8))
                                                        )
                                                        .font(.system(size: 13).bold())
                                                        .foregroundStyle(Color.ESTitle)
                                                    }
                                                }
                                                
                                                Text("(\(diffData.date) 대비)")
                                                    .font(.system(size: 8))
                                                    .fontWeight(.semibold)
                                                    .foregroundStyle(.gray)
                                                    .padding(.leading, 5)
                                            }
                                        }
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 120)
                                    .padding()
                                    .background {
                                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                                            .fill(.white)
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(lineWidth: 1)
                                                    .foregroundStyle(.gray.opacity(0.3))
                                            }
                                    }
                                    
                                    VStack {
                                        HStack {
                                            Spacer()
                                            
                                            Button {
                                                self.M2Info = true
                                            } label: {
                                                Image(systemName: "info.circle")
                                                    .scaledToFit()
                                                    .frame(width: 18, height: 18)
                                                    .foregroundStyle(.gray.opacity(0.6))
                                                    .padding(.top, 8)
                                                    .padding(.trailing, 8)
                                            }
                                            .alert("M2", isPresented: $M2Info) {
                                                Button {
                                                    
                                                } label: {
                                                    Text("확인")
                                                }
                                            } message: {
                                                Text("M1에 저축 예금, 소액의 정기 예금 및 기타 단기 금융 상품을 포함한 보다 광범위한 통화지표로, 매월 산출돼요.")
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                }
                                
                            } else {
                                DummyVerticalInticatorView()
                            }
                        }
                        
                        if !viewModel.isRedacted {
                            ZStack(alignment: .top) {
                                VStack {
                                    HStack {
                                        Text("경제성장률")
                                            .font(.system(size: 23).bold())
                                        
                                        if let dataValue = viewModel.EGR.last?.dataValue {
                                            (Text("\(dataValue)")
                                             + Text(" ")
                                                .font(.system(size: 15))
                                             + Text("%")
                                                .font(.system(size: 15))
                                            )
                                            .font(.system(size: 21).bold())
                                            .padding(.leading, 13)
                                            .padding(.trailing, 5)
                                            .padding(.bottom, 1)
                                        }
                                        
                                        if let diffData = viewModel.calculateRecentDataValueChangeDifference(for: viewModel.EGR) {
                                            VStack {
                                                HStack(spacing: 0) {
                                                    if diffData.difference > 0 {
                                                        LottieView(fileName: "EconomicIndicatorUp", loopMode: .playOnce, scale: 2.5, width: 20, height: 20)
                                                            .rotationEffect(.degrees(180))
                                                        
                                                        (Text("\(String(format: "%.3f", diffData.difference))")
                                                         + Text(" ")
                                                            .font(.system(size: 11))
                                                         + Text("%")
                                                            .font(.system(size: 10))
                                                        )
                                                        .font(.system(size: 15).bold())
                                                        .foregroundStyle(Color(hex: "D92B2B"))
                                                        
                                                    } else {
                                                        LottieView(fileName: "EconomicIndicatorDown", loopMode: .playOnce, scale: 2.5, width: 20, height: 20)
                                                            .padding(.top, 3)
                                                        
                                                        (Text("\(String(format: "%.3f", diffData.difference))")
                                                         + Text(" ")
                                                            .font(.system(size: 11))
                                                         + Text("%")
                                                            .font(.system(size: 10))
                                                        )
                                                        .font(.system(size: 15).bold())
                                                        .foregroundStyle(Color.ESTitle)
                                                    }
                                                }
                                                
                                                Text("(\(diffData.date) 대비)")
                                                    .font(.system(size: 9))
                                                    .fontWeight(.semibold)
                                                    .foregroundStyle(.gray)
                                                    .padding(.leading, 5)
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(.white)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(lineWidth: 1)
                                                .foregroundStyle(.gray.opacity(0.3))
                                        }
                                }
                                
                                VStack {
                                    HStack {
                                        Spacer()
                                        
                                        Button {
                                            self.EGRInfo = true
                                        } label: {
                                            Image(systemName: "info.circle")
                                                .scaledToFit()
                                                .frame(width: 18, height: 18)
                                                .foregroundStyle(.gray.opacity(0.6))
                                                .padding(.top, 8)
                                                .padding(.trailing, 8)
                                        }
                                        .alert("경제성장률", isPresented: $EGRInfo) {
                                            Button {
                                                
                                            } label: {
                                                Text("확인")
                                            }
                                        } message: {
                                            Text("경제성장률은 실질GDP가 얼마나 성장했는가를 나타내며, 매 분기별 산출돼요.")
                                        }
                                    }
                                    
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                            
                        } else {
                            DummyHorizontalIndicatorView()
                        }
                        
                        if !viewModel.isRedacted {
                            ZStack(alignment: .top) {
                                VStack {
                                    HStack {
                                        Text("실업률")
                                            .font(.system(size: 23).bold())
                                        
                                        if let dataValue = viewModel.UR.last?.dataValue {
                                            (Text("\(dataValue)")
                                             + Text(" ")
                                                .font(.system(size: 15))
                                             + Text("%")
                                                .font(.system(size: 15))
                                            )
                                            .font(.system(size: 21).bold())
                                            .padding(.leading, 13)
                                            .padding(.trailing, 5)
                                            .padding(.bottom, 1)
                                        }
                                        
                                        if let diffData = viewModel.calculateRecentDataValueChangeDifference(for: viewModel.UR) {
                                            VStack {
                                                HStack(spacing: 0) {
                                                    if diffData.difference > 0 {
                                                        LottieView(fileName: "EconomicIndicatorUp", loopMode: .playOnce, scale: 2.5, width: 20, height: 20)
                                                            .rotationEffect(.degrees(180))
                                                        
                                                        (Text("\(String(format: "%.1f", diffData.difference))")
                                                         + Text(" ")
                                                            .font(.system(size: 11))
                                                         + Text("%")
                                                            .font(.system(size: 10))
                                                        )
                                                        .font(.system(size: 15).bold())
                                                        .foregroundStyle(Color(hex: "D92B2B"))
                                                        
                                                    } else {
                                                        LottieView(fileName: "EconomicIndicatorDown", loopMode: .playOnce, scale: 2.5, width: 20, height: 20)
                                                            .padding(.top, 3)
                                                        
                                                        (Text("\(String(format: "%.1f", diffData.difference))")
                                                         + Text(" ")
                                                            .font(.system(size: 11))
                                                         + Text("%")
                                                            .font(.system(size: 10))
                                                        )
                                                        .font(.system(size: 15).bold())
                                                        .foregroundStyle(Color.ESTitle)
                                                    }
                                                }
                                                
                                                Text("(\(diffData.date) 대비)")
                                                    .font(.system(size: 9))
                                                    .fontWeight(.semibold)
                                                    .foregroundStyle(.gray)
                                                    .padding(.leading, 5)
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(.white)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(lineWidth: 1)
                                                .foregroundStyle(.gray.opacity(0.3))
                                        }
                                }
                                
                                VStack {
                                    HStack {
                                        Spacer()
                                        
                                        Button {
                                            self.URInfo = true
                                        } label: {
                                            Image(systemName: "info.circle")
                                                .scaledToFit()
                                                .frame(width: 18, height: 18)
                                                .foregroundStyle(.gray.opacity(0.6))
                                                .padding(.top, 8)
                                                .padding(.trailing, 8)
                                        }
                                        .alert("실업률", isPresented: $URInfo) {
                                            Button {
                                                
                                            } label: {
                                                Text("확인")
                                            }
                                        } message: {
                                            Text("경제활동인구 중 실업자의 비율로, 매월 산출돼요.")
                                        }
                                    }
                                    
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                            .padding(.bottom, 50)
                            
                        } else {
                            DummyHorizontalIndicatorView()
                        }
                    }
                    .padding()
                }
                .scrollIndicators(.never)
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            navRouter.navigate(.ChatbotView(.main))
                        } label: {
                            ZStack {
                                LottieView(fileName: "AIOrb", loopMode: .loop, speed: 1.4, width: 90, height: 90)
                                    .blur(radius: 1.5)
                                
                                Image("Chatbot_Toktok")
                                    .resizable()
                                    .frame(width: 55, height: 50)
                            }
                            .padding(.trailing, 10)
                            .padding(.bottom, 10)
                        }
                    }
                    .padding(.bottom, 50)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .onAppear {
            if viewModel.isFirstLoad {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation(.easeOut(duration: 0.3)) {
                        viewModel.isRedacted = false
                    }
                }
                
                viewModel.isFirstLoad = false
            }
        }
    }
}

#Preview {
    HomeView()
        .environment(NavigationRouter())
}
