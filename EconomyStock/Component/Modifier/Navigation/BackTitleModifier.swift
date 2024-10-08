//
//  BackTitleModifier.swift
//  EconomyStock
//
//  Created by 권형일 on 10/8/24.
//

import SwiftUI

struct BackTitleModifier: ViewModifier {
    @Environment(NavigationRouter.self) var navigationRouter: NavigationRouter
    var navigationTitle: String
    
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
                
                ToolbarItem(placement: .principal) {
                    Text(navigationTitle)
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                }
            }
    }
}
