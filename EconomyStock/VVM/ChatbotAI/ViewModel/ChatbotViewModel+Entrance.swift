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
        let initText = self.commonInitText
        
        let messageText = "안녕하세요, 여러분의 경제 선생님 AI 톡톡이에요!\n\n공부와 관련해서 궁금한 것이 있다면 편하게 질문해주세요😆"
        let defaultChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return (initText, defaultChatMessage)
    }
    
    private func initBasicEconomyCourseEntrance() -> (String, ChatMessage) {
        let initText = "\(commonInitText) 그리고, 지금 사용자는 현재 1강 \"기초 경제\"에 대해 학습하고 있는 상황이야."
        
        let messageText = "안녕하세요, 1강 \"기초 경제\" 강의 내용에 대해 더 궁금하신 부분이 있으신가요?🧐"
        let defaultChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return (initText, defaultChatMessage)
    }
    
    private func initPriceLevelCourseEntrance() -> (String, ChatMessage) {
        let initText = "\(commonInitText) 그리고, 지금 사용자는 현재 2강 \"환율\"에 대해 학습하고 있는 상황이야."
        
        let messageText = "안녕하세요, 2강 \"환율\" 강의 내용에 대해 더 궁금하신 부분이 있으신가요?🧐"
        let defaultChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return (initText, defaultChatMessage)
    }
    
    private func initUnEmploymentCourseEntrance() -> (String, ChatMessage) {
        let initText = "\(commonInitText) 그리고, 지금 사용자는 현재 3강 \"실업\"에 대해 학습하고 있는 상황이야."
        
        let messageText = "안녕하세요, 3강 \"실업\" 강의 내용에 대해 더 궁금하신 부분이 있으신가요?🧐"
        let defaultChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return (initText, defaultChatMessage)
    }
    
    private func initMoneyAndFinanceCourseEntrance() -> (String, ChatMessage) {
        let initText = "\(commonInitText) 그리고, 지금 사용자는 현재 4강 \"화폐와 금융\"에 대해 학습하고 있는 상황이야."
        
        let messageText = "안녕하세요, 4강 \"화폐와 금융\" 강의 내용에 대해 더 궁금하신 부분이 있으신가요?🧐"
        let defaultChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return (initText, defaultChatMessage)
    }
    
    private func initExchangeRateAndBalanceOfPaymentCourseEntrance() -> (String, ChatMessage) {
        let initText = "\(commonInitText) 그리고, 지금 사용자는 현재 5강 \"환율과 국제수지\"에 대해 학습하고 있는 상황이야."
        
        let messageText = "안녕하세요, 5강 \"환율과 국제수지\" 강의 내용에 대해 더 궁금하신 부분이 있으신가요?🧐"
        let defaultChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return (initText, defaultChatMessage)
    }
}


