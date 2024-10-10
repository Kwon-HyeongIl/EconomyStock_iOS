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
    
    case Page1BasicEconomyView(CourseViewModel)
//    case Page2BasicEconomyView(CourseViewModel)
//    case Page3BasicEconomyView(CourseViewModel)
//    case Page4BasicEconomyView(CourseViewModel)
//    case Page5BasicEconomyView(CourseViewModel)
    
}
