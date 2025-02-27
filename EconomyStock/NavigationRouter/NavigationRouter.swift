//
//  NavigationRouter.swift
//  EconomyStock
//
//  Created by 권형일 on 10/1/24.
//

import SwiftUI

@Observable
class NavigationRouter {
    var path = NavigationPath()
    
    @ViewBuilder
    func destinationNavigate(to view: NavigationDestinationPath) -> some View {
        switch view {
            
        // Auth
        case .LoginView:
            LoginView()
        case .BasicLoginView(let viewModel):
            BasicLoginView(viewModel: viewModel)
        case .BasicSignupView(let viewModel):
            BasicSignupView(viewModel: viewModel)
        case .ResetPasswordView(let viewModel):
            ResetPasswordView(viewModel: viewModel)
        case .SendEmailView(let viewModel):
            SendEmailView(viewModel: viewModel)
            
        // Chatbot
        case .ChatbotView(let type):
            ChatbotView(type: type)
        
            // 기초 경제
        case .BasicEconomy1View(let viewModel):
            BasicEconomy1View(viewModel: viewModel)
        case .BasicEconomy2View(let viewModel):
            BasicEconomy2View(viewModel: viewModel)
        case .BasicEconomy3View(let viewModel):
            BasicEconomy3View(viewModel: viewModel)
        case .BasicEconomy4View(let viewModel):
            BasicEconomy4View(viewModel: viewModel)
        case .BasicEconomy5View(let viewModel):
            BasicEconomy5View(viewModel: viewModel)
        case .BasicEconomy6View(let viewModel):
            BasicEconomy6View(viewModel: viewModel)
        case .BasicEconomy7View(let viewModel):
            BasicEconomy7View(viewModel: viewModel)
        case .BasicEconomy8View(let viewModel):
            BasicEconomy8View(viewModel: viewModel)
        case .BasicEconomy9View(let viewModel):
            BasicEconomy9View(viewModel: viewModel)
        case .BasicEconomy10View(let viewModel):
            BasicEconomy10View(viewModel: viewModel)
        case .BasicEconomy11View(let viewModel):
            BasicEconomy11View(viewModel: viewModel)
            
            // 물가
        case .PriceLevel1View(let viewModel):
            PriceLevel1View(viewModel: viewModel)
        case .PriceLevel2View(let viewModel):
            PriceLevel2View(viewModel: viewModel)
        case .PriceLevel3View(let viewModel):
            PriceLevel3View(viewModel: viewModel)
        case .PriceLevel4View(let viewModel):
            PriceLevel4View(viewModel: viewModel)
        case .PriceLevel5View(let viewModel):
            PriceLevel5View(viewModel: viewModel)
        case .PriceLevel6View(let viewModel):
            PriceLevel6View(viewModel: viewModel)
        case .PriceLevel7View(let viewModel):
            PriceLevel7View(viewModel: viewModel)
        case .PriceLevel8View(let viewModel):
            PriceLevel8View(viewModel: viewModel)
        case .PriceLevel9View(let viewModel):
            PriceLevel9View(viewModel: viewModel)
        case .PriceLevel10View(let viewModel):
            PriceLevel10View(viewModel: viewModel)
            
            // 실업
        case .UnEmployment1View(let viewModel):
            UnEmployment1View(viewModel: viewModel)
        case .UnEmployment2View(let viewModel):
            UnEmployment2View(viewModel: viewModel)
        case .UnEmployment3View(let viewModel):
            UnEmployment3View(viewModel: viewModel)
        case .UnEmployment4View(let viewModel):
            UnEmployment4View(viewModel: viewModel)
        case .UnEmployment5View(let viewModel):
            UnEmployment5View(viewModel: viewModel)
        case .UnEmployment6View(let viewModel):
            UnEmployment6View(viewModel: viewModel)
        case .UnEmployment7View(let viewModel):
            UnEmployment7View(viewModel: viewModel)
            
            // 화폐와 금융
        case .MoneyAndFinance1View(let viewModel):
            MoneyAndFinance1View(viewModel: viewModel)
        case .MoneyAndFinance2View(let viewModel):
            MoneyAndFinance2View(viewModel: viewModel)
        case .MoneyAndFinance3View(let viewModel):
            MoneyAndFinance3View(viewModel: viewModel)
        case .MoneyAndFinance4View(let viewModel):
            MoneyAndFinance4View(viewModel: viewModel)
        case .MoneyAndFinance5View(let viewModel):
            MoneyAndFinance5View(viewModel: viewModel)
        case .MoneyAndFinance6View(let viewModel):
            MoneyAndFinance6View(viewModel: viewModel)
        case .MoneyAndFinance7View(let viewModel):
            MoneyAndFinance7View(viewModel: viewModel)
        case .MoneyAndFinance8View(let viewModel):
            MoneyAndFinance8View(viewModel: viewModel)
        case .MoneyAndFinance9View(let viewModel):
            MoneyAndFinance9View(viewModel: viewModel)
        case .MoneyAndFinance10View(let viewModel):
            MoneyAndFinance10View(viewModel: viewModel)
        case .MoneyAndFinance11View(let viewModel):
            MoneyAndFinance11View(viewModel: viewModel)
        case .MoneyAndFinance12View(let viewModel):
            MoneyAndFinance12View(viewModel: viewModel)
        case .MoneyAndFinance13View(let viewModel):
            MoneyAndFinance13View(viewModel: viewModel)
        case .MoneyAndFinance14View(let viewModel):
            MoneyAndFinance14View(viewModel: viewModel)
        case .MoneyAndFinance15View(let viewModel):
            MoneyAndFinance15View(viewModel: viewModel)
        case .MoneyAndFinance16View(let viewModel):
            MoneyAndFinance16View(viewModel: viewModel)
        case .MoneyAndFinance17View(let viewModel):
            MoneyAndFinance17View(viewModel: viewModel)
        case .MoneyAndFinance18View(let viewModel):
            MoneyAndFinance18View(viewModel: viewModel)
        case .MoneyAndFinance19View(let viewModel):
            MoneyAndFinance19View(viewModel: viewModel)
            
            // 환율과 국제수지
        case .ExchangeRateAndBalanceOfPayment1View(let viewModel):
            ExchangeRateAndBalanceOfPayment1View(viewModel: viewModel)
        case .ExchangeRateAndBalanceOfPayment2View(let viewModel):
            ExchangeRateAndBalanceOfPayment2View(viewModel: viewModel)
        case .ExchangeRateAndBalanceOfPayment3View(let viewModel):
            ExchangeRateAndBalanceOfPayment3View(viewModel: viewModel)
        case .ExchangeRateAndBalanceOfPayment4View(let viewModel):
            ExchangeRateAndBalanceOfPayment4View(viewModel: viewModel)
        case .ExchangeRateAndBalanceOfPayment5View(let viewModel):
            ExchangeRateAndBalanceOfPayment5View(viewModel: viewModel)
        case .ExchangeRateAndBalanceOfPayment6View(let viewModel):
            ExchangeRateAndBalanceOfPayment6View(viewModel: viewModel)
        case .ExchangeRateAndBalanceOfPayment7View(let viewModel):
            ExchangeRateAndBalanceOfPayment7View(viewModel: viewModel)
        case .ExchangeRateAndBalanceOfPayment8View(let viewModel):
            ExchangeRateAndBalanceOfPayment8View(viewModel: viewModel)
        case .ExchangeRateAndBalanceOfPayment9View(let viewModel):
            ExchangeRateAndBalanceOfPayment9View(viewModel: viewModel)
        case .ExchangeRateAndBalanceOfPayment10View(let viewModel):
            ExchangeRateAndBalanceOfPayment10View(viewModel: viewModel)
        case .ExchangeRateAndBalanceOfPayment11View(let viewModel):
            ExchangeRateAndBalanceOfPayment11View(viewModel: viewModel)
        
        // News
        case .BasicEconomyNewsView(let viewModel):
            BasicEconomyNewsView(viewModel: viewModel)
        case .PriceLevelNewsView(let viewModel):
            PriceLevelNewsView(viewModel: viewModel)
        case .UnEmploymentNewsView(let viewModel):
            UnEmploymentNewsView(viewModel: viewModel)
        case .MoneyAndFinanceNewsView(let viewModel):
            MoneyAndFinanceNewsView(viewModel: viewModel)
        case .ExchangeRateAndBalanceOfPaymentNewsView(let viewModel):
            ExchangeRateAndBalanceOfPaymentNewsView(viewModel: viewModel)
            
        // Profile
        case .AccountInfoView(let viewModel):
            AccountInfoView(viewModel: viewModel)
        case .UpdateUsernameView(let viewModel):
            UpdateUsernameView(viewModel: viewModel)
        }
    }
    
    @MainActor
    func navigate(_ view: NavigationDestinationPath) {
        path.append(view)
    }
    
    @MainActor
    func back() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    @MainActor
    func popToRoot() {
        if !path.isEmpty {
            path.removeLast(path.count)
        }
    }
}
