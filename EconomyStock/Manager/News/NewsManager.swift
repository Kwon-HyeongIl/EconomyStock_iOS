//
//  NewsManager.swift
//  EconomyStock
//
//  Created by 권형일 on 2/19/25.
//

import Foundation
import FirebaseFirestore

class NewsManager {
    static func updateUserNewsParmanentProgressPage(type: CourseAndNewsType, parmanentProgressPage: Int) async {
        var editedData: [String: Any] = [:]
        
        let newsTypeParmanentProgressPage: String
        
        switch type {
            
        case .basicEconomy:
            newsTypeParmanentProgressPage = "basicEconomyParmanentProgressPage"
        case .priceLevel:
            newsTypeParmanentProgressPage = "priceLevelParmanentProgressPage"
        case .unEmployment:
            newsTypeParmanentProgressPage = "unEmploymentParmanentProgressPage"
        case .moneyAndFinance:
            newsTypeParmanentProgressPage = "moneyAndFinanceParmanentProgressPage"
        case .exchangeRateAndBalanceOfPayment:
            newsTypeParmanentProgressPage = "exchangeRateAndBalanceOfPaymentParmanentProgressPage"
        }
        
        editedData["studyingNews.\(newsTypeParmanentProgressPage)"] = parmanentProgressPage
        
        guard let userId = AuthManager.shared.remoteUser?.id else { return }
        
        do {
            try await Firestore.firestore()
                .collection("User").document(userId)
                .updateData(editedData)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    static func updateUserNewsLastPage(type: CourseAndNewsType, lastPage: Int) async {
        var editedData: [String: Any] = [:]
        
        let newsTypeLastPage: String
        
        switch type {
            
        case .basicEconomy:
            newsTypeLastPage = "basicEconomyLastPage"
        case .priceLevel:
            newsTypeLastPage = "priceLevelLastPage"
        case .unEmployment:
            newsTypeLastPage = "unEmploymentLastPage"
        case .moneyAndFinance:
            newsTypeLastPage = "moneyAndFinanceLastPage"
        case .exchangeRateAndBalanceOfPayment:
            newsTypeLastPage = "exchangeRateAndBalanceOfPaymentLastPage"
        }
        
        editedData["studyingCourse.\(newsTypeLastPage)"] = lastPage
        
        guard let userId = AuthManager.shared.remoteUser?.id else { return }
        
        do {
            try await Firestore.firestore()
                .collection("User").document(userId)
                .updateData(editedData)
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
