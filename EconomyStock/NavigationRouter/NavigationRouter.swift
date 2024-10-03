//
//  NavigationRouter.swift
//  EconomyStock
//
//  Created by 권형일 on 10/1/24.
//

import SwiftUI

@MainActor
@Observable
class NavigationRouter {
    var path = NavigationPath()
    
    @ViewBuilder
    func destinationNavigate(to view: NavigationStackView) -> some View {
        switch view {
            
        case .TestView:
            TestView()
        }
    }
    
    func navigate(_ view: NavigationStackView) {
        path.append(view)
    }
    
    func back() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func popToRoot() {
        if !path.isEmpty {
            path.removeLast(path.count)
        }
    }
}
