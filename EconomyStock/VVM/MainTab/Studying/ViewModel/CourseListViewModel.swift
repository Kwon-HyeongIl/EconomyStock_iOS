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
    
    init() {
        initBasicEconomyCourse()
        initPriceLevelCourse()
        initUnEmploymentCourse()
        initMoneyAndFinanceCourse()
        initExchangeRateAndBalanceOfPaymentCourse()
    }
    
    // I 기초 경제
    func initBasicEconomyCourse() {
        let currentUser = AuthManager.shared.remoteUser
        
        let gradient = LinearGradient(
            gradient: Gradient(colors: [.green, Color(red: 0.75, green: 1.0, blue: 0.0)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        let parmanentProgressPage = Double(currentUser?.studyingCourse.basicEconomyParmanentProgressPage ?? 0)
        let totalPage = 11.0
        let progressRate = (parmanentProgressPage / totalPage) * 100.0
        
        let lastPage = currentUser?.studyingCourse.basicEconomyLastPage ?? 0
        
        DispatchQueue.main.async {
            self.courses.append(Course(id: UUID().uuidString, type: .basicEconomy, title: "기초 경제", number: "I", lottieFileName: "BasicEconomyCourseCover", backgroundGradient: gradient, parmanentProgressPage: Int(parmanentProgressPage), progressRate: progressRate, lastPage: lastPage, totalPage: Int(totalPage)))
        }
    }
    
    // II 물가
    func initPriceLevelCourse() {
        let currentUser = AuthManager.shared.remoteUser
        
        let gradient = LinearGradient(
            gradient: Gradient(colors: [.orange, Color(hex: "D7DF01")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        let parmanentProgressPage = Double(currentUser?.studyingCourse.priceLevelParmanentProgressPage ?? 0)
        let totalPage = 10.0
        let progressRate = (parmanentProgressPage / totalPage) * 100.0
        
        let lastPage = currentUser?.studyingCourse.priceLevelLastPage ?? 0
        
        DispatchQueue.main.async {
            self.courses.append(Course(id: UUID().uuidString, type: .priceLevel, title: "물가", number: "II", lottieFileName: "PriceLevelCourseCover", backgroundGradient: gradient, parmanentProgressPage: Int(parmanentProgressPage), progressRate: progressRate, lastPage: lastPage, totalPage: Int(totalPage)))
        }
    }
    
    // III 실업
    func initUnEmploymentCourse() {
        let currentUser = AuthManager.shared.remoteUser
        
        let gradient = LinearGradient(
            gradient: Gradient(colors: [.blue, Color(hex: "01DFD7")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        let parmanentProgressPage = Double(currentUser?.studyingCourse.unEmploymentParmanentProgressPage ?? 0)
        let totalPage = 7.0
        let progressRate = (parmanentProgressPage / totalPage) * 100.0
        
        let lastPage = currentUser?.studyingCourse.unEmploymentLastPage ?? 0
        
        DispatchQueue.main.async {
            self.courses.append(Course(id: UUID().uuidString, type: .unEmployment, title: "실업", number: "III", lottieFileName: "UnEmploymentCourseCover", backgroundGradient: gradient, parmanentProgressPage: Int(parmanentProgressPage), progressRate: progressRate, lastPage: lastPage, totalPage: Int(totalPage)))
        }
    }
    
    // IV 화폐와 금융
    func initMoneyAndFinanceCourse() {
        let currentUser = AuthManager.shared.remoteUser
        
        let gradient = LinearGradient(
            gradient: Gradient(colors: [.pink, Color(hex: "F781F3")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        let parmanentProgressPage = Double(currentUser?.studyingCourse.moneyAndFinanceParmanentProgressPage ?? 0)
        let totalPage = 19.0
        let progressRate = (parmanentProgressPage / totalPage) * 100.0
        
        let lastPage = currentUser?.studyingCourse.moneyAndFinanceLastPage ?? 0
        
        DispatchQueue.main.async {
            self.courses.append(Course(id: UUID().uuidString, type: .moneyAndFinance, title: "화폐와 금융", number: "IV", lottieFileName: "MoneyAndFinanceCourseCover", backgroundGradient: gradient, parmanentProgressPage: Int(parmanentProgressPage), progressRate: progressRate, lastPage: lastPage, totalPage: Int(totalPage)))
        }
    }
    
    // V 환율과 국제수지
    func initExchangeRateAndBalanceOfPaymentCourse() {
        let currentUser = AuthManager.shared.remoteUser
        
        let gradient = LinearGradient(
            gradient: Gradient(colors: [Color(hex: "8258FA"), .purple.opacity(0.6)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        let parmanentProgressPage = Double(currentUser?.studyingCourse.exchangeRateAndBalanceOfPaymentParmanentProgressPage ?? 0)
        let totalPage = 30.0
        let progressRate = (parmanentProgressPage / totalPage) * 100.0
        
        let lastPage = currentUser?.studyingCourse.exchangeRateAndBalanceOfPaymentLastPage ?? 0
        
        DispatchQueue.main.async {
            self.courses.append(Course(id: UUID().uuidString, type: .exchangeRateAndBalanceOfPayment, title: "환율과 국제수지", number: "V", lottieFileName: "ExchangeRateAndBalanceOfPaymentCourseCover", backgroundGradient: gradient, parmanentProgressPage: Int(parmanentProgressPage), progressRate: progressRate, lastPage: lastPage, totalPage: Int(totalPage)))
        }
    }

    func updateAllCourses() {
        courses.removeAll()
        
        initBasicEconomyCourse()
        initPriceLevelCourse()
        initUnEmploymentCourse()
        initMoneyAndFinanceCourse()
    }
}
