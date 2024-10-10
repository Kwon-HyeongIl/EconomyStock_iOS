//
//  NavigationRouter.swift
//  EconomyStock
//
//  Created by 권형일 on 10/1/24.
//

import SwiftUI

@Observable
class NavigationRouter {
    var path = NavigationPath()
    
    @ViewBuilder
    func destinationNavigate(to view: NavigationStackPath) -> some View {
        switch view {
            
        // Auth
        case .BasicLoginView:
            BasicLoginView()
        case .BasicSignupView:
            BasicSignupView()
        case .FindPasswordView:
            FindPasswordView()
        case .AccountSupportView:
            AccountSupportView()
            
        // Studying
        case .CourseIntroView(let viewModel):
            CourseIntroView(viewModel: viewModel)
        
        case .Page1BasicEconomyView:
            Page1BasicEconomyView()
        case .Page2BasicEconomyView:
            Page2BasicEconomyView()
        case .Page3BasicEconomyView:
            Page3BasicEconomyView()
        case .Page4BasicEconomyView:
            Page4BasicEconomyView()
        case .Page5BasicEconomyView:
            Page5BasicEconomyView()
        }
    }
    
    @MainActor
    func navigate(_ view: NavigationStackPath) {
        path.append(view)
    }
    
    @MainActor
    func back() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    @MainActor
    func popToRoot() {
        if !path.isEmpty {
            path.removeLast(path.count)
        }
    }
}
