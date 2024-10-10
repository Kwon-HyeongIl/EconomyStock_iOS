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
        
        case .Page1BasicEconomyView(let viewModel):
            Page1BasicEconomyView(viewModel: viewModel)
//        case .Page2BasicEconomyView(let viewModel):
//            Page2BasicEconomyView(viewModel: viewModel)
//        case .Page3BasicEconomyView(let viewModel):
//            Page3BasicEconomyView(viewModel: viewModel)
//        case .Page4BasicEconomyView(let viewModel):
//            Page4BasicEconomyView(viewModel: viewModel)
//        case .Page5BasicEconomyView(let viewModel):
//            Page5BasicEconomyView(viewModel: viewModel)
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
