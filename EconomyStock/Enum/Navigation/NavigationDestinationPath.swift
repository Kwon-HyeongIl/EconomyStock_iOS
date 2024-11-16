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
    
        // 기초 경제
    case BasicEconomy1View(CourseViewModel)
    case BasicEconomy2View(CourseViewModel)
    case BasicEconomy3View(CourseViewModel)
    case BasicEconomy4View(CourseViewModel)
    case BasicEconomy5View(CourseViewModel)
    case BasicEconomy6View(CourseViewModel)
    case BasicEconomy7View(CourseViewModel)
    case BasicEconomy8View(CourseViewModel)
    case BasicEconomy9View(CourseViewModel)
    case BasicEconomy10View(CourseViewModel)
    case BasicEconomy11View(CourseViewModel)
    
        // 물가
    case PriceLevel1View(CourseViewModel)
    case PriceLevel2View(CourseViewModel)
    case PriceLevel3View(CourseViewModel)
    case PriceLevel4View(CourseViewModel)
    case PriceLevel5View(CourseViewModel)
    case PriceLevel6View(CourseViewModel)
    case PriceLevel7View(CourseViewModel)
    case PriceLevel8View(CourseViewModel)
    case PriceLevel9View(CourseViewModel)
    case PriceLevel10View(CourseViewModel)
    
        // 실업
    case UnEmployment1View(CourseViewModel)
    case UnEmployment2View(CourseViewModel)
    case UnEmployment3View(CourseViewModel)
    case UnEmployment4View(CourseViewModel)
    case UnEmployment5View(CourseViewModel)
    case UnEmployment6View(CourseViewModel)
    case UnEmployment7View(CourseViewModel)
    case UnEmployment8View(CourseViewModel)
}
