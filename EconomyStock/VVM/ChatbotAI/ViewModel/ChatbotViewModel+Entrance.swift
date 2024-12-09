//
//  ChatbotViewModel+Entrance.swift
//  EconomyStock
//
//  Created by 권형일 on 12/9/24.
//

import SwiftUI
import GoogleGenerativeAI

extension ChatbotViewModel {
    func entranceRouter() {
        let data: (String, ChatMessage)
        
        switch self.type {
            
        case .main:
            data = initMainEntrance()
        case .basicEconomyCourse:
            data = initBasicEconomyCourseEntrance()
        case .priceLevelCourse:
            data = initPriceLevelCourseEntrance()
        case .unEmploymentCourse:
            data = initUnEmploymentCourseEntrance()
        case .moneyAndFinanceCourse:
            data = initMoneyAndFinanceCourseEntrance()
        case .exchangeRateAndBalanceOfPaymentCourse:
            data = initExchangeRateAndBalanceOfPaymentCourseEntrance()
        }
        
        self.history.append(ModelContent(role: "user", parts: data.0))
        
        DispatchQueue.main.async {
            withAnimation(.smooth(duration: 1.0)) {
                self.messages.append(data.1)
            }
        }
    }
    
    private func initMainEntrance() -> (String, ChatMessage) {
        let initText = "너는 지금부터 \"경제STOCK\"이라는 기초 경제 학습 앱의 이름이 \"톡톡이\"라는 메인 캐릭터야. 앞으로 경제 관련된 질문에 답을 하고, 혹시 경제와 관련 있지 않은 질문이 들어오면 경제와 관련된 질문을 하도록 유도해. 다음 요청부터 사용자가 질문을 할건데, 이 사용자의 질문에 활기찬 말투의 존댓말을 사용해서 답변을해줘."
        
        let messageText = "안녕하세요, 여러분의 경제 선생님 톡톡이에요!\n\n공부와 관련해서 궁금한 것이 있다면 편하게 질문해주세요😆"
        let defaultChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return (initText, defaultChatMessage)
    }
    
    private func initBasicEconomyCourseEntrance() -> (String, ChatMessage) {
        let initText = ""
        
        let messageText = ""
        let defaultChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return (initText, defaultChatMessage)
    }
    
    private func initPriceLevelCourseEntrance() -> (String, ChatMessage) {
        let initText = ""
        
        let messageText = ""
        let defaultChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return (initText, defaultChatMessage)
    }
    
    private func initUnEmploymentCourseEntrance() -> (String, ChatMessage) {
        let initText = ""
        
        let messageText = ""
        let defaultChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return (initText, defaultChatMessage)
    }
    
    private func initMoneyAndFinanceCourseEntrance() -> (String, ChatMessage) {
        let initText = ""
        
        let messageText = ""
        let defaultChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return (initText, defaultChatMessage)
    }
    
    private func initExchangeRateAndBalanceOfPaymentCourseEntrance() -> (String, ChatMessage) {
        let initText = ""
        
        let messageText = ""
        let defaultChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return (initText, defaultChatMessage)
    }
}


