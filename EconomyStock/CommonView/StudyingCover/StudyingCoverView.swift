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
    let backgroundGradient: LinearGradient
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
                        ProgressCircleView(progressRate: progressRate)
                        .padding(.leading, 320)
                        .padding(.bottom, 120)
                    }
                }
            }
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 180)
        .background(backgroundGradient)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal, 10)
    }
}

#Preview {
    StudyingCoverView(title: "기초 경제", lottieFileName: "BasicEconomyCover", backgroundGradient: LinearGradient(
        gradient: Gradient(colors: [Color.yellow, Color.orange]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing), progressRate: 90.0)
}
