//
//  NotificationType.swift
//  EconomyStock
//
//  Created by 권형일 on 10/2/24.
//

import Foundation

enum NotificationType: String, Codable {
    case event = "event"
    case unknown = "unknown"
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let raw = try container.decode(String.self)
        self = NotificationType(rawValue: raw) ?? .unknown
    }
}
