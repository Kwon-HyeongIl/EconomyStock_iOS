//
//  ChatBubble.swift
//  EconomyStock
//
//  Created by 권형일 on 12/8/24.
//

import SwiftUI

struct ChatBubbleView: View {
    let text: String
    
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 16))
                .padding()
        }
        .frame(width: 270)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

#Preview {
    ChatBubbleView(text: "Hello, World Hello, World Hello, World Hello, World Hello, World Hello, World Hello, World Hello, World Hello, World Hello, World Hello, World")
}
