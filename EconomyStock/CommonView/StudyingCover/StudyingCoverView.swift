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
                        .padding(.leading, 25)
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
                        Text("\(Int(progressRate))%")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .padding(.leading, 320)
                            .padding(.bottom, 130)
                            .padding(.trailing, 5)
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
    StudyingCoverView(title: "기초 경제", lottieFileName: "BasicEconomyCover", backgroundColor: .yellow, progressRate: 100.0)
}
