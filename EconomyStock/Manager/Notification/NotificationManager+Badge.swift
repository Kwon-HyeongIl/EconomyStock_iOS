//
//  NotificationManager+Badge.swift
//  EconomyStock
//
//  Created by 권형일 on 10/4/24.
//

import Foundation
import FirebaseFirestore

extension NotificationManager {
    static func notificationBadgeOn(userId: String) async {
        var editedData: [String : Any] = [:]
        editedData["isNotificationBadge"] = true
        
        do {
            try await Firestore.firestore()
                .collection("User").document(userId)
                .updateData(editedData)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    static func notificationBadgeOff() async {
        guard let userId = AuthManager.shared.currentUser?.id else { return }
        
        var editedData: [String : Any] = [:]
        editedData["isNotificationBadge"] = false
        
        do {
            try await Firestore.firestore()
                .collection("User").document(userId)
                .updateData(editedData)
            
        } catch {
            print(error.localizedDescription)
        }
    }
}

