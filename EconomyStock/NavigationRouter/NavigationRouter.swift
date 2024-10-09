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
        // // BasicEconomy
        case .BasicEconomyCourseIntroductionView:
            BasicEconomyCourseIntroductionView()
        case .Page1View:
            Page1View()
        case .Page2View:
            Page2View()
        case .Page3View:
            Page3View()
        case .Page4View:
            Page4View()
        case .Page5View:
            Page5View()
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
