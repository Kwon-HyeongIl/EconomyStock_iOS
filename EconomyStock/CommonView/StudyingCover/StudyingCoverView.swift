//
//  StudyingCover.swift
//  EconomyStock
//
//  Created by 권형일 on 10/9/24.
//

import SwiftUI

struct StudyingCoverView: View {
    @State private var animatedProgressRate: Double = 0
    @State private var timer: Timer?
    
    let title: String
    let lottieFileName: String
    let backgroundColor: Color
    let progressRate: Double
    
    var body: some View {
        VStack {
            ZStack {
                HStack(spacing: 0) {
                    LottieViewConverter(fileName: lottieFileName, loopMode: .loop, width: 150, height: 150)
                    
                    Text(title)
                        .foregroundStyle(.white)
                        .font(.system(size: 32))
                        .fontWeight(.bold)
                        .padding(.trailing, 55)
                        .padding(.leading, 20)
                }
                
                HStack {
                    if progressRate == 100.0 {
                        Image(systemName: "checkmark.seal")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35)
                            .fontWeight(.semibold)
                            .foregroundStyle(.green)
                            .padding(.leading, 320)
                            .padding(.bottom, 120)
                        
                    } else {
                        ZStack {
                            Circle()
                                .trim(from: 0, to: animatedProgressRate / 100)
                                .stroke(.gray, lineWidth: 3)
                                .frame(width: 30, height: 30)
                                .rotationEffect(Angle(degrees: -90))
                            
                            Text("\(Int(animatedProgressRate))%")
                                .font(.system(size: 8))
                                .foregroundStyle(.gray)
                                .fontWeight(.semibold)
                        }
                        .onAppear {
                            let duration = 2.0
                            let updateInterval = 0.02
                            let totalSteps = Int(duration / updateInterval)
                            var currentStep = 0
                            let increment = progressRate / Double(totalSteps)
                            
                            timer = Timer.scheduledTimer(withTimeInterval: updateInterval, repeats: true) { _ in
                                if currentStep >= totalSteps {
                                    timer?.invalidate()
                                    timer = nil
                                    animatedProgressRate = progressRate
                                    
                                } else {
                                    animatedProgressRate += increment
                                    currentStep += 1
                                }
                            }
                        }
                        .onDisappear {
                            timer?.invalidate()
                            timer = nil
                        }
                        .padding(.leading, 320)
                        .padding(.bottom, 120)
                    }
                }
            }
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 180)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal, 10)
    }
}

#Preview {
    StudyingCoverView(title: "기초 경제", lottieFileName: "BasicEconomyCover", backgroundColor: .yellow, progressRate: 90.0)
}
