//
//  CourseMain.swift
//  EconomyStock
//
//  Created by 권형일 on 11/30/24.
//

import SwiftUI

struct CourseMain {
    @MainActor
    static func courseContinueNavigationAdaptor(viewModel: CourseViewModel, navigationRouter: NavigationRouter) {
        switch viewModel.course.type {
            
        // 1. 기초경제
        case .basicEconomy:
            switch viewModel.course.lastPage {
                
            case 1:
                navigationRouter.navigate(.BasicEconomy1View(viewModel))
                
            case 2:
                viewModel.currentPage = 2
                
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                
                navigationRouter.navigate(.BasicEconomy2View(viewModel))
                
            case 3:
                viewModel.currentPage = 3
                
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                
                navigationRouter.navigate(.BasicEconomy3View(viewModel))
                
            case 4:
                viewModel.currentPage = 4
                
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                
                navigationRouter.navigate(.BasicEconomy4View(viewModel))
                
            case 5:
                viewModel.currentPage = 5
                
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy4View(viewModel))
                
                navigationRouter.navigate(.BasicEconomy5View(viewModel))
                
            case 6:
                viewModel.currentPage = 6
                
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy5View(viewModel))
                
                navigationRouter.navigate(.BasicEconomy6View(viewModel))
                
            case 7:
                viewModel.currentPage = 7
                
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy6View(viewModel))
                
                navigationRouter.navigate(.BasicEconomy7View(viewModel))
                
            case 8:
                viewModel.currentPage = 8
                
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy6View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy7View(viewModel))
                
                navigationRouter.navigate(.BasicEconomy8View(viewModel))
                
            case 9:
                viewModel.currentPage = 9
                
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy6View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy7View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy8View(viewModel))
                
                navigationRouter.navigate(.BasicEconomy9View(viewModel))
                
            case 10:
                viewModel.currentPage = 10
                
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy6View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy7View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy8View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy9View(viewModel))
                
                navigationRouter.navigate(.BasicEconomy10View(viewModel))
                
            case 11:
                viewModel.currentPage = 11
                
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy6View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy7View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy8View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy9View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.BasicEconomy10View(viewModel))
                
                navigationRouter.navigate(.BasicEconomy11View(viewModel))
                
            default:
                navigationRouter.navigate(.BasicEconomy1View(viewModel))
            }
            
        // 2. 물가
        case .priceLevel:
            switch viewModel.course.lastPage {
                
            case 1:
                navigationRouter.navigate(.PriceLevel1View(viewModel))
                
            case 2:
                viewModel.currentPage = 2
                
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                
                navigationRouter.navigate(.PriceLevel2View(viewModel))
                
            case 3:
                viewModel.currentPage = 3
                
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                
                navigationRouter.navigate(.PriceLevel3View(viewModel))
                
            case 4:
                viewModel.currentPage = 4
                
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel3View(viewModel))
                
                navigationRouter.navigate(.PriceLevel4View(viewModel))
                
            case 5:
                viewModel.currentPage = 5
                
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel4View(viewModel))
                
                navigationRouter.navigate(.PriceLevel5View(viewModel))
                
            case 6:
                viewModel.currentPage = 6
                
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel5View(viewModel))
                
                navigationRouter.navigate(.PriceLevel6View(viewModel))
                
            case 7:
                viewModel.currentPage = 7
                
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel6View(viewModel))
                
                navigationRouter.navigate(.PriceLevel7View(viewModel))
                
            case 8:
                viewModel.currentPage = 8
                
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel6View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel7View(viewModel))
                
                navigationRouter.navigate(.PriceLevel8View(viewModel))
                
            case 9:
                viewModel.currentPage = 9
                
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel6View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel7View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel8View(viewModel))
                
                navigationRouter.navigate(.PriceLevel9View(viewModel))
                
            case 10:
                viewModel.currentPage = 10
                
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel6View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel7View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel8View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.PriceLevel9View(viewModel))
                
                navigationRouter.navigate(.PriceLevel10View(viewModel))
                
            default:
                navigationRouter.navigate(.PriceLevel1View(viewModel))
            }
            
        // 3. 실업
        case .unEmployment:
            switch viewModel.course.lastPage {
                
            case 1:
                navigationRouter.navigate(.UnEmployment1View(viewModel))
                
            case 2:
                viewModel.currentPage = 2
                
                navigationRouter.path.append(NavigationDestinationPath.UnEmployment1View(viewModel))
                
                navigationRouter.navigate(.UnEmployment2View(viewModel))
                
            case 3:
                viewModel.currentPage = 3
                
                navigationRouter.path.append(NavigationDestinationPath.UnEmployment1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.UnEmployment2View(viewModel))
                
                navigationRouter.navigate(.UnEmployment3View(viewModel))
                
            case 4:
                viewModel.currentPage = 4
                
                navigationRouter.path.append(NavigationDestinationPath.UnEmployment1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.UnEmployment2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.UnEmployment3View(viewModel))
                
                navigationRouter.navigate(.UnEmployment4View(viewModel))
                
            case 5:
                viewModel.currentPage = 5
                
                navigationRouter.path.append(NavigationDestinationPath.UnEmployment1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.UnEmployment2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.UnEmployment3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.UnEmployment4View(viewModel))
                
                navigationRouter.navigate(.UnEmployment5View(viewModel))
                
            case 6:
                viewModel.currentPage = 6
                
                navigationRouter.path.append(NavigationDestinationPath.UnEmployment1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.UnEmployment2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.UnEmployment3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.UnEmployment4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.UnEmployment5View(viewModel))
                
                navigationRouter.navigate(.UnEmployment6View(viewModel))
                
            case 7:
                viewModel.currentPage = 7
                
                navigationRouter.path.append(NavigationDestinationPath.UnEmployment1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.UnEmployment2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.UnEmployment3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.UnEmployment4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.UnEmployment5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.UnEmployment6View(viewModel))
                
                navigationRouter.navigate(.UnEmployment7View(viewModel))
                
            default:
                navigationRouter.navigate(.UnEmployment1View(viewModel))
            }
            
        // 4. 화폐와 금융
        case .moneyAndFinance:
            switch viewModel.course.lastPage {
                
            case 1:
                navigationRouter.navigate(.MoneyAndFinance1View(viewModel))
                
            case 2:
                viewModel.currentPage = 2
                
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                
                navigationRouter.navigate(.MoneyAndFinance2View(viewModel))
                
            case 3:
                viewModel.currentPage = 3
                
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                
                navigationRouter.navigate(.MoneyAndFinance3View(viewModel))
                
            case 4:
                viewModel.currentPage = 4
                
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                
                navigationRouter.navigate(.MoneyAndFinance4View(viewModel))

            case 5:
                viewModel.currentPage = 5
                
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                
                navigationRouter.navigate(.MoneyAndFinance5View(viewModel))
                
            case 6:
                viewModel.currentPage = 6
                
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                
                navigationRouter.navigate(.MoneyAndFinance6View(viewModel))
                
            case 7:
                viewModel.currentPage = 7
                
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                
                navigationRouter.navigate(.MoneyAndFinance7View(viewModel))
                
            case 8:
                viewModel.currentPage = 8
                
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                
                navigationRouter.navigate(.MoneyAndFinance8View(viewModel))
                
            case 9:
                viewModel.currentPage = 9
                
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance8View(viewModel))
                
                navigationRouter.navigate(.MoneyAndFinance9View(viewModel))
                
            case 10:
                viewModel.currentPage = 10
                
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance8View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance9View(viewModel))
                
                navigationRouter.navigate(.MoneyAndFinance10View(viewModel))
                
            case 11:
                viewModel.currentPage = 11
                
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance8View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance9View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance10View(viewModel))
                
                navigationRouter.navigate(.MoneyAndFinance11View(viewModel))
                
            case 12:
                viewModel.currentPage = 12
                
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance8View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance9View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance10View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance11View(viewModel))
                
                navigationRouter.navigate(.MoneyAndFinance12View(viewModel))
                
            case 13:
                viewModel.currentPage = 13
                
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance8View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance9View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance10View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance11View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance12View(viewModel))
                
                navigationRouter.navigate(.MoneyAndFinance13View(viewModel))
                
            case 14:
                viewModel.currentPage = 14
                
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance8View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance9View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance10View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance11View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance12View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance13View(viewModel))
                
                navigationRouter.navigate(.MoneyAndFinance14View(viewModel))
                
            case 15:
                viewModel.currentPage = 15
                
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance8View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance9View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance10View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance11View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance12View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance13View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance14View(viewModel))
                
                navigationRouter.navigate(.MoneyAndFinance15View(viewModel))
                
            case 16:
                viewModel.currentPage = 16
                
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance8View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance9View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance10View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance11View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance12View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance13View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance14View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance15View(viewModel))
                
                navigationRouter.navigate(.MoneyAndFinance16View(viewModel))
                
            case 17:
                viewModel.currentPage = 17
                
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance8View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance9View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance10View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance11View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance12View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance13View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance14View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance15View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance16View(viewModel))
                
                navigationRouter.navigate(.MoneyAndFinance17View(viewModel))
                
            case 18:
                viewModel.currentPage = 18
                
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance8View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance9View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance10View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance11View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance12View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance13View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance14View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance15View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance16View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance17View(viewModel))
                
                navigationRouter.navigate(.MoneyAndFinance18View(viewModel))
                
            case 19:
                viewModel.currentPage = 19
                
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance8View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance9View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance10View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance11View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance12View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance13View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance14View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance15View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance16View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance17View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.MoneyAndFinance18View(viewModel))
                
                navigationRouter.navigate(.MoneyAndFinance19View(viewModel))
                
            default:
                navigationRouter.navigate(.MoneyAndFinance1View(viewModel))
            }
            
        // 5. 환율과 국제수지
        case .exchangeRateAndBalanceOfPayment:
            switch viewModel.course.lastPage {
                
            case 1:
                navigationRouter.navigate(.ExchangeRateAndBalanceOfPayment1View(viewModel))
                
            case 2:
                viewModel.currentPage = 2
                
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment1View(viewModel))
                
                navigationRouter.navigate(.ExchangeRateAndBalanceOfPayment2View(viewModel))
                
            case 3:
                viewModel.currentPage = 3
                
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment2View(viewModel))
                
                navigationRouter.navigate(.ExchangeRateAndBalanceOfPayment3View(viewModel))
                
            case 4:
                viewModel.currentPage = 4
                
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment3View(viewModel))
                
                navigationRouter.navigate(.ExchangeRateAndBalanceOfPayment4View(viewModel))
                
            case 5:
                viewModel.currentPage = 5
                
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment4View(viewModel))
                
                navigationRouter.navigate(.ExchangeRateAndBalanceOfPayment5View(viewModel))
                
            case 6:
                viewModel.currentPage = 6
                
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment5View(viewModel))
                
                navigationRouter.navigate(.ExchangeRateAndBalanceOfPayment6View(viewModel))
                
            case 7:
                viewModel.currentPage = 7
                
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment6View(viewModel))
                
                navigationRouter.navigate(.ExchangeRateAndBalanceOfPayment7View(viewModel))
                
            case 8:
                viewModel.currentPage = 8
                
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment6View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment7View(viewModel))
                
                navigationRouter.navigate(.ExchangeRateAndBalanceOfPayment8View(viewModel))
                
            case 9:
                viewModel.currentPage = 9
                
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment6View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment7View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment8View(viewModel))
                
                navigationRouter.navigate(.ExchangeRateAndBalanceOfPayment9View(viewModel))
                
            case 10:
                viewModel.currentPage = 10
                
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment6View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment7View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment8View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment9View(viewModel))
                
                navigationRouter.navigate(.ExchangeRateAndBalanceOfPayment10View(viewModel))
                
            case 11:
                viewModel.currentPage = 11
                
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment1View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment2View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment3View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment4View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment5View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment6View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment7View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment8View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment9View(viewModel))
                navigationRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment10View(viewModel))
                
                navigationRouter.navigate(.ExchangeRateAndBalanceOfPayment11View(viewModel))
                
            default:
                navigationRouter.navigate(.ExchangeRateAndBalanceOfPayment1View(viewModel))
            }
        }
    }
}
