//
//  NavigationStackView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/1/24.
//

import Foundation

enum NavigationStackPath: Hashable {
    // Auth
    case BasicLoginView
    case BasicSignupView
    case FindPasswordView
    case AccountSupportView
    
    // Studying
    case CourseIntroView(CourseViewModel)
    
    case Page1BasicEconomyView
    case Page2BasicEconomyView
    case Page3BasicEconomyView
    case Page4BasicEconomyView
    case Page5BasicEconomyView
    
}
