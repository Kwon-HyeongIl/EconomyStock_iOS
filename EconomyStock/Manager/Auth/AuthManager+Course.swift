//
//  AuthManager+Course.swift
//  EconomyStock
//
//  Created by 권형일 on 10/11/24.
//

import Foundation
import FirebaseFirestore

extension AuthManager {
    func updateCourseProgressSavePage(courseType: CourseType, progressSavePage: Int) async {
        var editedData: [String: Any] = [:]
        
        let courseTypeProgressSavePage: String
        
        switch courseType {
            
        case .basicEconomy:
            courseTypeProgressSavePage = "basicEconomyProgressSavePage"
        case .priceLevel:
            courseTypeProgressSavePage = "priceLevelProgressSavePage"
        }
        
        editedData["studyingCourse.\(courseTypeProgressSavePage)"] = progressSavePage
        
        guard let userId = AuthManager.shared.currentUser?.id else { return }
        
        do {
            try await Firestore.firestore()
                .collection("User").document(userId)
                .updateData(editedData)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func updateCourseLastPage(courseType: CourseType, lastPage: Int) async {
        var editedData: [String: Any] = [:]
        
        let courseTypeLastPage: String
        
        switch courseType {
            
        case .basicEconomy:
            courseTypeLastPage = "basicEconomyLastPage"
        case .priceLevel:
            courseTypeLastPage = "priceLevelLastPage"
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
