//
//  CourseManager.swift
//  EconomyStock
//
//  Created by 권형일 on 12/10/24.
//

import Foundation
import FirebaseFirestore

class CourseManager {
    static func updateUserCourseParmanentProgressPage(courseType: CourseType, parmanentProgressPage: Int) async {
        var editedData: [String: Any] = [:]
        
        let courseTypeParmanentProgressPage: String
        
        switch courseType {
            
        case .basicEconomy:
            courseTypeParmanentProgressPage = "basicEconomyParmanentProgressPage"
        case .priceLevel:
            courseTypeParmanentProgressPage = "priceLevelParmanentProgressPage"
        case .unEmployment:
            courseTypeParmanentProgressPage = "unEmploymentParmanentProgressPage"
        case .moneyAndFinance:
            courseTypeParmanentProgressPage = "moneyAndFinanceParmanentProgressPage"
        case .exchangeRateAndBalanceOfPayment:
            courseTypeParmanentProgressPage = "exchangeRateAndBalanceOfPaymentParmanentProgressPage"
        }
        
        editedData["studyingCourse.\(courseTypeParmanentProgressPage)"] = parmanentProgressPage
        
        guard let userId = AuthManager.shared.currentUser?.id else { return }
        
        do {
            try await Firestore.firestore()
                .collection("User").document(userId)
                .updateData(editedData)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    static func updateUserCourseLastPage(courseType: CourseType, lastPage: Int) async {
        var editedData: [String: Any] = [:]
        
        let courseTypeLastPage: String
        
        switch courseType {
            
        case .basicEconomy:
            courseTypeLastPage = "basicEconomyLastPage"
        case .priceLevel:
            courseTypeLastPage = "priceLevelLastPage"
        case .unEmployment:
            courseTypeLastPage = "unEmploymentLastPage"
        case .moneyAndFinance:
            courseTypeLastPage = "moneyAndFinanceLastPage"
        case .exchangeRateAndBalanceOfPayment:
            courseTypeLastPage = "exchangeRateAndBalanceOfPaymentLastPage"
        }
        
        editedData["studyingCourse.\(courseTypeLastPage)"] = lastPage
        
        guard let userId = AuthManager.shared.currentUser?.id else { return }
        
        do {
            try await Firestore.firestore()
                .collection("User").document(userId)
                .updateData(editedData)
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
