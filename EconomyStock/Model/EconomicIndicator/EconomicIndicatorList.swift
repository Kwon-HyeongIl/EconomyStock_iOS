//
//  KeyStatisticList.swift
//  EconomyStock
//
//  Created by 권형일 on 12/4/24.
//

import Foundation

struct EconomicIndicatorList: Decodable {
    let listTotalCount: Int
    let rowCount: Int
    let row: [EconomicIndicator]

    enum CodingKeys: String, CodingKey {
        case listTotalCount = "list_total_count"
        case rowCount = "row_count"
        case row
    }
}
