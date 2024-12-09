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
                Text(text)
                    .font(.system(size: 16))
                    .padding()
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
    ChatBubbleView(text: "Hello, World", isUser: true)
}
