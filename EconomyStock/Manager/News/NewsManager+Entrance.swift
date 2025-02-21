//
//  NewsManager+Entrance.swift
//  EconomyStock
//
//  Created by 권형일 on 2/19/25.
//

import Foundation

@MainActor
extension NewsManager {
    static func newsContinueNavigationAdaptor(viewModel: NewsViewModel, navRouter: NavigationRouter) {
        switch viewModel.news.type {
        case .basicEconomy:
            navRouter.navigate(.BasicEconomyNewsView(viewModel))
            
        case .priceLevel:
            navRouter.navigate(.PriceLevelNewsView(viewModel))
            
        case .unEmployment:
            navRouter.navigate(.UnEmploymentNewsView(viewModel))
            
        case .moneyAndFinance:
            navRouter.navigate(.MoneyAndFinanceNewsView(viewModel))
            
        case .exchangeRateAndBalanceOfPayment:
            navRouter.navigate(.ExchangeRateAndBalanceOfPaymentNewsView(viewModel))
        }
    }
}
