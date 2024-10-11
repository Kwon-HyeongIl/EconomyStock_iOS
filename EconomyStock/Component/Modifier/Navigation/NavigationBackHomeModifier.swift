//
//  NavigationBackHomeModifier.swift
//  EconomyStock
//
//  Created by 권형일 on 10/11/24.
//

import SwiftUI

struct NavigationBackHomeModifier: ViewModifier {
    @Environment(NavigationRouter.self) var navigationRouter
    @Environment(MainTabCapsule.self) var mainTabCapsule
    
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
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        navigationRouter.popToRoot()
                        mainTabCapsule.selectedTab = .house
                    } label: {
                        Image(systemName: "house")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 28)
                            .foregroundStyle(Color.ESTitle)
                    }
                }
            }
    }
}
