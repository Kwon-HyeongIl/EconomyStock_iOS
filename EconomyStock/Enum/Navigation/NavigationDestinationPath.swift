//
//  NavigationStackView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/1/24.
//

import Foundation

enum NavigationDestinationPath: Hashable {
    
    // Auth
    case BasicLoginView
    case BasicSignupView
    case FindPasswordView
    case AccountSupportView
    
    // Studying
    case CourseIntroView(CourseViewModel)
    
    case BasicEconomy1View(CourseViewModel)
    case BasicEconomy2View(CourseViewModel)
    case BasicEconomy3View(CourseViewModel)
    case BasicEconomy4View(CourseViewModel)
    case BasicEconomy5View(CourseViewModel)
    
    case PriceLevel1View(CourseViewModel)
    case PriceLevel2View(CourseViewModel)
    case PriceLevel3View(CourseViewModel)
    case PriceLevel4View(CourseViewModel)
    case PriceLevel5View(CourseViewModel)
}
