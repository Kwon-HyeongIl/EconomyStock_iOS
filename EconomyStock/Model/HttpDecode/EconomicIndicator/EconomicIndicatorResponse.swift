//
//  EconomicIndicatorResponse.swift
//  EconomyStock
//
//  Created by 권형일 on 4/23/25.
//

import Foundation

typealias EconomicIndicatorCycleData = EconomicIndicatorResponse.StatisticSearch.CycleData

struct EconomicIndicatorResponse: Decodable {
    let statisticSearch: StatisticSearch
    
    private enum CodingKeys: String, CodingKey {
        case statisticSearch = "StatisticSearch"
    }
    
    
    struct StatisticSearch: Decodable {
        let listTotalCount: Int
        let row: [CycleData]                       
        
        private enum CodingKeys: String, CodingKey {
            case listTotalCount = "list_total_count"
            case row
        }
        
        
        struct CycleData: Decodable, Identifiable, Hashable {
            let id = UUID().uuidString                
            let statCode: String
            let statName: String
            let itemCode1: String
            let itemName1: String
            let unitName: String
            var time: String
            let dataValue: String
            
            private enum CodingKeys: String, CodingKey {
                case statCode   = "STAT_CODE"
                case statName   = "STAT_NAME"
                case itemCode1  = "ITEM_CODE1"
                case itemName1  = "ITEM_NAME1"
                case unitName   = "UNIT_NAME"
                case time       = "TIME"
                case dataValue  = "DATA_VALUE"
            }
        }
    }
}
