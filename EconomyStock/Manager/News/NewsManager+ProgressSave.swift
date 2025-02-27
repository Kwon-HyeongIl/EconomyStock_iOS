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
                        
                        // 이 블록은 최대 한번만 호출
                        if isEnd {
                            // DB User의 totalStudyingPercentage 증가
                            await AuthManager.updateTotalStudyingRate()
                        }
                    }
                }
                
                // CurrentUser의 lastPage 값 바꾸기
                AuthManager.shared.remoteUser?.studyingNews.basicEconomyLastPage = (isEnd ? 0 : currentPage)
                
            } else {
                if localUser?.studyingNews.basicEconomyParmanentProgressPage ?? 0 < currentPage {
                    localUser?.studyingNews.basicEconomyParmanentProgressPage = currentPage
                    
                    if isEnd {
                        Task {
                            await AuthManager.updateTotalStudyingRate()
                        }
                    }
                }
                
                localUser?.studyingNews.basicEconomyLastPage = (isEnd ? 0 : currentPage)
            }
            
        case .priceLevel:
            if isLogin {
                if AuthManager.shared.remoteUser?.studyingNews.priceLevelParmanentProgressPage ?? 0 < currentPage {
                    AuthManager.shared.remoteUser?.studyingNews.priceLevelParmanentProgressPage = currentPage
                    
                    Task {
                        await self.updateUserNewsParmanentProgressPage(type: type, parmanentProgressPage: currentPage)
                        
                        if isEnd {
                            await AuthManager.updateTotalStudyingRate()
                        }
                    }
                }
                
                AuthManager.shared.remoteUser?.studyingNews.priceLevelLastPage = (isEnd ? 0 : currentPage)
                
            } else {
                if localUser?.studyingNews.priceLevelParmanentProgressPage ?? 0 < currentPage {
                    localUser?.studyingNews.priceLevelParmanentProgressPage = currentPage
                    
                    if isEnd {
                        Task {
                            await AuthManager.updateTotalStudyingRate()
                        }
                    }
                }
                
                localUser?.studyingNews.priceLevelLastPage = (isEnd ? 0 : currentPage)
            }
            
        case .unEmployment:
            if isLogin {
                if AuthManager.shared.remoteUser?.studyingNews.unEmploymentParmanentProgressPage ?? 0 < currentPage {
                    AuthManager.shared.remoteUser?.studyingNews.unEmploymentParmanentProgressPage = currentPage
                    
                    Task {
                        await self.updateUserNewsParmanentProgressPage(type: type, parmanentProgressPage: currentPage)
                        
                        if isEnd {
                            await AuthManager.updateTotalStudyingRate()
                        }
                    }
                }
                
                AuthManager.shared.remoteUser?.studyingNews.unEmploymentLastPage = (isEnd ? 0 : currentPage)
                
            } else {
                if localUser?.studyingNews.unEmploymentParmanentProgressPage ?? 0 < currentPage {
                    localUser?.studyingNews.unEmploymentParmanentProgressPage = currentPage
                    
                    if isEnd {
                        Task {
                            await AuthManager.updateTotalStudyingRate()
                        }
                    }
                }
                
                localUser?.studyingNews.unEmploymentLastPage = (isEnd ? 0 : currentPage)
            }
            
        case .moneyAndFinance:
            if isLogin {
                if AuthManager.shared.remoteUser?.studyingNews.moneyAndFinanceParmanentProgressPage ?? 0 < currentPage {
                    AuthManager.shared.remoteUser?.studyingNews.moneyAndFinanceParmanentProgressPage = currentPage
                    
                    Task {
                        await self.updateUserNewsParmanentProgressPage(type: type, parmanentProgressPage: currentPage)
                        
                        if isEnd {
                            await AuthManager.updateTotalStudyingRate()
                        }
                    }
                }
                
                AuthManager.shared.remoteUser?.studyingNews.moneyAndFinanceLastPage = (isEnd ? 0 : currentPage)
                
            } else {
                if localUser?.studyingNews.moneyAndFinanceParmanentProgressPage ?? 0 < currentPage {
                    localUser?.studyingNews.moneyAndFinanceParmanentProgressPage = currentPage
                    
                    if isEnd {
                        Task {
                            await AuthManager.updateTotalStudyingRate()
                        }
                    }
                }
                
                localUser?.studyingNews.moneyAndFinanceLastPage = (isEnd ? 0 : currentPage)
            }
            
        case .exchangeRateAndBalanceOfPayment:
            if isLogin {
                if AuthManager.shared.remoteUser?.studyingNews.exchangeRateAndBalanceOfPaymentParmanentProgressPage ?? 0 < currentPage {
                    AuthManager.shared.remoteUser?.studyingNews.exchangeRateAndBalanceOfPaymentParmanentProgressPage = currentPage
                    
                    Task {
                        await self.updateUserNewsParmanentProgressPage(type: type, parmanentProgressPage: currentPage)
                        
                        if isEnd {
                            await AuthManager.updateTotalStudyingRate()
                        }
                    }
                }
                
                AuthManager.shared.remoteUser?.studyingNews.exchangeRateAndBalanceOfPaymentLastPage = (isEnd ? 0 : currentPage)
                
            } else {
                if localUser?.studyingNews.exchangeRateAndBalanceOfPaymentParmanentProgressPage ?? 0 < currentPage {
                    localUser?.studyingNews.exchangeRateAndBalanceOfPaymentParmanentProgressPage = currentPage
                    
                    if isEnd {
                        Task {
                            await AuthManager.updateTotalStudyingRate()
                        }
                    }
                }
                
                localUser?.studyingNews.exchangeRateAndBalanceOfPaymentLastPage = (isEnd ? 0 : currentPage)
            }
        }
        
        if isLogin {
            Task {
                // DB User의 lastPage 값 바꾸기
                await NewsManager.updateUserNewsLastPage(type: type, lastPage: (isEnd ? 0 : currentPage))
            }
            
        } else {
            // SwiftData 원본 데이터에 반영
            DispatchQueue.main.async {
                try? AuthManager.shared.modelContainer?.mainContext.save()
            }
        }
    }
}
