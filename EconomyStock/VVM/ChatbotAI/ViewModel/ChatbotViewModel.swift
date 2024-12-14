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
    
    let commonInitText = "너는 지금부터 \"경제STOCK\"이라는 기초 경제 학습 앱의 이름이 \"AI 톡톡이\"라는 메인 캐릭터야. 앞으로 경제 관련된 질문에 답을 하고, 혹시 경제와 관련 있지 않은 질문이 들어오면 경제와 관련된 질문을 하도록 유도해. 다음 요청부터 사용자가 질문을 할건데, 이 사용자의 질문에 활기찬 말투의 존댓말을 사용해서 짧게 답변을 해줘. 참고로 더이상 인사는 하지마."
    
    init(type: ChatbotEntranceType) {
        let key = Bundle.main.infoDictionary?["GOOGLE_AI_STUDIO_KEY"] as? String ?? ""
        self.model = GenerativeModel(name: "gemini-1.5-flash", apiKey: key, generationConfig: config)
        self.type = type
        self.entranceRouter()
    }
    
    @MainActor
    func requestChatbot() async {
        let userPrompt = self.prompt
        
        self.prompt = ""
        
        withAnimation(.smooth(duration: 1.0)) {
            self.messages.append(ChatMessage(text: userPrompt, isUser: true))
        }
        
        do {
            let chat = model.startChat(history: history)
            let contentStream = chat.sendMessageStream(userPrompt)
            
            let messageID = UUID()
            
            let streamedMessage = ChatMessage(id: messageID, text: "", isUser: false)
            self.messages.append(streamedMessage)
            
            for try await chunk in contentStream {
                if let text = chunk.text {
                    withAnimation(.smooth(duration: 0.5)) {
                        if let index = self.messages.lastIndex(where: { $0.id == messageID }) {
                            self.messages[index].text += text
                        }
                    }
                }
            }
            
            // 마지막 줄바꿈 문자 제거
            if let index = self.messages.lastIndex(where: { $0.id == messageID }) {
                let currentText = self.messages[index].text
                if currentText.hasSuffix("\n") {
                    self.messages[index].text = String(currentText.dropLast())
                }
            }
            
            // 채팅 내역 기록
            self.history.append(ModelContent(role: "user", parts: userPrompt))
            self.history.append(ModelContent(role: "model", parts: messages.last?.text ?? ""))
            
        } catch {
            withAnimation(.smooth(duration: 1.0)) {
                self.messages.append(ChatMessage(text: "Error", isUser: false))
            }
        }
    }
}
