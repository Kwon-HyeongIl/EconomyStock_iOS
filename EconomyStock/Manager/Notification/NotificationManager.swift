//
//  NotificationManager.swift
//  EconomyStock
//
//  Created by 권형일 on 10/4/24.
//

import Foundation
import FirebaseFirestore

class NotificationManager {
    static func saveNotification(userId: String, nofitication: Notification) async {
        do {
            let encodedNotification = try Firestore.Encoder().encode(nofitication)
            
            try await Firestore.firestore()
                .collection("User").document(userId)
                .collection("Notification").document(nofitication.id)
                .setData(encodedNotification)
            
            await notificationBadgeOn(userId: userId)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    static func loadAllMyNotifications() async -> [Notification] {
        guard let userId = AuthManager.shared.remoteUser?.id else { return [] }
        
        do {
            let notificationDocuments = try await Firestore.firestore()
                .collection("User").document(userId)
                .collection("Notification").order(by: "date", descending: true)
                .getDocuments().documents
            
            return try notificationDocuments.compactMap({ document in
                try document.data(as: Notification.self)
            })
            
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    static func loadUserNotificationType(userId: String) async -> [NotificationType] {
        do {
            let document = try await Firestore.firestore()
                .collection("User").document(userId)
                .getDocument()
            
            return try document.data(as: User.self).notificationType
            
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    static func editNotificationType(editedData: [String: Any], _ notificationType: [NotificationType]) async {
        if AuthManager.shared.isLogin {
            AuthManager.shared.remoteUser?.notificationType = notificationType
            AuthManager.shared.localUser?.notificationType = notificationType
            
            guard let userId = AuthManager.shared.remoteUser?.id else { return }
            
            do {
                try await Firestore.firestore()
                    .collection("User").document(userId)
                    .updateData(editedData)
                
            } catch {
                print(error.localizedDescription)
            }
            
        } else {
            AuthManager.shared.localUser?.notificationType = notificationType
        }
    }
}
