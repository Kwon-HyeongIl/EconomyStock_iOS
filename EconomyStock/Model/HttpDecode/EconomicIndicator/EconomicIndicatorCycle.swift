//
//  EconomicIndicatorCycle.swift
//  EconomyStock
//
//  Created by 권형일 on 12/4/24.
//

import Foundation

struct EconomicIndicatorCycle: Decodable {
    let listTotalCount: Int
    let cycle: [EconomicIndicatorCycleData]
    
    enum CodingKeys: String, CodingKey {
        case listTotalCount = "list_total_count"
        case cycle = "row"
    }
}
