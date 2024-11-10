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
    func destinationNavigate(to view: NavigationDestinationPath) -> some View {
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
        
        case .BasicEconomy1View(let viewModel):
            BasicEconomy1View(viewModel: viewModel)
        case .BasicEconomy2View(let viewModel):
            BasicEconomy2View(viewModel: viewModel)
        case .BasicEconomy3View(let viewModel):
            BasicEconomy3View(viewModel: viewModel)
        case .BasicEconomy4View(let viewModel):
            BasicEconomy4View(viewModel: viewModel)
        case .BasicEconomy5View(let viewModel):
            BasicEconomy5View(viewModel: viewModel)
        case .BasicEconomy6View(let viewModel):
            BasicEconomy6View(viewModel: viewModel)
        case .BasicEconomy7View(let viewModel):
            BasicEconomy7View(viewModel: viewModel)
        case .BasicEconomy8View(let viewModel):
            BasicEconomy8View(viewModel: viewModel)
        case .BasicEconomy9View(let viewModel):
            BasicEconomy9View(viewModel: viewModel)
        case .BasicEconomy10View(let viewModel):
            BasicEconomy10View(viewModel: viewModel)
        case .BasicEconomy11View(let viewModel):
            BasicEconomy11View(viewModel: viewModel)
            
        case .PriceLevel1View(let viewModel):
            PriceLevel1View(viewModel: viewModel)
        case .PriceLevel2View(let viewModel):
            PriceLevel2View(viewModel: viewModel)
        case .PriceLevel3View(let viewModel):
            PriceLevel3View(viewModel: viewModel)
        case .PriceLevel4View(let viewModel):
            PriceLevel4View(viewModel: viewModel)
        case .PriceLevel5View(let viewModel):
            PriceLevel5View(viewModel: viewModel)
        }
    }
    
    @MainActor
    func navigate(_ view: NavigationDestinationPath) {
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
