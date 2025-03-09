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
            
        case .basicEconomyNews:
            data = initBasicEconomyNewsEntrance()
        case .priceLevelNews:
            data = initPriceLevelNewsEntrance()
        case .unEmploymentNews:
            data = initUnEmploymentNewsEntrance()
        case .moneyAndFinanceNews:
            data = initMoneyAndFinanceNewsEntrance()
        case .exchangeRateAndBalanceOfPaymentNews:
            data = initExchangeRateAndBalanceOfPaymentNewsEntrance()
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
        let initText = "\(commonInitText) 그리고, 지금 사용자는 현재 1장 \"기초 경제\"에 대해 학습하고 있는 상황이야."
        
        let messageText = "안녕하세요, 1장 \"기초 경제\" 강의 내용에 대해 더 궁금하신 부분이 있으신가요?🧐"
        let defaultChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return (initText, defaultChatMessage)
    }
    
    private func initPriceLevelCourseEntrance() -> (String, ChatMessage) {
        let initText = "\(commonInitText) 그리고, 지금 사용자는 현재 2장 \"환율\"에 대해 학습하고 있는 상황이야."
        
        let messageText = "안녕하세요, 2장 \"환율\" 강의 내용에 대해 더 궁금하신 부분이 있으신가요?🧐"
        let defaultChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return (initText, defaultChatMessage)
    }
    
    private func initUnEmploymentCourseEntrance() -> (String, ChatMessage) {
        let initText = "\(commonInitText) 그리고, 지금 사용자는 현재 3장 \"실업\"에 대해 학습하고 있는 상황이야."
        
        let messageText = "안녕하세요, 3장 \"실업\" 강의 내용에 대해 더 궁금하신 부분이 있으신가요?🧐"
        let defaultChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return (initText, defaultChatMessage)
    }
    
    private func initMoneyAndFinanceCourseEntrance() -> (String, ChatMessage) {
        let initText = "\(commonInitText) 그리고, 지금 사용자는 현재 4장 \"화폐와 금융\"에 대해 학습하고 있는 상황이야."
        
        let messageText = "안녕하세요, 4장 \"화폐와 금융\" 강의 내용에 대해 더 궁금하신 부분이 있으신가요?🧐"
        let defaultChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return (initText, defaultChatMessage)
    }
    
    private func initExchangeRateAndBalanceOfPaymentCourseEntrance() -> (String, ChatMessage) {
        let initText = "\(commonInitText) 그리고, 지금 사용자는 현재 5장 \"환율과 국제수지\"에 대해 학습하고 있는 상황이야."
        
        let messageText = "안녕하세요, 5장 \"환율과 국제수지\" 강의 내용에 대해 더 궁금하신 부분이 있으신가요?🧐"
        let defaultChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return (initText, defaultChatMessage)
    }
    
    
    private func initBasicEconomyNewsEntrance() -> (String, ChatMessage) {
        let initText = "\(commonInitText) 그리고, 지금 사용자는 현재 1장 \"기초 경제\"에 기반한 가상의 경제 신문인 \"소비•투자 활황... 국민소득 5% 증가\"에 대해 분석하고 있는 상황이야."
        
        let messageText = "안녕하세요, \"소비•투자 활황... 국민소득 5% 증가\" 뉴스 내용에 대해 더 궁금하신 부분이 있으신가요?🧐"
        let defaultChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return (initText, defaultChatMessage)
    }
    
    private func initPriceLevelNewsEntrance() -> (String, ChatMessage) {
        let initText = "\(commonInitText) 그리고, 지금 사용자는 현재 2장 \"물가\"에 기반한 가상의 경제 신문인 \"고공행진 인플레이션, 서민 경제 직격탄\"에 대해 분석하고 있는 상황이야."
        
        let messageText = "안녕하세요, \"고공행진 인플레이션, 서민 경제 직격탄\" 뉴스 내용에 대해 더 궁금하신 부분이 있으신가요?🧐"
        let defaultChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return (initText, defaultChatMessage)
    }
    
    private func initUnEmploymentNewsEntrance() -> (String, ChatMessage) {
        let initText = "\(commonInitText) 그리고, 지금 사용자는 현재 3장 \"실업\"에 기반한 가상의 경제 신문인 \"실망노동자 증가... 실업률 통계에 잡히지 않는 '보이지 않는 위기'\"에 대해 분석하고 있는 상황이야."
        
        let messageText = "안녕하세요, \"실망노동자 증가... 실업률 통계에 잡히지 않는 '보이지 않는 위기'\" 뉴스 내용에 대해 더 궁금하신 부분이 있으신가요?🧐"
        let defaultChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return (initText, defaultChatMessage)
    }
    
    private func initMoneyAndFinanceNewsEntrance() -> (String, ChatMessage) {
        let initText = "\(commonInitText) 그리고, 지금 사용자는 현재 4장 \"화폐와 금융\"에 기반한 가상의 경제 신문인 \"한국은행, 화폐공급 확대... 경기 부양 속 물가 우려\"에 대해 분석하고 있는 상황이야."
        
        let messageText = "안녕하세요, \"한국은행, 화폐공급 확대... 경기 부양 속 물가 우려\" 뉴스 내용에 대해 더 궁금하신 부분이 있으신가요?🧐"
        let defaultChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return (initText, defaultChatMessage)
    }
    
    private func initExchangeRateAndBalanceOfPaymentNewsEntrance() -> (String, ChatMessage) {
        let initText = "\(commonInitText) 그리고, 지금 사용자는 현재 5장 \"환율과 국제수지\"에 기반한 가상의 경제 신문인 \"환율 폭등 속 금리 인하... 시장 불안 가중\"에 대해 분석하고 있는 상황이야."
        
        let messageText = "안녕하세요, \"환율 폭등 속 금리 인하... 시장 불안 가중\" 뉴스 내용에 대해 더 궁금하신 부분이 있으신가요?🧐"
        let defaultChatMessage = ChatMessage(text: messageText, isUser: false)
        
        return (initText, defaultChatMessage)
    }
}


