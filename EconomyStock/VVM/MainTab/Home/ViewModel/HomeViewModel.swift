//
//  HomeViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 12/3/24.
//

import Foundation

@Observable
class HomeViewModel {
    var baseRate = [EconomicIndicatorCycleData]()
    
    // 그래프 X축 연도 필터
    var baseRateYearFilter: [String] {
        baseRate
            .filter { $0.time.hasSuffix("01.01") }
            .map { $0.time }
    }
    
    init() {
        requestBaseRate()
    }

    // 기준금리
    func requestBaseRate() {
        EconomicIndicatorManager.requestBaseRate { baseRate in
            DispatchQueue.main.async {
                self.baseRate = baseRate.map { data in
                    var modifiedData = data
                    modifiedData.time = self.formatDateString(data.time)
                    
                    return modifiedData
                }
            }
        }
    }
    
    // yy.MM.dd 변환
    private func formatDateString(_ dateString: String) -> String {
        let year = dateString.prefix(4)
        let month = dateString.dropFirst(4).prefix(2)
        let day = dateString.suffix(2)
        
        return "\(year).\(month).\(day)"
    }
    
    // 이전 지표의 차이값 계산
    func calculateBaseRateRecentDataValueChangeDifference() -> (difference: Double, date: String)? {
        guard let last = baseRate.last, let lastValue = Double(last.dataValue) else {
            return nil
        }
        
        for previousData in baseRate.dropLast().reversed() {
            if let previousValue = Double(previousData.dataValue), previousValue != lastValue {
                let difference = lastValue - previousValue
                return (difference, previousData.time)
            }
        }
        
        return nil
    }
}
