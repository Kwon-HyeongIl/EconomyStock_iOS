//
//  StudyViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 10/9/24.
//

import SwiftUI

@Observable
class CourseListViewModel {
    var courses: [Course] = []
    
    var isLogin: Bool {
        AuthManager.shared.isLogin
    }
    
    var remoteUser: User? {
        AuthManager.shared.remoteUser
    }
    var localUser: LocalUser? {
        AuthManager.shared.localUser
    }
    
    var isFirstLoad = true // 한번 더 값을 안불러오면 아무것도 없는 초기값이 장착 됨
    
    init() {
        initBasicEconomyCourse()
        initPriceLevelCourse()
        initUnEmploymentCourse()
        initMoneyAndFinanceCourse()
        initExchangeRateAndBalanceOfPaymentCourse()
    }
    
    // I 기초 경제
    func initBasicEconomyCourse() {
        let gradient = LinearGradient(
            gradient: Gradient(colors: [.green, Color(red: 0.75, green: 1.0, blue: 0.0)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        let parmanentProgressPage = Double(isLogin ? remoteUser?.studyingCourse.basicEconomyParmanentProgressPage ?? 0 : localUser?.studyingCourse.basicEconomyParmanentProgressPage ?? 0)
        let totalPage = 11.0
        let progressRate = (parmanentProgressPage / totalPage) * 100.0
        
        let lastPage = isLogin ? remoteUser?.studyingCourse.basicEconomyLastPage ?? 0 : localUser?.studyingCourse.basicEconomyLastPage ?? 0
        
        DispatchQueue.main.async {
            self.courses.append(Course(id: UUID().uuidString, type: .basicEconomy, title: "기초 경제", number: "I", lottieFileName: "BasicEconomyCourseCover", backgroundGradient: gradient, parmanentProgressPage: Int(parmanentProgressPage), progressRate: progressRate, lastPage: lastPage, totalPage: Int(totalPage)))
        }
    }
    
    // II 물가
    func initPriceLevelCourse() {
        let gradient = LinearGradient(
            gradient: Gradient(colors: [.orange, Color(hex: "D7DF01")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        let parmanentProgressPage = Double(isLogin ? remoteUser?.studyingCourse.priceLevelParmanentProgressPage ?? 0 : localUser?.studyingCourse.priceLevelParmanentProgressPage ?? 0)
        let totalPage = 10.0
        let progressRate = (parmanentProgressPage / totalPage) * 100.0
        
        let lastPage = isLogin ? remoteUser?.studyingCourse.priceLevelLastPage ?? 0 : localUser?.studyingCourse.priceLevelLastPage ?? 0
        
        DispatchQueue.main.async {
            self.courses.append(Course(id: UUID().uuidString, type: .priceLevel, title: "물가", number: "II", lottieFileName: "PriceLevelCourseCover", backgroundGradient: gradient, parmanentProgressPage: Int(parmanentProgressPage), progressRate: progressRate, lastPage: lastPage, totalPage: Int(totalPage)))
        }
    }
    
    // III 실업
    func initUnEmploymentCourse() {
        let gradient = LinearGradient(
            gradient: Gradient(colors: [.blue, Color(hex: "01DFD7")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        let parmanentProgressPage = Double(isLogin ? remoteUser?.studyingCourse.unEmploymentParmanentProgressPage ?? 0 : localUser?.studyingCourse.unEmploymentParmanentProgressPage ?? 0)
        let totalPage = 7.0
        let progressRate = (parmanentProgressPage / totalPage) * 100.0
        
        let lastPage = isLogin ? remoteUser?.studyingCourse.unEmploymentLastPage ?? 0 : localUser?.studyingCourse.unEmploymentLastPage ?? 0
        
        DispatchQueue.main.async {
            self.courses.append(Course(id: UUID().uuidString, type: .unEmployment, title: "실업", number: "III", lottieFileName: "UnEmploymentCourseCover", backgroundGradient: gradient, parmanentProgressPage: Int(parmanentProgressPage), progressRate: progressRate, lastPage: lastPage, totalPage: Int(totalPage)))
        }
    }
    
    // IV 화폐와 금융
    func initMoneyAndFinanceCourse() {
        let gradient = LinearGradient(
            gradient: Gradient(colors: [.pink, Color(hex: "F781F3")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        let parmanentProgressPage = Double(isLogin ? remoteUser?.studyingCourse.moneyAndFinanceParmanentProgressPage ?? 0 : localUser?.studyingCourse.moneyAndFinanceParmanentProgressPage ?? 0)
        let totalPage = 19.0
        let progressRate = (parmanentProgressPage / totalPage) * 100.0
        
        let lastPage = isLogin ? remoteUser?.studyingCourse.moneyAndFinanceLastPage ?? 0 : localUser?.studyingCourse.moneyAndFinanceLastPage ?? 0
        
        DispatchQueue.main.async {
            self.courses.append(Course(id: UUID().uuidString, type: .moneyAndFinance, title: "화폐와 금융", number: "IV", lottieFileName: "MoneyAndFinanceCourseCover", backgroundGradient: gradient, parmanentProgressPage: Int(parmanentProgressPage), progressRate: progressRate, lastPage: lastPage, totalPage: Int(totalPage)))
        }
    }
    
    // V 환율과 국제수지
    func initExchangeRateAndBalanceOfPaymentCourse() {
        let gradient = LinearGradient(
            gradient: Gradient(colors: [Color(hex: "8258FA"), .purple.opacity(0.6)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        let parmanentProgressPage = Double(isLogin ? remoteUser?.studyingCourse.exchangeRateAndBalanceOfPaymentParmanentProgressPage ?? 0 : localUser?.studyingCourse.exchangeRateAndBalanceOfPaymentParmanentProgressPage ?? 0)
        let totalPage = 11.0
        let progressRate = (parmanentProgressPage / totalPage) * 100.0
        
        let lastPage = isLogin ? remoteUser?.studyingCourse.exchangeRateAndBalanceOfPaymentLastPage ?? 0 : localUser?.studyingCourse.exchangeRateAndBalanceOfPaymentLastPage ?? 0
        
        DispatchQueue.main.async {
            self.courses.append(Course(id: UUID().uuidString, type: .exchangeRateAndBalanceOfPayment, title: "환율과 국제수지", number: "V", lottieFileName: "ExchangeRateAndBalanceOfPaymentCourseCover", backgroundGradient: gradient, parmanentProgressPage: Int(parmanentProgressPage), progressRate: progressRate, lastPage: lastPage, totalPage: Int(totalPage)))
        }
    }

    func updateAllCourses() {
        DispatchQueue.main.async {
            self.courses.removeAll()
        }
        
        initBasicEconomyCourse()
        initPriceLevelCourse()
        initUnEmploymentCourse()
        initMoneyAndFinanceCourse()
        initExchangeRateAndBalanceOfPaymentCourse()
    }
}
