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
    
    var body: some View {
        ScrollView {
//            LazyVStack {
//                ForEach(viewModel.baseRate, id: \.self) { cycleData in
//                    Text("\(cycleData.statName)")
//                    Text(cycleData.time)
//                    Text("\(cycleData.dataValue)\(cycleData.unitName)")
//                        .padding(.bottom)
//                    
//                }
//            }
            
            
            VStack {
                Chart {
                    ForEach(viewModel.baseRate) { cycleData in
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
                                .offset(x: (plotWidth / CGFloat(viewModel.baseRate.count)) / 2)
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
                    AxisMarks(values: ["1월1일", "3월1일", "6월1일", "9월1일", "12월1일"])
                }
                .chartYScale(domain: 0...6)
                .chartOverlay(content: { proxy in
                    GeometryReader{innerProxy in
                        Rectangle()
                            .fill(.clear).contentShape(Rectangle())
                            .gesture(
                                DragGesture()
                                    .onChanged { value in
                                        let location = value.location
                                        if let day: String = proxy.value(atX: location.x) {
                                            if let currentItem = viewModel.baseRate.first(where: { $0.time == day }) {
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
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                        withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 0.8, blendDuration: 0.8)) {
                            chartAni = true
                        }
                    }
                }
                .padding(.top, 100)
            }
        }
    }
}

#Preview {
    HomeView()
}
