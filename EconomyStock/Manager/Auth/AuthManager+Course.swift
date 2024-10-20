//
//  AuthManager+Course.swift
//  EconomyStock
//
//  Created by 권형일 on 10/11/24.
//

import Foundation
import FirebaseFirestore

extension AuthManager {
    func updateCourseLastPage(courseType: CourseType, lastPage: Int) async {
        var editedData: [String: Any] = [:]
        
        let courseTypeLastPage = {
            switch courseType {
            case .basicEconomy:
                "basicEconomyLastPage"
            case .priceLevel:
                "priceLevelLastPage"
            }
        }
        
        editedData["studyingCourse.\(String(describing: courseTypeLastPage))"] = lastPage
        
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
