//
//  BackModifier.swift
//  EconomyStock
//
//  Created by 권형일 on 10/8/24.
//

import SwiftUI

struct BackModifier: ViewModifier {
    @Environment(NavigationRouter.self) var navigationRouter: NavigationRouter
    
    func body(content: Content) -> some View {
        content
            .toolbarBackground(Color.ESTitle, for: .navigationBar)
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        navigationRouter.back()
                    } label: {
                        Image(systemName: "chevron.left")
                            .fontWeight(.medium)
                            .foregroundStyle(.black)
                    }
                }
            }
    }
}
