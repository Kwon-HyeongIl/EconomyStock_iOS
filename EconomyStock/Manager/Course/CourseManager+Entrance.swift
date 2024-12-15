//
//  CourseManager+Entrance.swift
//  EconomyStock
//
//  Created by 권형일 on 12/15/24.
//

import Foundation

@MainActor
extension CourseManager {
    static func courseContinueNavigationAdaptor(viewModel: CourseViewModel, navRouter: NavigationRouter) {
        switch viewModel.course.type {
            
        // 1. 기초경제
        case .basicEconomy:
            switch viewModel.course.lastPage {
                
            case 1:
                navRouter.navigate(.BasicEconomy1View(viewModel))
                
            case 2:
                viewModel.currentPage = 2
                
                navRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                
                navRouter.navigate(.BasicEconomy2View(viewModel))
                
            case 3:
                viewModel.currentPage = 3
                
                navRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                
                navRouter.navigate(.BasicEconomy3View(viewModel))
                
            case 4:
                viewModel.currentPage = 4
                
                navRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                
                navRouter.navigate(.BasicEconomy4View(viewModel))
                
            case 5:
                viewModel.currentPage = 5
                
                navRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy4View(viewModel))
                
                navRouter.navigate(.BasicEconomy5View(viewModel))
                
            case 6:
                viewModel.currentPage = 6
                
                navRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy5View(viewModel))
                
                navRouter.navigate(.BasicEconomy6View(viewModel))
                
            case 7:
                viewModel.currentPage = 7
                
                navRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy6View(viewModel))
                
                navRouter.navigate(.BasicEconomy7View(viewModel))
                
            case 8:
                viewModel.currentPage = 8
                
                navRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy6View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy7View(viewModel))
                
                navRouter.navigate(.BasicEconomy8View(viewModel))
                
            case 9:
                viewModel.currentPage = 9
                
                navRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy6View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy7View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy8View(viewModel))
                
                navRouter.navigate(.BasicEconomy9View(viewModel))
                
            case 10:
                viewModel.currentPage = 10
                
                navRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy6View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy7View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy8View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy9View(viewModel))
                
                navRouter.navigate(.BasicEconomy10View(viewModel))
                
            case 11:
                viewModel.currentPage = 11
                
                navRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy6View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy7View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy8View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy9View(viewModel))
                navRouter.path.append(NavigationDestinationPath.BasicEconomy10View(viewModel))
                
                navRouter.navigate(.BasicEconomy11View(viewModel))
                
            default:
                navRouter.navigate(.BasicEconomy1View(viewModel))
            }
            
        // 2. 물가
        case .priceLevel:
            switch viewModel.course.lastPage {
                
            case 1:
                navRouter.navigate(.PriceLevel1View(viewModel))
                
            case 2:
                viewModel.currentPage = 2
                
                navRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                
                navRouter.navigate(.PriceLevel2View(viewModel))
                
            case 3:
                viewModel.currentPage = 3
                
                navRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                
                navRouter.navigate(.PriceLevel3View(viewModel))
                
            case 4:
                viewModel.currentPage = 4
                
                navRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel3View(viewModel))
                
                navRouter.navigate(.PriceLevel4View(viewModel))
                
            case 5:
                viewModel.currentPage = 5
                
                navRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel4View(viewModel))
                
                navRouter.navigate(.PriceLevel5View(viewModel))
                
            case 6:
                viewModel.currentPage = 6
                
                navRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel5View(viewModel))
                
                navRouter.navigate(.PriceLevel6View(viewModel))
                
            case 7:
                viewModel.currentPage = 7
                
                navRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel6View(viewModel))
                
                navRouter.navigate(.PriceLevel7View(viewModel))
                
            case 8:
                viewModel.currentPage = 8
                
                navRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel6View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel7View(viewModel))
                
                navRouter.navigate(.PriceLevel8View(viewModel))
                
            case 9:
                viewModel.currentPage = 9
                
                navRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel6View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel7View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel8View(viewModel))
                
                navRouter.navigate(.PriceLevel9View(viewModel))
                
            case 10:
                viewModel.currentPage = 10
                
                navRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel6View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel7View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel8View(viewModel))
                navRouter.path.append(NavigationDestinationPath.PriceLevel9View(viewModel))
                
                navRouter.navigate(.PriceLevel10View(viewModel))
                
            default:
                navRouter.navigate(.PriceLevel1View(viewModel))
            }
            
        // 3. 실업
        case .unEmployment:
            switch viewModel.course.lastPage {
                
            case 1:
                navRouter.navigate(.UnEmployment1View(viewModel))
                
            case 2:
                viewModel.currentPage = 2
                
                navRouter.path.append(NavigationDestinationPath.UnEmployment1View(viewModel))
                
                navRouter.navigate(.UnEmployment2View(viewModel))
                
            case 3:
                viewModel.currentPage = 3
                
                navRouter.path.append(NavigationDestinationPath.UnEmployment1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.UnEmployment2View(viewModel))
                
                navRouter.navigate(.UnEmployment3View(viewModel))
                
            case 4:
                viewModel.currentPage = 4
                
                navRouter.path.append(NavigationDestinationPath.UnEmployment1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.UnEmployment2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.UnEmployment3View(viewModel))
                
                navRouter.navigate(.UnEmployment4View(viewModel))
                
            case 5:
                viewModel.currentPage = 5
                
                navRouter.path.append(NavigationDestinationPath.UnEmployment1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.UnEmployment2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.UnEmployment3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.UnEmployment4View(viewModel))
                
                navRouter.navigate(.UnEmployment5View(viewModel))
                
            case 6:
                viewModel.currentPage = 6
                
                navRouter.path.append(NavigationDestinationPath.UnEmployment1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.UnEmployment2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.UnEmployment3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.UnEmployment4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.UnEmployment5View(viewModel))
                
                navRouter.navigate(.UnEmployment6View(viewModel))
                
            case 7:
                viewModel.currentPage = 7
                
                navRouter.path.append(NavigationDestinationPath.UnEmployment1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.UnEmployment2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.UnEmployment3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.UnEmployment4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.UnEmployment5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.UnEmployment6View(viewModel))
                
                navRouter.navigate(.UnEmployment7View(viewModel))
                
            default:
                navRouter.navigate(.UnEmployment1View(viewModel))
            }
            
        // 4. 화폐와 금융
        case .moneyAndFinance:
            switch viewModel.course.lastPage {
                
            case 1:
                navRouter.navigate(.MoneyAndFinance1View(viewModel))
                
            case 2:
                viewModel.currentPage = 2
                
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                
                navRouter.navigate(.MoneyAndFinance2View(viewModel))
                
            case 3:
                viewModel.currentPage = 3
                
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                
                navRouter.navigate(.MoneyAndFinance3View(viewModel))
                
            case 4:
                viewModel.currentPage = 4
                
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                
                navRouter.navigate(.MoneyAndFinance4View(viewModel))

            case 5:
                viewModel.currentPage = 5
                
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                
                navRouter.navigate(.MoneyAndFinance5View(viewModel))
                
            case 6:
                viewModel.currentPage = 6
                
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                
                navRouter.navigate(.MoneyAndFinance6View(viewModel))
                
            case 7:
                viewModel.currentPage = 7
                
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                
                navRouter.navigate(.MoneyAndFinance7View(viewModel))
                
            case 8:
                viewModel.currentPage = 8
                
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                
                navRouter.navigate(.MoneyAndFinance8View(viewModel))
                
            case 9:
                viewModel.currentPage = 9
                
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance8View(viewModel))
                
                navRouter.navigate(.MoneyAndFinance9View(viewModel))
                
            case 10:
                viewModel.currentPage = 10
                
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance8View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance9View(viewModel))
                
                navRouter.navigate(.MoneyAndFinance10View(viewModel))
                
            case 11:
                viewModel.currentPage = 11
                
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance8View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance9View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance10View(viewModel))
                
                navRouter.navigate(.MoneyAndFinance11View(viewModel))
                
            case 12:
                viewModel.currentPage = 12
                
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance8View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance9View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance10View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance11View(viewModel))
                
                navRouter.navigate(.MoneyAndFinance12View(viewModel))
                
            case 13:
                viewModel.currentPage = 13
                
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance8View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance9View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance10View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance11View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance12View(viewModel))
                
                navRouter.navigate(.MoneyAndFinance13View(viewModel))
                
            case 14:
                viewModel.currentPage = 14
                
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance8View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance9View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance10View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance11View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance12View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance13View(viewModel))
                
                navRouter.navigate(.MoneyAndFinance14View(viewModel))
                
            case 15:
                viewModel.currentPage = 15
                
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance8View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance9View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance10View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance11View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance12View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance13View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance14View(viewModel))
                
                navRouter.navigate(.MoneyAndFinance15View(viewModel))
                
            case 16:
                viewModel.currentPage = 16
                
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance8View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance9View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance10View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance11View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance12View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance13View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance14View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance15View(viewModel))
                
                navRouter.navigate(.MoneyAndFinance16View(viewModel))
                
            case 17:
                viewModel.currentPage = 17
                
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance8View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance9View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance10View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance11View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance12View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance13View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance14View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance15View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance16View(viewModel))
                
                navRouter.navigate(.MoneyAndFinance17View(viewModel))
                
            case 18:
                viewModel.currentPage = 18
                
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance8View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance9View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance10View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance11View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance12View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance13View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance14View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance15View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance16View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance17View(viewModel))
                
                navRouter.navigate(.MoneyAndFinance18View(viewModel))
                
            case 19:
                viewModel.currentPage = 19
                
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance6View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance7View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance8View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance9View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance10View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance11View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance12View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance13View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance14View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance15View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance16View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance17View(viewModel))
                navRouter.path.append(NavigationDestinationPath.MoneyAndFinance18View(viewModel))
                
                navRouter.navigate(.MoneyAndFinance19View(viewModel))
                
            default:
                navRouter.navigate(.MoneyAndFinance1View(viewModel))
            }
            
        // 5. 환율과 국제수지
        case .exchangeRateAndBalanceOfPayment:
            switch viewModel.course.lastPage {
                
            case 1:
                navRouter.navigate(.ExchangeRateAndBalanceOfPayment1View(viewModel))
                
            case 2:
                viewModel.currentPage = 2
                
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment1View(viewModel))
                
                navRouter.navigate(.ExchangeRateAndBalanceOfPayment2View(viewModel))
                
            case 3:
                viewModel.currentPage = 3
                
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment2View(viewModel))
                
                navRouter.navigate(.ExchangeRateAndBalanceOfPayment3View(viewModel))
                
            case 4:
                viewModel.currentPage = 4
                
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment3View(viewModel))
                
                navRouter.navigate(.ExchangeRateAndBalanceOfPayment4View(viewModel))
                
            case 5:
                viewModel.currentPage = 5
                
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment4View(viewModel))
                
                navRouter.navigate(.ExchangeRateAndBalanceOfPayment5View(viewModel))
                
            case 6:
                viewModel.currentPage = 6
                
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment5View(viewModel))
                
                navRouter.navigate(.ExchangeRateAndBalanceOfPayment6View(viewModel))
                
            case 7:
                viewModel.currentPage = 7
                
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment6View(viewModel))
                
                navRouter.navigate(.ExchangeRateAndBalanceOfPayment7View(viewModel))
                
            case 8:
                viewModel.currentPage = 8
                
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment6View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment7View(viewModel))
                
                navRouter.navigate(.ExchangeRateAndBalanceOfPayment8View(viewModel))
                
            case 9:
                viewModel.currentPage = 9
                
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment6View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment7View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment8View(viewModel))
                
                navRouter.navigate(.ExchangeRateAndBalanceOfPayment9View(viewModel))
                
            case 10:
                viewModel.currentPage = 10
                
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment6View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment7View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment8View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment9View(viewModel))
                
                navRouter.navigate(.ExchangeRateAndBalanceOfPayment10View(viewModel))
                
            case 11:
                viewModel.currentPage = 11
                
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment1View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment2View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment3View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment4View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment5View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment6View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment7View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment8View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment9View(viewModel))
                navRouter.path.append(NavigationDestinationPath.ExchangeRateAndBalanceOfPayment10View(viewModel))
                
                navRouter.navigate(.ExchangeRateAndBalanceOfPayment11View(viewModel))
                
            default:
                navRouter.navigate(.ExchangeRateAndBalanceOfPayment1View(viewModel))
            }
        }
    }
}
