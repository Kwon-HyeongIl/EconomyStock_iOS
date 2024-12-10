//
//  CourseManager+Router.swift
//  EconomyStock
//
//  Created by 권형일 on 12/10/24.
//

import Foundation

extension CourseManager {
    static func updateUserCoursePageRoute(type: CourseType, isEnd: Bool, currentPage: Int) {
        // 로컬 currentUser의 parmanentProgressPage 값 바꾸고 (기존의 값보다 큰 경우에만), 로컬 basicEconomyLastPage 값 변경
        switch type {
        case .basicEconomy:
            // DB User의 parmanentProgressPage 값 바꾸기 (기존의 값보다 큰 경우에만)
            if AuthManager.shared.currentUser?.studyingCourse.basicEconomyParmanentProgressPage ?? 0 < currentPage {
                AuthManager.shared.currentUser?.studyingCourse.basicEconomyParmanentProgressPage = currentPage
                
                Task {
                    await self.updateUserCourseParmanentProgressPage(courseType: type, parmanentProgressPage: currentPage)
                }
            }
            
            // CurrentUser의 lastPage 값 바꾸기 (1페이지로 초기화)
            AuthManager.shared.currentUser?.studyingCourse.basicEconomyLastPage = (isEnd ? 1 : currentPage)
            
        case .priceLevel:
            if AuthManager.shared.currentUser?.studyingCourse.priceLevelParmanentProgressPage ?? 0 < currentPage {
                AuthManager.shared.currentUser?.studyingCourse.priceLevelParmanentProgressPage = currentPage
                
                Task {
                    await self.updateUserCourseParmanentProgressPage(courseType: type, parmanentProgressPage: currentPage)
                }
            }
            
            AuthManager.shared.currentUser?.studyingCourse.priceLevelLastPage = (isEnd ? 1 : currentPage)
            
        case .unEmployment:
            if AuthManager.shared.currentUser?.studyingCourse.unEmploymentParmanentProgressPage ?? 0 < currentPage {
                AuthManager.shared.currentUser?.studyingCourse.unEmploymentParmanentProgressPage = currentPage
                
                Task {
                    await self.updateUserCourseParmanentProgressPage(courseType: type, parmanentProgressPage: currentPage)
                }
            }
            
            AuthManager.shared.currentUser?.studyingCourse.unEmploymentLastPage = (isEnd ? 1 : currentPage)
            
        case .moneyAndFinance:
            if AuthManager.shared.currentUser?.studyingCourse.moneyAndFinanceParmanentProgressPage ?? 0 < currentPage {
                AuthManager.shared.currentUser?.studyingCourse.moneyAndFinanceParmanentProgressPage = currentPage
                
                Task {
                    await self.updateUserCourseParmanentProgressPage(courseType: type, parmanentProgressPage: currentPage)
                }
            }
            
            AuthManager.shared.currentUser?.studyingCourse.moneyAndFinanceLastPage = (isEnd ? 1 : currentPage)
            
        case .exchangeRateAndBalanceOfPayment:
            if AuthManager.shared.currentUser?.studyingCourse.exchangeRateAndBalanceOfPaymentParmanentProgressPage ?? 0 < currentPage {
                AuthManager.shared.currentUser?.studyingCourse.exchangeRateAndBalanceOfPaymentParmanentProgressPage = currentPage
                
                Task {
                    await self.updateUserCourseParmanentProgressPage(courseType: type, parmanentProgressPage: currentPage)
                }
            }
            
            AuthManager.shared.currentUser?.studyingCourse.exchangeRateAndBalanceOfPaymentLastPage = (isEnd ? 1 : currentPage)
        }
    }
}
