//
//  EconomicIndicatorCycleData.swift
//  EconomyStock
//
//  Created by 권형일 on 12/4/24.
//

import Foundation

struct EconomicIndicatorCycleData: Decodable, Identifiable, Hashable, Equatable {
    let id = UUID().uuidString
    let statCode: String
    let statName: String
    let itemCode1: String
    let itemName1: String
    let unitName: String
    let time: String
    let dataValue: String
    
    enum CodingKeys: String, CodingKey {
        case statCode = "STAT_CODE"
        case statName = "STAT_NAME"
        case itemCode1 = "ITEM_CODE1"
        case itemName1 = "ITEM_NAME1"
        case unitName = "UNIT_NAME"
        case time = "TIME"
        case dataValue = "DATA_VALUE"
    }
}
