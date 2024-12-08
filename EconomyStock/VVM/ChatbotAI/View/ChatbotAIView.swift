//
//  ChatbotAIView.swift
//  EconomyStock
//
//  Created by 권형일 on 12/7/24.
//

import SwiftUI

struct ChatbotAIView: View {
    @State private var viewModel = ChatbotAIViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ZStack {
                        LottieView(fileName: "AIOrb", loopMode: .loop, speed: 1.4, width: 160, height: 160)
                            .blur(radius: 1.5)
                            .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
                        
                        Image("Chatbot_Toktok")
                            .resizable()
                            .frame(width: 95, height: 90)
                    }
                    
                    VStack(spacing: 20) {
                        ForEach(viewModel.messages) { message in
                            HStack {
                                if message.isUser {
                                    Spacer()
                                    
                                    ChatBubbleView(text: message.text)
                                        .padding(.trailing)
                                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                                    
                                } else {
                                    ChatBubbleView(text: message.text)
                                        .padding(.leading)
                                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                                    
                                    Spacer()
                                }
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            
            HStack {
                TextField("질문을 입력하세요", text: $viewModel.prompt)
                    .font(.system(size: 15))
                    .padding(.horizontal)
                
                Button {
                    Task {
                        await viewModel.requestChatbot()
                    }
                } label: {
                    Circle()
                        .frame(width: 35, height: 35)
                        .foregroundStyle(Color.aiGradient)
                        .overlay {
                            Image(systemName: "arrow.up")
                                .foregroundStyle(.white)
                                .fontWeight(.black)
                                .scaleEffect(1.1)
                        }
                        .padding(.leading, 5)
                        .padding(.trailing, 20)
                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                }
            }
            .frame(height: 50)
            .background(.regularMaterial)
            .cornerRadius(20, corners: .allCorners)
            .padding(.horizontal)
            .padding(.bottom, 10)

        }
        .modifier(NavigationBackModifier())
        .background(LottieView(fileName: "AIBackground", loopMode: .loop, scale: 1.75, width: 300, height: 525)
            .opacity(0.4))
    }
}

#Preview {
    ChatbotAIView()
        .environment(NavigationRouter())
}
