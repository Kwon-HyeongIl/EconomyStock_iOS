//
//  HomeViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 12/3/24.
//

import Foundation

@Observable
class HomeViewModel {
    var baseRate = [EconomicIndicatorCycleData]()
    
    
    init() {
        requestBaseRate()
    }

    // 기준금리
    func requestBaseRate() {
        EconomicIndicatorManager.requestBaseRate { baseRate in
            DispatchQueue.main.async {
                self.baseRate = baseRate
            }
        }
    }
    
    // 그래프의 최댓값 가져오기
//    func getMaxValue() -> Double {
//        guard let maxValue = baseRate.map({ Double($0.dataValue) ?? 0 }).max() else { return 0 }
//        
//        return maxValue
//    }
}
