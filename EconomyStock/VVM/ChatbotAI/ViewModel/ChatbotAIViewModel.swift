//
//  ChatbotAIViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 12/7/24.
//

import SwiftUI
import GoogleGenerativeAI

@Observable
class ChatbotAIViewModel {
    var chatbotAIModel: GenerativeModel
    
    var messages = [ChatMessage]()
    var prompt = ""
    
    init() {
        let key = Bundle.main.infoDictionary?["GOOGLE_AI_STUDIO_KEY"] as? String ?? ""
        self.chatbotAIModel = GenerativeModel(name: "gemini-1.5-flash", apiKey: key)
        self.addBasicMessge()
    }
    
    private func addBasicMessge() {
        let basicChatMessage = ChatMessage(text: "안녕하세요, 여러분의 경제 선생님 AI 톡톡이에요!\n\n공부와 관련해서 궁금한 것이 있다면 편하게 질문해주세요😆", isUser: false)
        
        DispatchQueue.main.async {
            withAnimation(.smooth(duration: 1.0)) {
                self.messages.append(basicChatMessage)
            }
        }
    }
    
    func requestChatbot() async {
        let tempPrompt = self.prompt
        
        DispatchQueue.main.async {
            self.prompt = ""
        }
        
        DispatchQueue.main.async {
            withAnimation(.smooth(duration: 1.0)) {
                self.messages.append(ChatMessage(text: tempPrompt, isUser: true))
            }
        }
        
        do {
            let response = try await chatbotAIModel.generateContent(tempPrompt)
            
            if let text = response.text {
                DispatchQueue.main.async {
                    withAnimation(.smooth(duration: 1.0)) {
                        self.messages.append(ChatMessage(text: text, isUser: false))
                    }
                }
                
            } else {
                throw ChatbotError.emptyResponse
            }
            
        } catch {
            DispatchQueue.main.async {
                withAnimation(.smooth(duration: 1.0)) {
                    self.messages.append(ChatMessage(text: "Error", isUser: false))
                }
            }
        }
    }
}
