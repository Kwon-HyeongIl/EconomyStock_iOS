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
            let contentStream = chatbotAIModel.generateContentStream(tempPrompt)
            
            let messageID = UUID()
            
            DispatchQueue.main.async {
                let streamedMessage = ChatMessage(id: messageID, text: "", isUser: false)
                self.messages.append(streamedMessage)
            }
            
            for try await chunk in contentStream {
                if let text = chunk.text {
                    DispatchQueue.main.async {
                        withAnimation(.smooth(duration: 0.5)) {
                            if let index = self.messages.lastIndex(where: { $0.id == messageID }) {
                                self.messages[index].text += text
                            }
                        }
                    }
                }
            }
            
            DispatchQueue.main.async {
                if let index = self.messages.lastIndex(where: { $0.id == messageID }) {
                    let currentText = self.messages[index].text
                    if currentText.hasSuffix("\n") {
                        self.messages[index].text = String(currentText.dropLast())
                    }
                }
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
