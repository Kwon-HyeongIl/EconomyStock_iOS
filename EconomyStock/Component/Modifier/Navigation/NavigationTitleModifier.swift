//
//  NavigationTitleModifier.swift
//  EconomyStock
//
//  Created by 권형일 on 10/9/24.
//

import SwiftUI

struct NavigationTitleModifier: ViewModifier {
    var title: String
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text(title)
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                }
            }
    }
}
