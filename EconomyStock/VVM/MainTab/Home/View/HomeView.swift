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
    
    @State private var infoCloseTapLayer = false
    @State private var BRInfo = false
    @State private var BRInfoText = false
    @State private var CPIInfo = false
    @State private var CPIInfoText = false
    @State private var WDERInfo = false
    @State private var WDERInfoText = false
    @State private var M1Info = false
    @State private var M1InfoText = false
    @State private var M2Info = false
    @State private var M2InfoText = false
    @State private var EGRInfo = false
    @State private var EGRInfoText = false
    @State private var URInfo = false
    @State private var URInfoText = false

    var body: some View {
        ZStack {
            ScrollView {
                ZStack {
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
                                                                .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
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
                                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                                }
                                
                                VStack {
                                    HStack {
                                        Spacer()
                                        
                                        Button {
                                            self.infoCloseTapLayer = true
                                            
                                            withAnimation {
                                                self.BRInfo = true
                                            }
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                withAnimation {
                                                    self.BRInfoText = true
                                                }
                                            }
                                        } label: {
                                            Image(systemName: "info.circle")
                                                .scaledToFit()
                                                .frame(width: 18, height: 18)
                                                .foregroundStyle(.gray.opacity(0.6))
                                                .padding(.top, 8)
                                                .padding(.trailing, 8)
                                        }
                                    }
                                    
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                
                                VStack {
                                    HStack {
                                        Spacer()
                                        
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.white)
                                                .frame(width: BRInfo ? 230 : 0, height: BRInfo ? 120 : 0)
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(lineWidth: 1.5)
                                                        .frame(width: BRInfo ? 230 : 0, height: BRInfo ? 120 : 0)
                                                        .foregroundStyle(Color.ESTitle)
                                                    
                                                }
                                                .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                                                .padding(.top, 25)
                                                .padding(.trailing, 25)
                                            
                                            if BRInfoText {
                                                VStack {
                                                    Text("기준금리")
                                                        .font(.system(size: 18))
                                                        .fontWeight(.semibold)
                                                        .foregroundStyle(Color.ESTitle)
                                                        .padding(.bottom, 10)
                                                    
                                                    Text("기준금리는 금리 체계의 기준이 되는 금리를 의미하며, 매월 금융통화위원회에서 결정돼요")
                                                        .font(.system(size: 15))
                                                        .fontWeight(.semibold)
                                                        .multilineTextAlignment(.center)
                                                }
                                                .padding(10)
                                                .frame(width: 230, height: 120)
                                                .padding(.top, 25)
                                                .padding(.trailing, 25)
                                            }
                                        }
                                    }
                                    
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                            
                        } else {
                            DummyGraphIndicatorView()
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
                                .frame(height: 60)
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(.white)
                                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                                }
                                
                                VStack {
                                    HStack {
                                        Spacer()
                                        
                                        Button {
                                            self.infoCloseTapLayer = true
                                            
                                            withAnimation {
                                                self.CPIInfo = true
                                            }
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                withAnimation {
                                                    self.CPIInfoText = true
                                                }
                                            }
                                        } label: {
                                            Image(systemName: "info.circle")
                                                .scaledToFit()
                                                .frame(width: 18, height: 18)
                                                .foregroundStyle(.gray.opacity(0.6))
                                                .padding(.top, 8)
                                                .padding(.trailing, 8)
                                        }
                                    }
                                    
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                
                                VStack {
                                    HStack {
                                        Spacer()
                                        
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.white)
                                                .frame(width: CPIInfo ? 300 : 0, height: CPIInfo ? 140 : 0)
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(lineWidth: 1.5)
                                                        .frame(width: CPIInfo ? 300 : 0, height: CPIInfo ? 140 : 0)
                                                        .foregroundStyle(Color.ESTitle)
                                                    
                                                }
                                                .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                                                .padding(.top, 25)
                                                .padding(.trailing, 25)
                                            
                                            if CPIInfoText {
                                                VStack {
                                                    Text("소비자물가지수")
                                                        .font(.system(size: 18))
                                                        .fontWeight(.semibold)
                                                        .foregroundStyle(Color.ESTitle)
                                                        .padding(.bottom, 10)
                                                    
                                                    Text("소비자물가지수는 소비자가 소비하는 재화나 서비스의 가격 수준을 나타내는 지수로, 기준연도를 100으로 놓고 현재의 물가 수준을 나타내며, 매월 산출돼요")
                                                        .font(.system(size: 15))
                                                        .fontWeight(.semibold)
                                                        .multilineTextAlignment(.center)
                                                }
                                                .padding(10)
                                                .frame(width: 300, height: 140)
                                                .padding(.top, 25)
                                                .padding(.trailing, 25)
                                            }
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
                                .frame(height: 60)
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(.white)
                                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                                }
                                
                                VStack {
                                    HStack {
                                        Spacer()
                                        
                                        Button {
                                            self.infoCloseTapLayer = true
                                            
                                            withAnimation {
                                                self.WDERInfo = true
                                            }
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                withAnimation {
                                                    self.WDERInfoText = true
                                                }
                                            }
                                        } label: {
                                            Image(systemName: "info.circle")
                                                .scaledToFit()
                                                .frame(width: 18, height: 18)
                                                .foregroundStyle(.gray.opacity(0.6))
                                                .padding(.top, 8)
                                                .padding(.trailing, 8)
                                        }
                                    }
                                    
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                
                                VStack {
                                    HStack {
                                        Spacer()
                                        
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.white)
                                                .frame(width: WDERInfo ? 270 : 0, height: WDERInfo ? 120 : 0)
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(lineWidth: 1.5)
                                                        .frame(width: WDERInfo ? 270 : 0, height: WDERInfo ? 120 : 0)
                                                        .foregroundStyle(Color.ESTitle)
                                                    
                                                }
                                                .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                                                .padding(.top, 25)
                                                .padding(.trailing, 25)
                                            
                                            if WDERInfoText {
                                                VStack {
                                                    Text("원달러환율")
                                                        .font(.system(size: 18))
                                                        .fontWeight(.semibold)
                                                        .foregroundStyle(Color.ESTitle)
                                                        .padding(.bottom, 10)
                                                    
                                                    Text("1달러와 교환되는 원화의 양을 나타내며, 실시간으로 변화하지만 현재의 수치는 외환시장이 마감될 때의 환율을 나타내요")
                                                        .font(.system(size: 15))
                                                        .fontWeight(.semibold)
                                                        .multilineTextAlignment(.center)
                                                }
                                                .padding(10)
                                                .frame(width: 270, height: 120)
                                                .padding(.top, 25)
                                                .padding(.trailing, 25)
                                            }
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
                                            .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                                    }
                                    
                                    VStack {
                                        HStack {
                                            Spacer()
                                            
                                            Button {
                                                self.infoCloseTapLayer = true
                                                
                                                withAnimation {
                                                    self.M1Info = true
                                                }
                                                
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                    withAnimation {
                                                        self.M1InfoText = true
                                                    }
                                                }
                                            } label: {
                                                Image(systemName: "info.circle")
                                                    .scaledToFit()
                                                    .frame(width: 18, height: 18)
                                                    .foregroundStyle(.gray.opacity(0.6))
                                                    .padding(.top, 8)
                                                    .padding(.trailing, 8)
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    
                                    VStack {
                                        HStack {
                                            Spacer()
                                            
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundStyle(.white)
                                                    .frame(width: M1Info ? 130 : 0, height: M1Info ? 120 : 0)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(lineWidth: 1.5)
                                                            .frame(width: M1Info ? 130 : 0, height: M1Info ? 120 : 0)
                                                            .foregroundStyle(Color.ESTitle)
                                                        
                                                    }
                                                    .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                                                    .padding(.top, 25)
                                                    .padding(.trailing, 25)
                                                
                                                if M1InfoText {
                                                    VStack {
                                                        Text("M1")
                                                            .font(.system(size: 15))
                                                            .fontWeight(.semibold)
                                                            .foregroundStyle(Color.ESTitle)
                                                            .padding(.bottom, 5)
                                                        
                                                        Text("현금, 요구불 예금 등 즉시 유통 가능하고 거래에 직접 사용되는 통화로 구성되며, 매월 산출돼요")
                                                            .font(.system(size: 12))
                                                            .fontWeight(.semibold)
                                                            .multilineTextAlignment(.center)
                                                    }
                                                    .padding(5)
                                                    .frame(width: 130, height: 120)
                                                    .padding(.top, 25)
                                                    .padding(.trailing, 25)
                                                }
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
                                            .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                                    }
                                    
                                    VStack {
                                        HStack {
                                            Spacer()
                                            
                                            Button {
                                                self.infoCloseTapLayer = true
                                                
                                                withAnimation {
                                                    self.M2Info = true
                                                }
                                                
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                    withAnimation {
                                                        self.M2InfoText = true
                                                    }
                                                }
                                            } label: {
                                                Image(systemName: "info.circle")
                                                    .scaledToFit()
                                                    .frame(width: 18, height: 18)
                                                    .foregroundStyle(.gray.opacity(0.6))
                                                    .padding(.top, 8)
                                                    .padding(.trailing, 8)
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    
                                    VStack {
                                        HStack {
                                            Spacer()
                                            
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundStyle(.white)
                                                    .frame(width: M2Info ? 130 : 0, height: M2Info ? 120 : 0)
                                                    .overlay {
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .stroke(lineWidth: 1.5)
                                                            .frame(width: M2Info ? 130 : 0, height: M2Info ? 120 : 0)
                                                            .foregroundStyle(Color.ESTitle)
                                                        
                                                    }
                                                    .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                                                    .padding(.top, 25)
                                                    .padding(.trailing, 25)
                                                
                                                if M2InfoText {
                                                    VStack {
                                                        Text("M2")
                                                            .font(.system(size: 15))
                                                            .fontWeight(.semibold)
                                                            .foregroundStyle(Color.ESTitle)
                                                            .padding(.bottom, 5)
                                                        
                                                        Text("M1에 저축 예금, 소액의 정기 예금 및 기타 단기 금융 상품을 포함한 보다 광범위한 통화지표로, 매월 산출돼요")
                                                            .font(.system(size: 12))
                                                            .fontWeight(.semibold)
                                                            .multilineTextAlignment(.center)
                                                    }
                                                    .padding(5)
                                                    .frame(width: 130, height: 120)
                                                    .padding(.top, 25)
                                                    .padding(.trailing, 25)
                                                }
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
                                .frame(height: 60)
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(.white)
                                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                                }
                                
                                VStack {
                                    HStack {
                                        Spacer()
                                        
                                        Button {
                                            self.infoCloseTapLayer = true
                                            
                                            withAnimation {
                                                self.EGRInfo = true
                                            }
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                withAnimation {
                                                    self.EGRInfoText = true
                                                }
                                            }
                                        } label: {
                                            Image(systemName: "info.circle")
                                                .scaledToFit()
                                                .frame(width: 18, height: 18)
                                                .foregroundStyle(.gray.opacity(0.6))
                                                .padding(.top, 8)
                                                .padding(.trailing, 8)
                                        }
                                    }
                                    
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                
                                VStack {
                                    HStack {
                                        Spacer()
                                        
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.white)
                                                .frame(width: EGRInfo ? 230 : 0, height: EGRInfo ? 120 : 0)
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(lineWidth: 1.5)
                                                        .frame(width: EGRInfo ? 230 : 0, height: EGRInfo ? 120 : 0)
                                                        .foregroundStyle(Color.ESTitle)
                                                    
                                                }
                                                .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                                                .padding(.top, 25)
                                                .padding(.trailing, 25)
                                            
                                            if EGRInfoText {
                                                VStack {
                                                    Text("경제성장률")
                                                        .font(.system(size: 18))
                                                        .fontWeight(.semibold)
                                                        .foregroundStyle(Color.ESTitle)
                                                        .padding(.bottom, 10)
                                                    
                                                    Text("경제성장률은 실질GDP가 얼마나 성장했는가를 나타내며, 매 분기별 산출돼요")
                                                        .font(.system(size: 15))
                                                        .fontWeight(.semibold)
                                                        .multilineTextAlignment(.center)
                                                }
                                                .padding(10)
                                                .frame(width: 230, height: 120)
                                                .padding(.top, 25)
                                                .padding(.trailing, 25)
                                            }
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
                                .frame(height: 60)
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(.white)
                                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                                }
                                
                                VStack {
                                    HStack {
                                        Spacer()
                                        
                                        Button {
                                            self.infoCloseTapLayer = true
                                            
                                            withAnimation {
                                                self.URInfo = true
                                            }
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                withAnimation {
                                                    self.URInfoText = true
                                                }
                                            }
                                        } label: {
                                            Image(systemName: "info.circle")
                                                .scaledToFit()
                                                .frame(width: 18, height: 18)
                                                .foregroundStyle(.gray.opacity(0.6))
                                                .padding(.top, 8)
                                                .padding(.trailing, 8)
                                        }
                                    }
                                    
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                
                                VStack {
                                    HStack {
                                        Spacer()
                                        
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.white)
                                                .frame(width: URInfo ? 180 : 0, height: URInfo ? 100 : 0)
                                                .overlay {
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(lineWidth: 1.5)
                                                        .frame(width: URInfo ? 180 : 0, height: URInfo ? 100 : 0)
                                                        .foregroundStyle(Color.ESTitle)
                                                    
                                                }
                                                .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                                                .padding(.top, 25)
                                                .padding(.trailing, 25)
                                            
                                            if URInfoText {
                                                VStack {
                                                    Text("실업률")
                                                        .font(.system(size: 18))
                                                        .fontWeight(.semibold)
                                                        .foregroundStyle(Color.ESTitle)
                                                        .padding(.bottom, 10)
                                                    
                                                    Text("경제활동인구 중 실업자의 비율로, 매월 산출돼요")
                                                        .font(.system(size: 15))
                                                        .fontWeight(.semibold)
                                                        .multilineTextAlignment(.center)
                                                }
                                                .padding(10)
                                                .frame(width: 180, height: 100)
                                                .padding(.top, 25)
                                                .padding(.trailing, 25)
                                            }
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
                    
                    if infoCloseTapLayer {
                        Color.white.opacity(0.001).ignoresSafeArea(.all)
                            .onTapGesture {
                                self.BRInfoText = false
                                self.CPIInfoText = false
                                self.WDERInfoText = false
                                self.M1InfoText = false
                                self.M2InfoText = false
                                self.EGRInfoText = false
                                self.URInfoText = false
                                
                                withAnimation {
                                    self.BRInfo = false
                                    self.CPIInfo = false
                                    self.WDERInfo = false
                                    self.M1Info = false
                                    self.M2Info = false
                                    self.EGRInfo = false
                                    self.URInfo = false
                                }
                                
                                self.infoCloseTapLayer = false
                            }
                    }
                }
            }
            .scrollIndicators(.never)
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
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image("ES_TitleLogo_Blue")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Rectangle())
                        .frame(width: 120)
                        .padding(.leading, 5)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        ZStack {
                            Image(systemName: "bell")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 21)
                                .foregroundStyle(Color.ESTitle)
                                .padding(.trailing, 5)
                            
                            //                        if viewModel.isNotificationBadge {
                            //                            Circle()
                            //                                .scaledToFit()
                            //                                .frame(width: 7)
                            //                                .foregroundStyle(.red)
                            //                                .padding(.leading, 18)
                            //                                .padding(.bottom, 24)
                            //                        }
                        }
                    }
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        navRouter.navigate(.ChatbotAIView)
                    } label: {
                        ZStack {
                            LottieView(fileName: "AIOrb", loopMode: .loop, speed: 1.4, width: 90, height: 90)
                                .blur(radius: 1.5)
                                .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
                            
                            Image("Chatbot_Toktok")
                                .resizable()
                                .frame(width: 55, height: 50)
                                .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                        }
                        .padding(.trailing, 10)
                        .padding(.bottom, 10)
                    }
                }
                .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    HomeView()
        .environment(NavigationRouter())
}
