//
//  ShortButtonModifier.swift
//  EconomyStock
//
//  Created by 권형일 on 10/9/24.
//

import SwiftUI

struct ShortButtonModifier: ViewModifier {
    var bgColor: Color = .ESTitle
    
    func body(content: Content) -> some View {
        content
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: 100)
            .frame(height: 45)
            .background(bgColor)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
    }
}
