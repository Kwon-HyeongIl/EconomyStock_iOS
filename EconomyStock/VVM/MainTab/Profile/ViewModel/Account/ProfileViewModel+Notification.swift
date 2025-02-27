//
//  ProfileViewModel+Alarm.swift
//  EconomyStock
//
//  Created by 권형일 on 2/27/25.
//

import Foundation

extension ProfileViewModel {
    func editNotificationType(eventNotification: Bool) async {
        var editedData: [String: Any] = [:]
        var editedDataUnit: [String] = []
        var notificationType: [NotificationType] = []
        
        if eventNotification {
            editedDataUnit.append("event")
            notificationType.append(.event)
        }
        
        // 확장 가능
        
        editedData["notificationType"] = editedDataUnit
        
        await NotificationManager.editNotificationType(editedData: editedData, notificationType)
    }
}
