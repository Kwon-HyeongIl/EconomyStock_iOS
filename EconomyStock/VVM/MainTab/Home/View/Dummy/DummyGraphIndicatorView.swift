//
//  GraphIndicatorDummyView.swift
//  EconomyStock
//
//  Created by 권형일 on 12/6/24.
//

import SwiftUI
import Shimmer

struct DummyGraphIndicatorView: View {
    var body: some View {
        VStack {
            HStack {
                Text("기준금리")
                    .font(.system(size: 23).bold())
                    .fixedSize()
                
                    (Text("DUMMY")
                     + Text(" ")
                        .font(.system(size: 15))
                     + Text("%")
                        .font(.system(size: 15))
                    )
                    .font(.system(size: 21).bold())
                    .padding(.leading, 13)
                    .padding(.trailing, 5)
                    .padding(.bottom, 2)
                
                    VStack {
                        HStack(spacing: 0) {
                                LottieView(fileName: "EconomicIndicatorUp", loopMode: .playOnce, scale: 2.4, width: 20, height: 20)
                                    .rotationEffect(.degrees(180))
                                
                                (Text("DUMMY")
                                 + Text(" ")
                                    .font(.system(size: 11))
                                 + Text("%")
                                    .font(.system(size: 9))
                                )
                                .font(.system(size: 14).bold())
                                .foregroundStyle(Color(hex: "D92B2B"))
                        }
                        
                        Text("DUMMY DUM)")
                            .font(.system(size: 8))
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                            .padding(.leading, 5)
                    }

               Spacer()
            }
            
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 200)
        }
        .redacted(reason: .placeholder)
        .shimmering(bandSize: 0.4)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.white)
                .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
        }
    }
}
