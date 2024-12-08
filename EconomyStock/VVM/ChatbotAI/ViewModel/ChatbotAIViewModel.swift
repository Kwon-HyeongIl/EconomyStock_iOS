//
//  ChatbotAIViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 12/7/24.
//

import Foundation
import GoogleGenerativeAI

@Observable
class ChatbotAIViewModel {
    var chatbotAIModel: GenerativeModel
    
    init() {
        let key = Bundle.main.infoDictionary?["GOOGLE_AI_STUDIO_KEY"] as? String ?? ""
        self.chatbotAIModel = GenerativeModel(name: "gemini-1.5-flash", apiKey: key)
    }
}
