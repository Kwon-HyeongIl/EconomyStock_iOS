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
    var prompt = ""
    var initText = ""
    
    var convertPrompt: String {
        "\(self.initText)\n\n#\(self.prompt)#"
    }
    
    init(type: ChatbotEntranceType) {
        let key = Bundle.main.infoDictionary?["GOOGLE_AI_STUDIO_KEY"] as? String ?? ""
        self.model = GenerativeModel(name: "gemini-1.5-flash", apiKey: key)
        self.type = type
        self.entranceRouter()
    }
    
    func requestChatbot() async {
        let userPrompt = self.prompt
        let convertedPrompt = self.convertPrompt
        
        DispatchQueue.main.async {
            self.prompt = ""
        }
        
        DispatchQueue.main.async {
            withAnimation(.smooth(duration: 1.0)) {
                self.messages.append(ChatMessage(text: userPrompt, isUser: true))
            }
        }
        
        do {
            let contentStream = model.generateContentStream(convertedPrompt)
            
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
            
        } catch {
            DispatchQueue.main.async {
                withAnimation(.smooth(duration: 1.0)) {
                    self.messages.append(ChatMessage(text: "Error", isUser: false))
                }
            }
        }
    }
}
