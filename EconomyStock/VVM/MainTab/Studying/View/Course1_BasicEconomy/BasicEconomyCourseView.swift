//
//  Course1View.swift
//  EconomyStock
//
//  Created by 권형일 on 10/9/24.
//

import SwiftUI

struct BasicEconomyCourseView: View {
    @Environment(NavigationRouter.self) var navigationRouter: NavigationRouter
    
    var body: some View {
            ScrollView {
                VStack(spacing: 0) {
                    LottieViewConverter(fileName: "BasicEconomyCover", loopMode: .loop, width: 200, height: 200)
                    
                    Text("기초 경제")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .padding(.bottom)
                    
                    Text("시작하기")
                        .modifier(ShortButtonModifier())
                        .padding(.bottom, 30)
                    
                    VStack {
                        Text("내용 목차")
                    }
                    .modifier(TileModifier(height: 400))
                }
            }
            .modifier(NavigationBackModifier())
            .scrollIndicators(.never)
    }
}

#Preview {
    BasicEconomyCourseView()
        .environment(NavigationRouter())
}


