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
        
            // 기초 경제
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
            
            // 물가
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
        case .PriceLevel6View(let viewModel):
            PriceLevel6View(viewModel: viewModel)
        case .PriceLevel7View(let viewModel):
            PriceLevel7View(viewModel: viewModel)
        case .PriceLevel8View(let viewModel):
            PriceLevel8View(viewModel: viewModel)
        case .PriceLevel9View(let viewModel):
            PriceLevel9View(viewModel: viewModel)
        case .PriceLevel10View(let viewModel):
            PriceLevel10View(viewModel: viewModel)
            
            // 실업
        case .UnEmployment1View(let viewModel):
            UnEmployment1View(viewModel: viewModel)
        case .UnEmployment2View(let viewModel):
            UnEmployment2View(viewModel: viewModel)
        case .UnEmployment3View(let viewModel):
            UnEmployment3View(viewModel: viewModel)
        case .UnEmployment4View(let viewModel):
            UnEmployment4View(viewModel: viewModel)
        case .UnEmployment5View(let viewModel):
            UnEmployment5View(viewModel: viewModel)
        case .UnEmployment6View(let viewModel):
            UnEmployment6View(viewModel: viewModel)
        case .UnEmployment7View(let viewModel):
            UnEmployment7View(viewModel: viewModel)
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
