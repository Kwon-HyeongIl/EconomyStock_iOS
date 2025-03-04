//
//  ChatBubble.swift
//  EconomyStock
//
//  Created by 권형일 on 12/8/24.
//

import SwiftUI

struct ChatBubbleView: View {
    let text: String
    let isUser: Bool
    
    var body: some View {
        HStack {
            if isUser {
                Spacer()
            }
            
            HStack {
                if text.isEmpty {
                    LottieView(fileName: "AISparkle", loopMode: .loop, scale: 1.2, width: 40, height: 40)
                        .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
                        .padding()
                    
                } else {
                    Text(text)
                        .font(.system(size: 16))
                        .padding()
                }
            }
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            
            if !isUser {
                Spacer()
            }
        }
        .frame(width: 270)
    }
}

#Preview {
    ChatBubbleView(text: "", isUser: true)
}
