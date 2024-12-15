//
//  CourseCompletionViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 12/10/24.
//

import Foundation

@Observable
class CourseCompletionViewModel {
    let type: CourseType
    
    let currentPage: Int
    var courseName = ""
    var courseCover = ""
    
    init(type: CourseType, currentPage: Int) {
        self.type = type
        self.currentPage = currentPage
        initCourseName()
    }
    
    private func initCourseName() {
        switch type {
            
        case .basicEconomy:
            self.courseName = "I 기초 경제"
            self.courseCover = "BasicEconomyCourseCover"
            
        case .priceLevel:
            self.courseName = "II 물가"
            self.courseCover = "PriceLevelCourseCover"
            
        case .unEmployment:
            self.courseName = "III 실업"
            self.courseCover = "UnEmploymentCourseCover"
            
        case .moneyAndFinance:
            self.courseName = "IV 화폐와 금융"
            self.courseCover = "MoneyAndFinanceCourseCover"
            
        case .exchangeRateAndBalanceOfPayment:
            self.courseName = "V 환율과 국제수지"
            self.courseCover = "ExchangeRateAndBalanceOfPaymentCourseCover"
        }
    }
    
    func updateUserCoursePage() async {
        CourseManager.updateUserCoursePageRoute(type: type, isEnd: true, currentPage: currentPage)
    }
}
