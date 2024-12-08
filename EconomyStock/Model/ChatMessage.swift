//
//  ChatMessage.swift
//  EconomyStock
//
//  Created by 권형일 on 12/8/24.
//

import Foundation

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}
