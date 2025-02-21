//
//  NewsViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 12/31/24.
//

import Foundation

@Observable
class NewsViewModel: Hashable, Equatable {
    let news: News
    
    var currentPage = 0
    
    var isLogin: Bool {
        AuthManager.shared.isLogin
    }
    
    init(news: News) {
        self.news = news
    }
    
    @MainActor
    func newsContinue(viewModel: NewsViewModel, navRouter: NavigationRouter) {
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
    
    
    static func == (lhs: NewsViewModel, rhs: NewsViewModel) -> Bool {
        lhs.news.id == rhs.news.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(news.id)
    }
}
