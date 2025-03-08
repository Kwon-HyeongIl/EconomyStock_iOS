//
//  ProfileViewModel+Alarm.swift
//  EconomyStock
//
//  Created by 권형일 on 2/27/25.
//

import Foundation

/*
 나중에 항목이 늘 경우 메서드를 항목별로 분리하기
 */
extension ProfileViewModel {
    func subscribeTopic(topic: String) async {
        FCMManager.shared.subscribe(to: topic)
        
        await self.editNotificationType(true)
    }
    
    func unsubscribeTopic(topic: String) async {
        FCMManager.shared.unsubscribe(from: topic)
        
        await self.editNotificationType(false)
    }
    
    private func editNotificationType(_ eventNotification: Bool) async {
        var editedData: [String: Any] = [:]
        var editedDataUnit: [String] = []
        var notificationType: [NotificationType] = []
        
        if eventNotification {
            editedDataUnit.append("event")
            notificationType.append(.event)
        }
        
        editedData["notificationType"] = editedDataUnit
        
        await NotificationManager.editNotificationType(editedData: editedData, notificationType)
    }
}
