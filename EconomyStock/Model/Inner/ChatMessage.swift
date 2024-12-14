//
//  ChatMessage.swift
//  EconomyStock
//
//  Created by 권형일 on 12/8/24.
//

import Foundation

struct ChatMessage: Identifiable {
    let id: UUID
    var text: String
    let isUser: Bool
    
    
    init(id: UUID = UUID(), text: String, isUser: Bool) {
        self.id = id
        self.text = text
        self.isUser = isUser
    }
}
