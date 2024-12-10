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
    
    func updateLastPage() {
        switch type {
        case .basicEconomy:
            if AuthManager.shared.currentUser?.studyingCourse.basicEconomyParmanentProgressPage ?? 0 < currentPage {
                AuthManager.shared.currentUser?.studyingCourse.basicEconomyParmanentProgressPage = currentPage
                
                Task {
                    await AuthManager.shared.updateCourseParmanentProgressPage(courseType: type, parmanentProgressPage: currentPage)
                }
            }
            
            // CurrentUser의 lastPage 값 바꾸기 (1페이지로 초기화)
            AuthManager.shared.currentUser?.studyingCourse.basicEconomyLastPage = 1
            
        case .priceLevel:
            if AuthManager.shared.currentUser?.studyingCourse.priceLevelParmanentProgressPage ?? 0 < currentPage {
                AuthManager.shared.currentUser?.studyingCourse.priceLevelParmanentProgressPage = currentPage
                
                Task {
                    await AuthManager.shared.updateCourseParmanentProgressPage(courseType: type, parmanentProgressPage: currentPage)
                }
            }
            
            AuthManager.shared.currentUser?.studyingCourse.priceLevelLastPage = 1
            
        case .unEmployment:
            if AuthManager.shared.currentUser?.studyingCourse.unEmploymentParmanentProgressPage ?? 0 < currentPage {
                AuthManager.shared.currentUser?.studyingCourse.unEmploymentParmanentProgressPage = currentPage
                
                Task {
                    await AuthManager.shared.updateCourseParmanentProgressPage(courseType: type, parmanentProgressPage: currentPage)
                }
            }
            
            AuthManager.shared.currentUser?.studyingCourse.unEmploymentLastPage = 1
            
        case .moneyAndFinance:
            if AuthManager.shared.currentUser?.studyingCourse.moneyAndFinanceParmanentProgressPage ?? 0 < currentPage {
                AuthManager.shared.currentUser?.studyingCourse.moneyAndFinanceParmanentProgressPage = currentPage
                
                Task {
                    await AuthManager.shared.updateCourseParmanentProgressPage(courseType: type, parmanentProgressPage: currentPage)
                }
            }
            
            AuthManager.shared.currentUser?.studyingCourse.moneyAndFinanceLastPage = 1
            
        case .exchangeRateAndBalanceOfPayment:
            if AuthManager.shared.currentUser?.studyingCourse.exchangeRateAndBalanceOfPaymentParmanentProgressPage ?? 0 < currentPage {
                AuthManager.shared.currentUser?.studyingCourse.exchangeRateAndBalanceOfPaymentParmanentProgressPage = currentPage
                
                Task {
                    await AuthManager.shared.updateCourseParmanentProgressPage(courseType: type, parmanentProgressPage: currentPage)
                }
            }
            
            AuthManager.shared.currentUser?.studyingCourse.exchangeRateAndBalanceOfPaymentLastPage = 1
        }
    }
}
