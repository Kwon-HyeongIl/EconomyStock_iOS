//
//  NavigationBaseView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/24/24.
//

import SwiftUI

struct NavigationBaseView: View {
    @State private var navigationRouter = NavigationRouter()
    @State private var mainTabCapsule = MainTabCapsule()
    
    var body: some View {
        NavigationStack(path: $navigationRouter.path) {
            AisleView()
                .navigationDestination(for: NavigationDestinationPath.self) { view in
                    navigationRouter.destinationNavigate(to: view)
                }
                .preferredColorScheme(.light)
        }
        .environment(navigationRouter)
        .environment(mainTabCapsule)
        
    }
}

#Preview {
    NavigationBaseView()
}
