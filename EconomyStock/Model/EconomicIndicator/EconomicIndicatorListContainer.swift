//
//  EconomicIndicatorList.swift
//  EconomyStock
//
//  Created by 권형일 on 12/3/24.
//

import Foundation

struct EconomicIndicatorListContainer: Decodable {
    let keyStatisticList: EconomicIndicatorList
    
    enum CodingKeys: String, CodingKey {
        case keyStatisticList = "KeyStatisticList"
    }
}
