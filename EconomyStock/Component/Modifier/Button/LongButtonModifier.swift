//
//  LognButtonModifier.swift
//  EconomyStock
//
//  Created by 권형일 on 10/8/24.
//

import SwiftUI

struct LongButtonModifier: ViewModifier {
    let bgColor: Color = .ESTitle
    
    func body(content: Content) -> some View {
        content
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 45)
            .background(bgColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
            .padding(.horizontal)
    }
}
