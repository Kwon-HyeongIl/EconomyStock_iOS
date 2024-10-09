//
//  ProgressCircleView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/10/24.
//

import SwiftUI

struct ProgressCircleView: View {
    @State private var animatedProgressRate: Double = 0
    @State private var timer: Timer?
    
    let progressRate: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.2), lineWidth: 4)
                .frame(width: 30, height: 30)
            
            Circle()
                .trim(from: 0, to: animatedProgressRate / 100)
                .stroke(Color.gray, lineWidth: 3)
                .frame(width: 30, height: 30)
                .rotationEffect(Angle(degrees: -90))
            
            Text("\(Int(animatedProgressRate))%")
                .font(.system(size: 8))
                .foregroundColor(.gray)
                .fontWeight(.semibold)
        }
        .onAppear {
            let duration = 1.5
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
    }
}

#Preview {
    ProgressCircleView(progressRate: 0.5)
}
