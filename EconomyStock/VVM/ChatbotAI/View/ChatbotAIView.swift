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
                        LottieView(fileName: "AIOrb", loopMode: .loop, speed: 1.3, width: 160, height: 160)
                            .blur(radius: 1.5)
                        
                        Image("Chatbot_Toktok")
                            .resizable()
                            .frame(width: 95, height: 90)
                    }
                    
                    ForEach(viewModel.messages) { message in
                        HStack {
                            if message.isUser {
                                Spacer()
                                
                                ChatBubbleView(text: message.text)
                                
                            } else {
                                ChatBubbleView(text: message.text)
                                
                                Spacer()
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            HStack {
                HStack {
                    TextField("질문을 입력하세요", text: $viewModel.prompt)
                        .font(.system(size: 15))
                        .padding(.horizontal)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray.opacity(0.2), lineWidth: 4)
                }
                .padding(.leading, 30)
                
                Button {
                    Task {
                        await viewModel.requestChatbot()
                    }
                } label: {
                    Circle()
                        .stroke(Color.aiGradient, lineWidth: 4)
                        .frame(width: 40, height: 40)
                        .overlay {
                            Image(systemName: "arrow.up")
                                .foregroundStyle(Color.aiGradient)
                                .fontWeight(.black)
                                .scaleEffect(1.2)
                        }
                        .padding(.leading, 5)
                        .padding(.trailing, 20)
                }
            }
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
