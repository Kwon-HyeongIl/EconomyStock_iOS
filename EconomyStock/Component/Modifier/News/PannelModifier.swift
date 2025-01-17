//
//  Pannel.swift
//  EconomyStock
//
//  Created by 권형일 on 1/16/25.
//

import SwiftUI

struct PannelModifier: ViewModifier {
    let height: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .frame(height: height)
            .background(.ultraThickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal)
            .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
    }
}
