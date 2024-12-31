//
//  NewsViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 12/30/24.
//

import SwiftUI

@Observable
class NewsListViewModel {
    var newsList: [News] = []
    
    var isLogin: Bool {
        AuthManager.shared.isLogin
    }
    
    var remoteUser: User? {
        AuthManager.shared.remoteUser
    }
    var localUser: LocalUser? {
        AuthManager.shared.localUser
    }
    
    var isFirstLoad = true
    
    init() {
        initBasicEconomyNews()
        initPriceLevelNews()
        initUnEmploymentNews()
        initMoneyAndFinanceNews()
        initExchangeRateAndBalanceOfPaymentNews()
    }
    
    // I 기초 경제
    func initBasicEconomyNews() {
        let gradient = LinearGradient(
            gradient: Gradient(colors: [.green, Color(red: 0.75, green: 1.0, blue: 0.0)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        let parmanentProgressPage = Double(isLogin ? remoteUser?.studyingNews.basicEconomyParmanentProgressPage ?? 0 : localUser?.studyingNews.basicEconomyParmanentProgressPage ?? 0)
        let totalPage = 11.0
        let progressRate = (parmanentProgressPage / totalPage) * 100.0
        
        let lastPage = isLogin ? remoteUser?.studyingNews.basicEconomyLastPage ?? 0 : localUser?.studyingNews.basicEconomyLastPage ?? 0
        
        DispatchQueue.main.async {
            self.newsList.append(News(id: UUID().uuidString, type: .basicEconomy, title: "기초 경제", articleTitle: "소비 투자 활황... 국민소득 5% 증가", number: "I", lottieFileName: "BasicEconomyCourseCover", backgroundGradient: gradient, parmanentProgressPage: Int(parmanentProgressPage), progressRate: progressRate, lastPage: lastPage, totalPage: Int(totalPage)))
        }
    }
    
    // II 물가
    func initPriceLevelNews() {
        let gradient = LinearGradient(
            gradient: Gradient(colors: [.orange, Color(hex: "D7DF01")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        let parmanentProgressPage = Double(isLogin ? remoteUser?.studyingNews.priceLevelParmanentProgressPage ?? 0 : localUser?.studyingNews.priceLevelParmanentProgressPage ?? 0)
        let totalPage = 10.0
        let progressRate = (parmanentProgressPage / totalPage) * 100.0
        
        let lastPage = isLogin ? remoteUser?.studyingNews.priceLevelLastPage ?? 0 : localUser?.studyingNews.priceLevelLastPage ?? 0
        
        DispatchQueue.main.async {
            self.newsList.append(News(id: UUID().uuidString, type: .priceLevel, title: "물가", articleTitle: "고공행진 인플레이션, 서민 경제 직격탄", number: "II", lottieFileName: "PriceLevelCourseCover", backgroundGradient: gradient, parmanentProgressPage: Int(parmanentProgressPage), progressRate: progressRate, lastPage: lastPage, totalPage: Int(totalPage)))
        }
    }
    
    // III 실업
    func initUnEmploymentNews() {
        let gradient = LinearGradient(
            gradient: Gradient(colors: [.blue, Color(hex: "01DFD7")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        let parmanentProgressPage = Double(isLogin ? remoteUser?.studyingNews.unEmploymentParmanentProgressPage ?? 0 : localUser?.studyingNews.unEmploymentParmanentProgressPage ?? 0)
        let totalPage = 7.0
        let progressRate = (parmanentProgressPage / totalPage) * 100.0
        
        let lastPage = isLogin ? remoteUser?.studyingNews.unEmploymentLastPage ?? 0 : localUser?.studyingNews.unEmploymentLastPage ?? 0
        
        DispatchQueue.main.async {
            self.newsList.append(News(id: UUID().uuidString, type: .unEmployment, title: "실업", articleTitle: "실망노동자 증가... 실업률 통계에 잡히지 않는 '보이지 않는 위기'", number: "III", lottieFileName: "UnEmploymentCourseCover", backgroundGradient: gradient, parmanentProgressPage: Int(parmanentProgressPage), progressRate: progressRate, lastPage: lastPage, totalPage: Int(totalPage)))
        }
    }
    
    // IV 화폐와 금융
    func initMoneyAndFinanceNews() {
        let gradient = LinearGradient(
            gradient: Gradient(colors: [.pink, Color(hex: "F781F3")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        let parmanentProgressPage = Double(isLogin ? remoteUser?.studyingNews.moneyAndFinanceParmanentProgressPage ?? 0 : localUser?.studyingNews.moneyAndFinanceParmanentProgressPage ?? 0)
        let totalPage = 19.0
        let progressRate = (parmanentProgressPage / totalPage) * 100.0
        
        let lastPage = isLogin ? remoteUser?.studyingNews.moneyAndFinanceLastPage ?? 0 : localUser?.studyingNews.moneyAndFinanceLastPage ?? 0
        
        DispatchQueue.main.async {
            self.newsList.append(News(id: UUID().uuidString, type: .moneyAndFinance, title: "화폐와 금융", articleTitle: "한국은행, 화폐공급 확대... 경기 부양 속 물가 우려", number: "IV", lottieFileName: "MoneyAndFinanceCourseCover", backgroundGradient: gradient, parmanentProgressPage: Int(parmanentProgressPage), progressRate: progressRate, lastPage: lastPage, totalPage: Int(totalPage)))
        }
    }
    
    // V 환율과 국제수지
    func initExchangeRateAndBalanceOfPaymentNews() {
        let gradient = LinearGradient(
            gradient: Gradient(colors: [Color(hex: "8258FA"), .purple.opacity(0.6)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        let parmanentProgressPage = Double(isLogin ? remoteUser?.studyingNews.exchangeRateAndBalanceOfPaymentParmanentProgressPage ?? 0 : localUser?.studyingNews.exchangeRateAndBalanceOfPaymentParmanentProgressPage ?? 0)
        let totalPage = 30.0
        let progressRate = (parmanentProgressPage / totalPage) * 100.0
        
        let lastPage = isLogin ? remoteUser?.studyingNews.exchangeRateAndBalanceOfPaymentLastPage ?? 0 : localUser?.studyingNews.exchangeRateAndBalanceOfPaymentLastPage ?? 0
        
        DispatchQueue.main.async {
            self.newsList.append(News(id: UUID().uuidString, type: .exchangeRateAndBalanceOfPayment, title: "환율과 국제수지", articleTitle: "환율 폭등 속 금리 인하... 시장 불안 가중", number: "V", lottieFileName: "ExchangeRateAndBalanceOfPaymentCourseCover", backgroundGradient: gradient, parmanentProgressPage: Int(parmanentProgressPage), progressRate: progressRate, lastPage: lastPage, totalPage: Int(totalPage)))
        }
    }

    func updateAllCourses() {
        DispatchQueue.main.async {
            self.newsList.removeAll()
        }
        
        initBasicEconomyNews()
        initPriceLevelNews()
        initUnEmploymentNews()
        initMoneyAndFinanceNews()
        initExchangeRateAndBalanceOfPaymentNews()
    }
}
