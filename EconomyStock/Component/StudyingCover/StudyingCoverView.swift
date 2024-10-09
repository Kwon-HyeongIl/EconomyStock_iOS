//
//  StudyingCover.swift
//  EconomyStock
//
//  Created by 권형일 on 10/9/24.
//

import SwiftUI

struct StudyingCoverView: View {
    let title: String
    let lottieFileName: String
    let backgroundColor: Color
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                LottieView(fileName: lottieFileName, loopMode: .loop)
                    .scaleEffect(0.7)
                
                Text(title)
                    .foregroundStyle(.white)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .padding(.trailing, 80)
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
    StudyingCoverView(title: "기초 경제", lottieFileName: "BasicEconomyCover", backgroundColor: .yellow)
}
