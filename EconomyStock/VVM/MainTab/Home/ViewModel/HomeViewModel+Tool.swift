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
        
        switch type {
            
        case .annual:
            return "\(year)"
            
        case .quarter:
            let quarterString = dateString.dropFirst(4)
            
            guard quarterString.first == "Q",
                  let qNum = Int(quarterString.dropFirst()),
                  (1...4).contains(qNum) else {
                
                return "\(year)"
            }
            
            let quarterText: String
            switch qNum {
            case 1:
                quarterText = "1분기"
            case 2:
                quarterText = "2분기"
            case 3:
                quarterText = "3분기"
            case 4:
                quarterText = "4분기"
            default:
                quarterText = ""
            }
            
            return "\(year).\(quarterText)"
            
        case .month:
            let month = dateString.dropFirst(4).prefix(2)
            
            return "\(year).\(month)"
            
        case .day:
            let month = dateString.dropFirst(4).prefix(2)
            let day = dateString.suffix(2)
            
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
