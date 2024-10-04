//
//  Notification.swift
//  EconomyStock
//
//  Created by 권형일 on 10/4/24.
//

import Foundation

struct Notification: Codable, Identifiable {
    let id: String
    
    let type: NotificationType
    let data: String
    let title: String
    let body: String
    
    let date: Date
}
