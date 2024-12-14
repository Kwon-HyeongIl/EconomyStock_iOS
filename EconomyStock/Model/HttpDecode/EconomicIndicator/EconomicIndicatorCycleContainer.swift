//
//  EconomicIndicatorCycleContainer.swift
//  EconomyStock
//
//  Created by 권형일 on 12/4/24.
//

import Foundation

struct EconomicIndicatorCycleContainer: Decodable {
    let statisticSearch: EconomicIndicatorCycle
    
    enum CodingKeys: String, CodingKey {
        case statisticSearch = "StatisticSearch"
    }
}
