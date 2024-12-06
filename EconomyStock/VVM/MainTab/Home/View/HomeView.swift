//
//  HomeView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/4/24.
//

import SwiftUI
import Charts

struct HomeView: View {
    @State private var viewModel = HomeViewModel()
    
    @State private var chartAni = false
    @State private var currentActiveGestureItem: EconomicIndicatorCycleData?
    @State private var plotWidth: CGFloat = 0
    
    @State private var BRInfo = false
    @State private var BRInfoText = false
    
    var body: some View {
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
                                                LottieView(fileName: "EconomicIndicatorUp", loopMode: .playOnce, scale: 2.4, width: 20, height: 20)
                                                    .rotationEffect(.degrees(180))
                                                
                                                (Text("\(String(format: "%.2f", diffData.difference))")
                                                 + Text(" ")
                                                    .font(.system(size: 11))
                                                 + Text("%")
                                                    .font(.system(size: 9))
                                                )
                                                .font(.system(size: 14).bold())
                                                .foregroundStyle(Color(hex: "D92B2B"))
                                                
                                            } else {
                                                LottieView(fileName: "EconomicIndicatorDown", loopMode: .playOnce, scale: 2.4, width: 20, height: 20)
                                                    .padding(.top, 3)
                                                
                                                (Text("\(String(format: "%.2f", diffData.difference))")
                                                 + Text(" ")
                                                    .font(.system(size: 11))
                                                 + Text("%")
                                                    .font(.system(size: 9))
                                                )
                                                .font(.system(size: 14).bold())
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
                                        .frame(width: BRInfo ? 230 : 0, height: BRInfo ? 130 : 0)
                                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                                        .padding(.top, 25)
                                        .padding(.trailing, 25)
                                    
                                    VStack {
                                        Text("기준금리")
                                            .font(.system(size: 18))
                                            .fontWeight(.semibold)
                                            .foregroundStyle(Color.ESTitle)
                                            .padding(.bottom, 10)
                                        
                                        Text("기준금리는 금리 체계의 기준이 되는 금리를 의미하며, 매월 금융통화위원회에서 결정돼요.")
                                            .font(.system(size: 15))
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                    }
                                    .frame(width: 230, height: 130)
                                    .opacity(BRInfoText ? 1.0 : 0.0)
                                    .padding(.top, 25)
                                    .padding(.trailing, 25)
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
                    ZStack {
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
                                                LottieView(fileName: "EconomicIndicatorUp", loopMode: .playOnce, scale: 2.4, width: 20, height: 20)
                                                    .rotationEffect(.degrees(180))
                                                
                                                (Text("\(String(format: "%.1f", diffData.difference))")
                                                 + Text(" ")
                                                    .font(.system(size: 11))
                                                 + Text("%")
                                                    .font(.system(size: 9))
                                                )
                                                .font(.system(size: 14).bold())
                                                .foregroundStyle(Color(hex: "D92B2B"))
                                                
                                            } else {
                                                LottieView(fileName: "EconomicIndicatorDown", loopMode: .playOnce, scale: 2.4, width: 20, height: 20)
                                                    .padding(.top, 3)
                                                
                                                (Text("\(String(format: "%.1f", diffData.difference))")
                                                 + Text(" ")
                                                    .font(.system(size: 11))
                                                 + Text("%")
                                                    .font(.system(size: 9))
                                                )
                                                .font(.system(size: 14).bold())
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
                    }
                    
                } else {
                    DummyHorizontalIndicatorView()
                }
                
                if !viewModel.isRedacted {
                    ZStack {
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
                                                LottieView(fileName: "EconomicIndicatorUp", loopMode: .playOnce, scale: 2.4, width: 20, height: 20)
                                                    .rotationEffect(.degrees(180))
                                                
                                                (Text("\(String(format: "%.1f", diffData.difference))")
                                                 + Text(" ")
                                                    .font(.system(size: 11))
                                                 + Text("원")
                                                    .font(.system(size: 9))
                                                )
                                                .font(.system(size: 14).bold())
                                                .foregroundStyle(Color(hex: "D92B2B"))
                                            } else {
                                                LottieView(fileName: "EconomicIndicatorDown", loopMode: .playOnce, scale: 2.4, width: 20, height: 20)
                                                    .padding(.top, 3)
                                                
                                                (Text("\(String(format: "%.1f", diffData.difference))")
                                                 + Text(" ")
                                                    .font(.system(size: 11))
                                                 + Text("원")
                                                    .font(.system(size: 9))
                                                )
                                                .font(.system(size: 14).bold())
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
                    }
                    
                } else {
                    DummyHorizontalIndicatorView()
                }
                
                HStack(spacing: 15) {
                    if !viewModel.isRedacted {
                        ZStack {
                            VStack {
                                Text("M1")
                                    .font(.system(size: 23).bold())
                                    .padding(.bottom, 5)
                                
                                if let dataValue = viewModel.M1.last?.dataValue {
                                    (Text("\(dataValue)")
                                     + Text(" ")
                                        .font(.system(size: 15))
                                     + Text("십억원")
                                        .font(.system(size: 13))
                                    )
                                    .font(.system(size: 19).bold())
                                }
                                
                                if let diffData = viewModel.calculateRecentDataValueChangeDifference(for: viewModel.M1) {
                                    VStack {
                                        HStack(spacing: 0) {
                                            if diffData.difference > 0 {
                                                LottieView(fileName: "EconomicIndicatorUp", loopMode: .playOnce, scale: 2.3, width: 20, height: 20)
                                                    .rotationEffect(.degrees(180))
                                                
                                                (Text("\(String(format: "%.1f", diffData.difference))")
                                                 + Text(" ")
                                                    .font(.system(size: 11))
                                                 + Text("십억원")
                                                    .font(.system(size: 7))
                                                )
                                                .font(.system(size: 11).bold())
                                                .foregroundStyle(Color(hex: "D92B2B"))
                                            } else {
                                                LottieView(fileName: "EconomicIndicatorDown", loopMode: .playOnce, scale: 2.3, width: 20, height: 20)
                                                    .padding(.top, 3)
                                                
                                                (Text("\(String(format: "%.1f", diffData.difference))")
                                                 + Text(" ")
                                                    .font(.system(size: 11))
                                                 + Text("십억원")
                                                    .font(.system(size: 7))
                                                )
                                                .font(.system(size: 12).bold())
                                                .foregroundStyle(Color.ESTitle)
                                            }
                                        }
                                        
                                        Text("(\(diffData.date) 대비)")
                                            .font(.system(size: 7))
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
                        }
                        
                    } else {
                        DummyVerticalInticatorView()
                    }
                    
                    if !viewModel.isRedacted {
                        ZStack {
                            VStack {
                                Text("M2")
                                    .font(.system(size: 23).bold())
                                    .padding(.bottom, 5)
                                
                                if let dataValue = viewModel.M2.last?.dataValue {
                                    (Text("\(dataValue)")
                                     + Text(" ")
                                        .font(.system(size: 15))
                                     + Text("십억원")
                                        .font(.system(size: 13))
                                    )
                                    .font(.system(size: 19).bold())
                                }
                                
                                if let diffData = viewModel.calculateRecentDataValueChangeDifference(for: viewModel.M2) {
                                    VStack {
                                        HStack(spacing: 0) {
                                            if diffData.difference > 0 {
                                                LottieView(fileName: "EconomicIndicatorUp", loopMode: .playOnce, scale: 2.3, width: 20, height: 20)
                                                    .rotationEffect(.degrees(180))
                                                
                                                (Text("\(String(format: "%.1f", diffData.difference))")
                                                 + Text(" ")
                                                    .font(.system(size: 11))
                                                 + Text("십억원")
                                                    .font(.system(size: 7))
                                                )
                                                .font(.system(size: 12).bold())
                                                .foregroundStyle(Color(hex: "D92B2B"))
                                            } else {
                                                LottieView(fileName: "EconomicIndicatorDown", loopMode: .playOnce, scale: 2.3, width: 20, height: 20)
                                                    .padding(.top, 3)
                                                
                                                (Text("\(String(format: "%.1f", diffData.difference))")
                                                 + Text(" ")
                                                    .font(.system(size: 11))
                                                 + Text("십억원")
                                                    .font(.system(size: 7))
                                                )
                                                .font(.system(size: 12).bold())
                                                .foregroundStyle(Color.ESTitle)
                                            }
                                        }
                                        
                                        Text("(\(diffData.date) 대비)")
                                            .font(.system(size: 7))
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
                        }
                        
                    } else {
                        DummyVerticalInticatorView()
                    }
                }
                
                if !viewModel.isRedacted {
                    ZStack {
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
                                                LottieView(fileName: "EconomicIndicatorUp", loopMode: .playOnce, scale: 2.4, width: 20, height: 20)
                                                    .rotationEffect(.degrees(180))
                                                
                                                (Text("\(String(format: "%.3f", diffData.difference))")
                                                 + Text(" ")
                                                    .font(.system(size: 11))
                                                 + Text("%")
                                                    .font(.system(size: 9))
                                                )
                                                .font(.system(size: 14).bold())
                                                .foregroundStyle(Color(hex: "D92B2B"))
                                                
                                            } else {
                                                LottieView(fileName: "EconomicIndicatorDown", loopMode: .playOnce, scale: 2.4, width: 20, height: 20)
                                                    .padding(.top, 3)
                                                
                                                (Text("\(String(format: "%.3f", diffData.difference))")
                                                 + Text(" ")
                                                    .font(.system(size: 11))
                                                 + Text("%")
                                                    .font(.system(size: 9))
                                                )
                                                .font(.system(size: 14).bold())
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
                    }
                    
                } else {
                    DummyHorizontalIndicatorView()
                }
                
                if !viewModel.isRedacted {
                    ZStack {
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
                                                LottieView(fileName: "EconomicIndicatorUp", loopMode: .playOnce, scale: 2.4, width: 20, height: 20)
                                                    .rotationEffect(.degrees(180))
                                                
                                                (Text("\(String(format: "%.1f", diffData.difference))")
                                                 + Text(" ")
                                                    .font(.system(size: 11))
                                                 + Text("%")
                                                    .font(.system(size: 9))
                                                )
                                                .font(.system(size: 14).bold())
                                                .foregroundStyle(Color(hex: "D92B2B"))
                                                
                                            } else {
                                                LottieView(fileName: "EconomicIndicatorDown", loopMode: .playOnce, scale: 2.3, width: 20, height: 20)
                                                    .padding(.top, 3)
                                                
                                                (Text("\(String(format: "%.1f", diffData.difference))")
                                                 + Text(" ")
                                                    .font(.system(size: 11))
                                                 + Text("%")
                                                    .font(.system(size: 9))
                                                )
                                                .font(.system(size: 14).bold())
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
                    }
                    .padding(.bottom, 50)
                    
                } else {
                    DummyHorizontalIndicatorView()
                }
            }
            .padding()
        }
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
    }
}

#Preview {
    HomeView()
}
