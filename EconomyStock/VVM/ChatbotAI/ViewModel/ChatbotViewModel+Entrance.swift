//
//  ChatbotViewModel+Entrance.swift
//  EconomyStock
//
//  Created by 권형일 on 12/9/24.
//

import SwiftUI

extension ChatbotViewModel {
    func entranceRouter() {
        let message: ChatMessage
        
        switch self.type {
            
        case .main:
            message = initMainEntrance()
        case .basicEconomyCourse:
            message = initBasicEconomyCourseEntrance()
        case .priceLevelCourse:
            message = initPriceLevelCourseEntrance()
        case .unEmploymentCourse:
            message = initUnEmploymentCourseEntrance()
        case .moneyAndFinanceCourse:
            message = initMoneyAndFinanceCourseEntrance()
        case .exchangeRateAndBalanceOfPaymentCourse:
            message = initExchangeRateAndBalanceOfPaymentCourseEntrance()
        }
        
        DispatchQueue.main.async {
            withAnimation(.smooth(duration: 1.0)) {
                self.messages.append(message)
            }
        }
    }
    
    private func initMainEntrance() -> ChatMessage {
        self.initText = "너는 지금부터 \"경제STOCK\"이라는 기초 경제 학습 앱의 \"톡톡이\"라는 메인 캐릭터야. 경제 관련된 질문에 답을하고, 혹시 경제와 관련있지않은 질문이 들어오면 경제와 관련된 질문을 하도록 유도해. 아래의 #으로 감싼 내용이 사용자의 질문이야. 이 사용자의 질문에 상큼발랄한 말투의 존댓말을 사용해서 답변을해줘"
        
        let messageText = "안녕하세요, 여러분의 경제 선생님 AI 톡톡이에요!\n\n공부와 관련해서 궁금한 것이 있다면 편하게 질문해주세요😆"
        let basicChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return basicChatMessage
    }
    
    private func initBasicEconomyCourseEntrance() -> ChatMessage {
        let initText = ""
        
        let messageText = ""
        let basicChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return basicChatMessage
    }
    
    private func initPriceLevelCourseEntrance() -> ChatMessage {
        let initText = ""
        
        let messageText = ""
        let basicChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return basicChatMessage
    }
    
    private func initUnEmploymentCourseEntrance() -> ChatMessage {
        let initText = ""
        
        let messageText = ""
        let basicChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return basicChatMessage
    }
    
    private func initMoneyAndFinanceCourseEntrance() -> ChatMessage {
        let initText = ""
        
        let messageText = ""
        let basicChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return basicChatMessage
    }
    
    private func initExchangeRateAndBalanceOfPaymentCourseEntrance() -> ChatMessage {
        let initText = ""
        
        let messageText = ""
        let basicChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return basicChatMessage
    }
}


