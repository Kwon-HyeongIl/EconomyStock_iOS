//
//  AuthManager+Studying.swift
//  EconomyStock
//
//  Created by 권형일 on 2/21/25.
//

import Foundation
import FirebaseFirestore

extension AuthManager {
    static func updateTotalStudyingRate() async {
        // 로그인
        if AuthManager.shared.isLogin {
            AuthManager.shared.remoteUser?.totalStudyingRate += 10
            
            guard let userId = AuthManager.shared.remoteUser?.id else { return }
            
            do {
                try await Firestore.firestore()
                    .collection("User").document(userId)
                    .updateData(["totalStudyingRate": FieldValue.increment(10.0)])
                
            } catch {
                print(error.localizedDescription)
            }
            
        // 비로그인
        } else {
            AuthManager.shared.localUser?.totalStudyingRate += 10
        }
    }
}
