//
//  ProgressCircleView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/10/24.
//

import SwiftUI

struct ProgressCircleView: View {
    @State private var animatedProgressRate: Double = 0

    let progressRate: Double
    let isFinishMark: Bool
    let circleSize: CGFloat
    let circleOutStrokeSize: CGFloat
    let circleInStrokeSize: CGFloat
    let textSize: CGFloat

    var body: some View {
        if isFinishMark && progressRate == 100.0 {
            Image(systemName: "checkmark.seal")
                .resizable()
                .scaledToFit()
                .frame(width: 35)
                .fontWeight(.semibold)
                .foregroundStyle(Color(hex: "E3732A"))
            
        } else {
            ZStack {
                Circle()
                    .stroke(isFinishMark ? .gray.opacity(0.2) : Color.ESTitle.opacity(0.2), lineWidth: circleOutStrokeSize)
                    .frame(width: circleSize, height: circleSize)
                
                Circle()
                    .trim(from: 0, to: animatedProgressRate / 100)
                    .stroke(isFinishMark ? .gray : Color.ESTitle, lineWidth: circleInStrokeSize)
                    .frame(width: circleSize, height: circleSize)
                    .rotationEffect(Angle(degrees: -90))
                
                AnimatableNumberText(value: animatedProgressRate, isFinishMark: isFinishMark, textSize: textSize)
            }
            .onAppear {
                withAnimation(.easeOut(duration: 1.5)) {
                    animatedProgressRate = progressRate
                }
            }
        }
    }
}

struct AnimatableNumberText: Animatable, View {
    var value: Double
    let isFinishMark: Bool
    let textSize: CGFloat

    // Animatable 프로토콜 필수 구현 연산 프로퍼티 (네이밍 고정)
    var animatableData: Double {
        get { value }
        set { value = newValue }
    }

    var body: some View {
        Text("\(Int(value))%")
            .font(.system(size: textSize))
            .foregroundColor(isFinishMark ? .gray : Color.ESTitle)
            .fontWeight(.semibold)
    }
}

#Preview {
    ProgressCircleView(progressRate: 90, isFinishMark: true, circleSize: 30, circleOutStrokeSize: 4, circleInStrokeSize: 3, textSize: 8)
}
