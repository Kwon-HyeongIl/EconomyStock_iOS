//
//  XButton.swift
//  EconomyStock
//
//  Created by 권형일 on 1/17/25.
//

import SwiftUI

struct LottieXButton: View {
    var body: some View {
        LottieView(fileName: "CourseCompleteButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
            .padding(.top, 10)
            .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
            .overlay {
                Circle()
                    .frame(width: 52, height: 52)
                    .foregroundStyle(Color.ESTitle)
                    .overlay {
                        Text("X")
                            .font(.system(size: 25, design: .rounded).bold())
                            .foregroundStyle(.white)
                    }
                    .padding(.top, 10)
            }

    }
}
