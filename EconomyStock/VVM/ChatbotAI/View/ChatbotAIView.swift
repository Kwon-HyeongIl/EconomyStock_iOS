//
//  ChatbotAIView.swift
//  EconomyStock
//
//  Created by 권형일 on 12/7/24.
//

import SwiftUI

struct ChatbotAIView: View {
    @State private var viewModel = ChatbotAIViewModel()
    
    @State private var bubble = false
    @State private var bubbleContent = false
    
    var body: some View {
        ZStack {
            LottieView(fileName: "AIBackground", loopMode: .loop, scale: 1.75, width: 300, height: 525)
                .opacity(0.3)
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    ZStack {
                        LottieView(fileName: "AIOrb", loopMode: .loop, speed: 1.3, width: 160, height: 160)
                            .blur(radius: 1.5)
                        
                        Image("Chatbot_Toktok")
                            .resizable()
                            .frame(width: 95, height: 90)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .modifier(NavigationBackModifier())
    }
}

#Preview {
    ChatbotAIView()
        .environment(NavigationRouter())
}
