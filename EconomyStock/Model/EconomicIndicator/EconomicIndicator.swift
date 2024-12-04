//
//  EconomicIndicator.swift
//  EconomyStock
//
//  Created by 권형일 on 12/3/24.
//

import Foundation

struct EconomicIndicator: Decodable, Hashable, Equatable {
    let className: String
    let keystatName: String
    let dataValue: String
    let cycle: String
    let unitName: String? // 값 중에 null인 값이 존재
    
    enum CodingKeys: String, CodingKey {
        case className = "CLASS_NAME"
        case keystatName = "KEYSTAT_NAME"
        case dataValue = "DATA_VALUE"
        case cycle = "CYCLE"
        case unitName = "UNIT_NAME"
    }
}
