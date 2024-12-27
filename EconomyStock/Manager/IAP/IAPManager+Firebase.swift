//
//  IAPManager+Firebase.swift
//  EconomyStock
//
//  Created by 권형일 on 12/27/24.
//

import Foundation
import FirebaseFirestore

extension IAPManager {
    func updateStockPassState() async -> Bool {
        var editedData: [String: Any] = [:]
        editedData["isStockPass"] = true
        
        guard let userId = AuthManager.shared.remoteUser?.id else { return false }
        
        do {
            try await Firestore.firestore()
                .collection("User").document(userId)
                .updateData(editedData)
            
            AuthManager.shared.remoteUser?.isStockPass = true
            
            return true
            
        } catch {
            print("스톡패스 상태 업데이트중 에러 발생", error.localizedDescription)
            return false
        }
    }
}
