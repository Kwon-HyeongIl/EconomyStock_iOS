//
//  ProfileViewModel+Alarm.swift
//  EconomyStock
//
//  Created by 권형일 on 2/27/25.
//

import Foundation

extension ProfileViewModel {
    func editNotificationType(eventNotification: Bool) async {
        if eventNotification {
            var editedData: [String : Any] = [:]
            var firebaseNotificationType: [String] = []
            firebaseNotificationType.append("event")
            editedData["notificationType"] = firebaseNotificationType
            
            let notificationType: [NotificationType] = [.event]
            
            await NotificationManager.editNotificationType(editedData: editedData, notificationType)
            
        } else {
            let editedData: [String : Any] = ["notificationType": []]
            
            let notificationType: [NotificationType] = []
            
            await NotificationManager.editNotificationType(editedData: editedData, notificationType)
        }
    }
}
