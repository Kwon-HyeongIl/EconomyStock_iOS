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
    }
    
    func requestChatbot() async {
        DispatchQueue.main.async {
            withAnimation(.smooth(duration: 1.0)) {
                self.messages.append(ChatMessage(text: self.prompt, isUser: true))
            }
        }
        
        do {
            let response = try await chatbotAIModel.generateContent(self.prompt)
            
            DispatchQueue.main.async {
                self.prompt = ""
            }
            
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
