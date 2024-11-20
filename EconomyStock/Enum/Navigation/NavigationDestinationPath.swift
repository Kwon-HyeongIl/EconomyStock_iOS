//
//  NavigationStackView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/1/24.
//

import Foundation

enum NavigationDestinationPath: Hashable {
    
    // Auth
    case LoginView
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
    
        // 화폐와 금융
    case MoneyAndFinance1View(CourseViewModel)
    case MoneyAndFinance2View(CourseViewModel)
    case MoneyAndFinance3View(CourseViewModel)
    case MoneyAndFinance4View(CourseViewModel)
    case MoneyAndFinance5View(CourseViewModel)
    case MoneyAndFinance6View(CourseViewModel)
    case MoneyAndFinance7View(CourseViewModel)
    case MoneyAndFinance8View(CourseViewModel)
    case MoneyAndFinance9View(CourseViewModel)
    case MoneyAndFinance10View(CourseViewModel)
    case MoneyAndFinance11View(CourseViewModel)
    case MoneyAndFinance12View(CourseViewModel)
    case MoneyAndFinance13View(CourseViewModel)
    case MoneyAndFinance14View(CourseViewModel)
    case MoneyAndFinance15View(CourseViewModel)
    case MoneyAndFinance16View(CourseViewModel)
    case MoneyAndFinance17View(CourseViewModel)
    case MoneyAndFinance18View(CourseViewModel)
    case MoneyAndFinance19View(CourseViewModel)
    case MoneyAndFinance20View(CourseViewModel)
    case MoneyAndFinance21View(CourseViewModel)
    case MoneyAndFinance22View(CourseViewModel)
    case MoneyAndFinance23View(CourseViewModel)
}
