//
//  HomeViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 12/3/24.
//

import Foundation

@Observable
class HomeViewModel {
    var indicators = [EconomicIndicator]()
    
    init() {
        requestIndicators()
    }
    
    func requestIndicators() {
        EconomicIndicatorManager.requestEconomicIndicators { indicators in
            DispatchQueue.main.async {
                self.indicators = indicators
            }
        }
    }
}
