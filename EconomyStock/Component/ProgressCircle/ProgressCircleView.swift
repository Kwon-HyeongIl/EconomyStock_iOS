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

    var body: some View {
        if progressRate == 100.0 {
            Image(systemName: "checkmark.seal")
                .resizable()
                .scaledToFit()
                .frame(width: 35)
                .fontWeight(.semibold)
                .foregroundStyle(.green)
            
        } else {
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 4)
                    .frame(width: 30, height: 30)
                
                // 진행률 원 테두리
                Circle()
                    .trim(from: 0, to: animatedProgressRate / 100)
                    .stroke(Color.gray, lineWidth: 3)
                    .frame(width: 30, height: 30)
                    .rotationEffect(Angle(degrees: -90))
                
                AnimatableNumberText(value: animatedProgressRate)
            }
            .onAppear {
                withAnimation(.easeOut(duration: 1.5)) {
                    animatedProgressRate = progressRate
                }
            }
        }
    }
}

// 숫자가 1 ~ target number 까지 차례대로 변하기 위해서 Animatable 구조체 사용
struct AnimatableNumberText: Animatable, View {
    var value: Double

    // Animatable 프로토콜 필수 구현 연산 프로퍼티 (네이밍 고정)
    var animatableData: Double {
        get { value }
        set { value = newValue }
    }

    var body: some View {
        Text("\(Int(value))%")
            .font(.system(size: 8))
            .foregroundColor(.gray)
            .fontWeight(.semibold)
    }
}

#Preview {
    ProgressCircleView(progressRate: 90)
}
