//
//  NewsManager+ProgressSave.swift
//  EconomyStock
//
//  Created by 권형일 on 2/19/25.
//

import Foundation

extension NewsManager {
    static func updateUserNewsPageRoute(type: CourseAndNewsType, isEnd: Bool, currentPage: Int) {
        let isLogin = AuthManager.shared.isLogin
        
        let localUser = AuthManager.shared.localUser
        
        // 로컬 currentUser의 parmanentProgressPage 값 바꾸고 (기존의 값보다 큰 경우에만), 로컬 basicEconomyLastPage 값 변경
        switch type {
        case .basicEconomy:
            if isLogin {
                // User의 parmanentProgressPage 값 바꾸기 (기존의 값보다 큰 경우에만)
                if AuthManager.shared.remoteUser?.studyingNews.basicEconomyParmanentProgressPage ?? 0 < currentPage {
                    // CurrentUser의 parmanentProgressPage 값 바꾸기
                    AuthManager.shared.remoteUser?.studyingNews.basicEconomyParmanentProgressPage = currentPage
                    
                    Task {
                        // DB User의 parmanentProgressPage 값 바꾸기
                        await self.updateUserNewsParmanentProgressPage(type: type, parmanentProgressPage: currentPage)
                    }
                }
                
                // CurrentUser의 lastPage 값 바꾸기
                AuthManager.shared.remoteUser?.studyingNews.basicEconomyLastPage = (isEnd ? 1 : currentPage)
                
            } else {
                if localUser?.studyingNews.basicEconomyParmanentProgressPage ?? 0 < currentPage {
                    localUser?.studyingNews.basicEconomyParmanentProgressPage = currentPage
                    
                    localUser?.studyingNews.basicEconomyLastPage = (isEnd ? 1 : currentPage)
                    
                    // SwiftData 원본 데이터에 반영
                    DispatchQueue.main.async {
                        try? AuthManager.shared.modelContainer.mainContext.save()
                    }
                }
            }
            
        case .priceLevel:
            if isLogin {
                if AuthManager.shared.remoteUser?.studyingNews.priceLevelParmanentProgressPage ?? 0 < currentPage {
                    AuthManager.shared.remoteUser?.studyingNews.priceLevelParmanentProgressPage = currentPage
                    
                    Task {
                        await self.updateUserNewsParmanentProgressPage(type: type, parmanentProgressPage: currentPage)
                    }
                }
                
                AuthManager.shared.remoteUser?.studyingNews.priceLevelLastPage = (isEnd ? 1 : currentPage)
                
            } else {
                if localUser?.studyingNews.priceLevelParmanentProgressPage ?? 0 < currentPage {
                    localUser?.studyingNews.priceLevelParmanentProgressPage = currentPage
                    
                    localUser?.studyingNews.priceLevelLastPage = (isEnd ? 1 : currentPage)
                    
                    DispatchQueue.main.async {
                        try? AuthManager.shared.modelContainer.mainContext.save()
                    }
                }
            }
            
        case .unEmployment:
            if isLogin {
                if AuthManager.shared.remoteUser?.studyingNews.unEmploymentParmanentProgressPage ?? 0 < currentPage {
                    AuthManager.shared.remoteUser?.studyingNews.unEmploymentParmanentProgressPage = currentPage
                    
                    Task {
                        await self.updateUserNewsParmanentProgressPage(type: type, parmanentProgressPage: currentPage)
                    }
                }
                
                AuthManager.shared.remoteUser?.studyingNews.unEmploymentLastPage = (isEnd ? 1 : currentPage)
                
            } else {
                if localUser?.studyingNews.unEmploymentParmanentProgressPage ?? 0 < currentPage {
                    localUser?.studyingNews.unEmploymentParmanentProgressPage = currentPage
                    
                    localUser?.studyingNews.unEmploymentLastPage = (isEnd ? 1 : currentPage)
                    
                    DispatchQueue.main.async {
                        try? AuthManager.shared.modelContainer.mainContext.save()
                    }
                }
            }
            
        case .moneyAndFinance:
            if isLogin {
                if AuthManager.shared.remoteUser?.studyingNews.moneyAndFinanceParmanentProgressPage ?? 0 < currentPage {
                    AuthManager.shared.remoteUser?.studyingNews.moneyAndFinanceParmanentProgressPage = currentPage
                    
                    Task {
                        await self.updateUserNewsParmanentProgressPage(type: type, parmanentProgressPage: currentPage)
                    }
                }
                
                AuthManager.shared.remoteUser?.studyingNews.moneyAndFinanceLastPage = (isEnd ? 1 : currentPage)
                
            } else {
                if localUser?.studyingNews.moneyAndFinanceParmanentProgressPage ?? 0 < currentPage {
                    localUser?.studyingNews.moneyAndFinanceParmanentProgressPage = currentPage
                    
                    localUser?.studyingNews.moneyAndFinanceLastPage = (isEnd ? 1 : currentPage)
                    
                    DispatchQueue.main.async {
                        try? AuthManager.shared.modelContainer.mainContext.save()
                    }
                }
            }
            
        case .exchangeRateAndBalanceOfPayment:
            if isLogin {
                if AuthManager.shared.remoteUser?.studyingNews.exchangeRateAndBalanceOfPaymentParmanentProgressPage ?? 0 < currentPage {
                    AuthManager.shared.remoteUser?.studyingNews.exchangeRateAndBalanceOfPaymentParmanentProgressPage = currentPage
                    
                    Task {
                        await self.updateUserNewsParmanentProgressPage(type: type, parmanentProgressPage: currentPage)
                    }
                }
                
                AuthManager.shared.remoteUser?.studyingNews.exchangeRateAndBalanceOfPaymentLastPage = (isEnd ? 1 : currentPage)
                
            } else {
                if localUser?.studyingNews.exchangeRateAndBalanceOfPaymentParmanentProgressPage ?? 0 < currentPage {
                    localUser?.studyingNews.exchangeRateAndBalanceOfPaymentParmanentProgressPage = currentPage
                    
                    localUser?.studyingNews.exchangeRateAndBalanceOfPaymentLastPage = (isEnd ? 1 : currentPage)
                    
                    DispatchQueue.main.async {
                        try? AuthManager.shared.modelContainer.mainContext.save()
                    }
                }
            }
        }
        
        Task {
            // DB User의 lastPage 값 바꾸기
            await NewsManager.updateUserNewsLastPage(type: type, lastPage: (isEnd ? 1 : currentPage))
        }
    }
}
