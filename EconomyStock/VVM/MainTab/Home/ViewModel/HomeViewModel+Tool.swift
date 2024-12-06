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

    
    // 기준금리 이전 지표의 차이값 계산
    func calculateBaseRateRecentDataValueChangeDifference() -> (difference: Double, date: String)? {
        guard let last = BR.last, let lastValue = Double(last.dataValue) else {
            return nil
        }
        
        for previousData in BR.dropLast().reversed() {
            if let previousValue = Double(previousData.dataValue), previousValue != lastValue {
                let difference = lastValue - previousValue
                return (difference, previousData.time)
            }
        }
        
        return nil
    }
    
    // 소비자물가지수 이전 지표의 차이값 계산
    func calculateCPIRecentDataValueChangeDifference() -> (difference: Double, date: String)? {
        guard let last = CPI.last, let lastValue = Double(last.dataValue) else {
            return nil
        }
        
        for previousData in CPI.dropLast().reversed() {
            if let previousValue = Double(previousData.dataValue), previousValue != lastValue {
                let difference = lastValue - previousValue
                return (difference, previousData.time)
            }
        }
        
        return nil
    }
    
    // 원달러환율 이전 지표의 차이값 계산
    func calculateWDERRecentDataValueChangeDifference() -> (difference: Double, date: String)? {
        guard let last = WDER.last, let lastValue = Double(last.dataValue) else {
            return nil
        }
        
        for previousData in WDER.dropLast().reversed() {
            if let previousValue = Double(previousData.dataValue), previousValue != lastValue {
                let difference = lastValue - previousValue
                return (difference, previousData.time)
            }
        }
        
        return nil
    }
    
    // M1
    func calculateM1RecentDataValueChangeDifference() -> (difference: Double, date: String)? {
        guard let last = M1.last, let lastValue = Double(last.dataValue) else {
            return nil
        }
        
        for previousData in M1.dropLast().reversed() {
            if let previousValue = Double(previousData.dataValue), previousValue != lastValue {
                let difference = lastValue - previousValue
                return (difference, previousData.time)
            }
        }
        
        return nil
    }
    
    // M2
    func calculateM2RecentDataValueChangeDifference() -> (difference: Double, date: String)? {
        guard let last = M2.last, let lastValue = Double(last.dataValue) else {
            return nil
        }
        
        for previousData in M2.dropLast().reversed() {
            if let previousValue = Double(previousData.dataValue), previousValue != lastValue {
                let difference = lastValue - previousValue
                return (difference, previousData.time)
            }
        }
        
        return nil
    }
}
