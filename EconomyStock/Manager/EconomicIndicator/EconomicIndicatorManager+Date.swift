//
//  EconomicIndicatorManager+Date.swift
//  EconomyStock
//
//  Created by 권형일 on 12/6/24.
//

import Foundation

extension EconomicIndicatorManager {
    static func getNowDate(type: DateType) -> String {
        let formatter = DateFormatter()
        let now = Date()
        let calendar = Calendar.current
        
        switch type {
            
        case .annual:
            formatter.dateFormat = "yyyy"
            
        case .quarter:
            let year = calendar.component(.year, from: now)
            let month = calendar.component(.month, from: now)
            
            let quarter: String
            
            switch month {
                
            case 1...3:
                quarter = "Q1"
            case 4...6:
                quarter = "Q2"
            case 7...9:
                quarter = "Q3"
            case 10...12:
                quarter = "Q4"
                
            default:
                quarter = ""
            }
            
            return "\(year)\(quarter)"
            
        case .month:
            formatter.dateFormat = "yyyyMM"
            
        case .day:
            formatter.dateFormat = "yyyyMMdd"
        }
        
        return formatter.string(from: now)
    }

    static func getFiveYearsBeforeDate(type: DateType) -> String {
        let formatter = DateFormatter()
        let now = Date()
        let calendar = Calendar.current

        guard let fiveYearsAgo = calendar.date(byAdding: .year, value: -5, to: now) else { return "" }

        switch type {
        case .annual:
            formatter.dateFormat = "yyyy"

        case .quarter:
            let year = calendar.component(.year, from: fiveYearsAgo)
            let month = calendar.component(.month, from: fiveYearsAgo)

            let quarter: String

            switch month {
            case 1...3:
                quarter = "Q1"
            case 4...6:
                quarter = "Q2"
            case 7...9:
                quarter = "Q3"
            case 10...12:
                quarter = "Q4"
            default:
                quarter = ""
            }

            return "\(year)\(quarter)"

        case .month:
            formatter.dateFormat = "yyyyMM"

        case .day:
            formatter.dateFormat = "yyyyMMdd"
        }

        return formatter.string(from: fiveYearsAgo)
    }
}
