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
        VStack {
            VStack {
                LottieViewRouter(fileName: "BasicEconomyCover", loopMode: .loop)
//                    .scaleEffect(0.5)
                    .border(.black)
            }
            .frame(width: 100, height: 100)
            
            Text("기초 경제")
                .font(.system(size: 25))
                .fontWeight(.bold)
                .foregroundStyle(.black)
                .border(.black)
            
            Spacer()
        }
        .modifier(NavigationBackModifier())
    }
}

#Preview {
    BasicEconomyCourseView()
        .environment(NavigationRouter())
}


