//
//  BackModifier.swift
//  EconomyStock
//
//  Created by 권형일 on 10/8/24.
//

import SwiftUI

struct NavigationBackModifier: ViewModifier {
    @Environment(NavigationRouter.self) var navigationRouter
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        navigationRouter.back()
                    } label: {
                        Image(systemName: "chevron.left")
                            .scaledToFit()
                            .frame(width: 24)
                            .fontWeight(.medium)
                            .foregroundStyle(.black)
                    }
                }
            }
    }
}
