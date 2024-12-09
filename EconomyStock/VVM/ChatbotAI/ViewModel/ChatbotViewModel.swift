//
//  ChatbotAIViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 12/7/24.
//

import SwiftUI
import GoogleGenerativeAI

@Observable
class ChatbotViewModel {
    var model: GenerativeModel
    
    let type: ChatbotEntranceType
    var messages = [ChatMessage]()
    var history = [ModelContent]()
    let config = GenerationConfig(maxOutputTokens: 300)
    var prompt = ""
    
    init(type: ChatbotEntranceType) {
        let key = Bundle.main.infoDictionary?["GOOGLE_AI_STUDIO_KEY"] as? String ?? ""
        self.model = GenerativeModel(name: "gemini-1.5-flash", apiKey: key, generationConfig: config)
        self.type = type
        self.entranceRouter()
    }
    
    func requestChatbot() async {
        let userPrompt = self.prompt
        
        DispatchQueue.main.async {
            self.prompt = ""
        }
        
        DispatchQueue.main.async {
            withAnimation(.smooth(duration: 1.0)) {
                self.messages.append(ChatMessage(text: userPrompt, isUser: true))
            }
        }
        
        do {
            let chat = model.startChat(history: history)
            let contentStream = chat.sendMessageStream(userPrompt)
            
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
            
            // 마지막 줄바꿈 문자 제거
            DispatchQueue.main.async {
                if let index = self.messages.lastIndex(where: { $0.id == messageID }) {
                    let currentText = self.messages[index].text
                    if currentText.hasSuffix("\n") {
                        self.messages[index].text = String(currentText.dropLast())
                    }
                }
            }
            
            // 채팅 내역 기록
            self.history.append(ModelContent(role: "user", parts: userPrompt))
            self.history.append(ModelContent(role: "model", parts: messages.last?.text ?? ""))
            
        } catch {
            DispatchQueue.main.async {
                withAnimation(.smooth(duration: 1.0)) {
                    self.messages.append(ChatMessage(text: "Error", isUser: false))
                }
            }
        }
    }
}
