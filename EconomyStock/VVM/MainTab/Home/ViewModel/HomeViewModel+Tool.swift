//
//  HomeViewModel+Tool.swift
//  EconomyStock
//
//  Created by 권형일 on 12/6/24.
//

import Foundation

extension HomeViewModel {
    // yy.MM.dd 변환
    func formatDateString(_ dateString: String, type: DateType) -> String {
        let year = dateString.prefix(4)
        let month = dateString.dropFirst(4).prefix(2)
        let day = dateString.suffix(2)
        
        switch type {
        case .annual:
            return "\(year)"
            
        case .quarter:
            guard let monthInt = Int(month) else { return "\(year)" }
            let quarter: String
            switch monthInt {
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
            return "\(year).\(month)"
            
        case .day:
            return "\(year).\(month).\(day)"
        }
    }

    
    // 이전 지표의 차이값 계산
    func calculateRecentDataValueChangeDifference(for dataArray: [EconomicIndicatorCycleData]) -> (difference: Double, date: String)? {
        guard let last = dataArray.last, let lastValue = Double(last.dataValue) else {
            return nil
        }
        
        for previousData in dataArray.dropLast().reversed() {
            if let previousValue = Double(previousData.dataValue), previousValue != lastValue {
                let difference = lastValue - previousValue
                return (difference, previousData.time)
            }
        }
        
        return nil
    }
}
