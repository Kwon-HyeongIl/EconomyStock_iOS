//
//  AuthManager+Profile.swift
//  EconomyStock
//
//  Created by 권형일 on 2/27/25.
//

import Foundation
import FirebaseFirestore

extension AuthManager {
    static func updateUsername(_ username: String) async {
        var editedData: [String: Any] = [:]
        
        editedData["username"] = username
        
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
