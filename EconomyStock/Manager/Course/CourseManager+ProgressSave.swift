//
//  CourseManager+Router.swift
//  EconomyStock
//
//  Created by 권형일 on 12/10/24.
//

import Foundation

extension CourseManager {
    static func updateUserCoursePageRoute(type: CourseAndNewsType, isEnd: Bool, currentPage: Int) {
        let isLogin = AuthManager.shared.isLogin
        
        let localUser = AuthManager.shared.localUser
        
        // 로컬 currentUser의 parmanentProgressPage 값 바꾸고 (기존의 값보다 큰 경우에만), 로컬 basicEconomyLastPage 값 변경
        switch type {
        case .basicEconomy:
            if isLogin {
                // User의 parmanentProgressPage 값 바꾸기 (기존의 값보다 큰 경우에만)
                if AuthManager.shared.remoteUser?.studyingCourse.basicEconomyParmanentProgressPage ?? 0 < currentPage {
                    // CurrentUser의 parmanentProgressPage 값 바꾸기
                    AuthManager.shared.remoteUser?.studyingCourse.basicEconomyParmanentProgressPage = currentPage
                    
                    Task {
                        // DB User의 parmanentProgressPage 값 바꾸기
                        await self.updateUserCourseParmanentProgressPage(type: type, parmanentProgressPage: currentPage)
                    }
                }
                
                // CurrentUser의 lastPage 값 바꾸기
                AuthManager.shared.remoteUser?.studyingCourse.basicEconomyLastPage = (isEnd ? 1 : currentPage)
                
            } else {
                if localUser?.studyingCourse.basicEconomyParmanentProgressPage ?? 0 < currentPage {
                    localUser?.studyingCourse.basicEconomyParmanentProgressPage = currentPage
                    
                    localUser?.studyingCourse.basicEconomyLastPage = (isEnd ? 1 : currentPage)
                    
                    // SwiftData 원본 데이터에 반영
                    DispatchQueue.main.async {
                        try? AuthManager.shared.modelContainer.mainContext.save()
                    }
                }
            }
            
        case .priceLevel:
            if isLogin {
                if AuthManager.shared.remoteUser?.studyingCourse.priceLevelParmanentProgressPage ?? 0 < currentPage {
                    AuthManager.shared.remoteUser?.studyingCourse.priceLevelParmanentProgressPage = currentPage
                    
                    Task {
                        await self.updateUserCourseParmanentProgressPage(type: type, parmanentProgressPage: currentPage)
                    }
                }
                
                AuthManager.shared.remoteUser?.studyingCourse.priceLevelLastPage = (isEnd ? 1 : currentPage)
                
            } else {
                if localUser?.studyingCourse.priceLevelParmanentProgressPage ?? 0 < currentPage {
                    localUser?.studyingCourse.priceLevelParmanentProgressPage = currentPage
                    
                    localUser?.studyingCourse.priceLevelLastPage = (isEnd ? 1 : currentPage)
                    
                    DispatchQueue.main.async {
                        try? AuthManager.shared.modelContainer.mainContext.save()
                    }
                }
            }
            
        case .unEmployment:
            if isLogin {
                if AuthManager.shared.remoteUser?.studyingCourse.unEmploymentParmanentProgressPage ?? 0 < currentPage {
                    AuthManager.shared.remoteUser?.studyingCourse.unEmploymentParmanentProgressPage = currentPage
                    
                    Task {
                        await self.updateUserCourseParmanentProgressPage(type: type, parmanentProgressPage: currentPage)
                    }
                }
                
                AuthManager.shared.remoteUser?.studyingCourse.unEmploymentLastPage = (isEnd ? 1 : currentPage)
                
            } else {
                if localUser?.studyingCourse.unEmploymentParmanentProgressPage ?? 0 < currentPage {
                    localUser?.studyingCourse.unEmploymentParmanentProgressPage = currentPage
                    
                    localUser?.studyingCourse.unEmploymentLastPage = (isEnd ? 1 : currentPage)
                    
                    DispatchQueue.main.async {
                        try? AuthManager.shared.modelContainer.mainContext.save()
                    }
                }
            }
            
        case .moneyAndFinance:
            if isLogin {
                if AuthManager.shared.remoteUser?.studyingCourse.moneyAndFinanceParmanentProgressPage ?? 0 < currentPage {
                    AuthManager.shared.remoteUser?.studyingCourse.moneyAndFinanceParmanentProgressPage = currentPage
                    
                    Task {
                        await self.updateUserCourseParmanentProgressPage(type: type, parmanentProgressPage: currentPage)
                    }
                }
                
                AuthManager.shared.remoteUser?.studyingCourse.moneyAndFinanceLastPage = (isEnd ? 1 : currentPage)
                
            } else {
                if localUser?.studyingCourse.moneyAndFinanceParmanentProgressPage ?? 0 < currentPage {
                    localUser?.studyingCourse.moneyAndFinanceParmanentProgressPage = currentPage
                    
                    localUser?.studyingCourse.moneyAndFinanceLastPage = (isEnd ? 1 : currentPage)
                    
                    DispatchQueue.main.async {
                        try? AuthManager.shared.modelContainer.mainContext.save()
                    }
                }
            }
            
        case .exchangeRateAndBalanceOfPayment:
            if isLogin {
                if AuthManager.shared.remoteUser?.studyingCourse.exchangeRateAndBalanceOfPaymentParmanentProgressPage ?? 0 < currentPage {
                    AuthManager.shared.remoteUser?.studyingCourse.exchangeRateAndBalanceOfPaymentParmanentProgressPage = currentPage
                    
                    Task {
                        await self.updateUserCourseParmanentProgressPage(type: type, parmanentProgressPage: currentPage)
                    }
                }
                
                AuthManager.shared.remoteUser?.studyingCourse.exchangeRateAndBalanceOfPaymentLastPage = (isEnd ? 1 : currentPage)
                
            } else {
                if localUser?.studyingCourse.exchangeRateAndBalanceOfPaymentParmanentProgressPage ?? 0 < currentPage {
                    localUser?.studyingCourse.exchangeRateAndBalanceOfPaymentParmanentProgressPage = currentPage
                    
                    localUser?.studyingCourse.exchangeRateAndBalanceOfPaymentLastPage = (isEnd ? 1 : currentPage)
                    
                    DispatchQueue.main.async {
                        try? AuthManager.shared.modelContainer.mainContext.save()
                    }
                }
            }
        }
        
        if isLogin {
            Task {
                // DB User의 lastPage 값 바꾸기
                await CourseManager.updateUserCourseLastPage(type: type, lastPage: (isEnd ? 1 : currentPage))
            }
        }
    }
}
