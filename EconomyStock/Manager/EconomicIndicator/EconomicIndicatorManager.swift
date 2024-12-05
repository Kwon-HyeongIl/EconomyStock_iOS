//
//  EconomicIndicatorManager.swift
//  EconomyStock
//
//  Created by 권형일 on 12/3/24.
//

import Foundation
import Alamofire

class EconomicIndicatorManager {
    // 기준금리
    static func requestBaseRate(completion: @escaping ([EconomicIndicatorCycleData]) -> Void) {
        guard let key = Bundle.main.infoDictionary?["BANKOFKOREA_OPENAPI_KEY"] as? String else { return }
        let nowDate = getNowDate(type: .day)
        let url = "https://ecos.bok.or.kr/api/StatisticSearch/\(key)/json/kr/1/1000/722Y001/D/20240101/\(nowDate)/0101000/?/?/?"
        
        AF.request(url)
            .validate()
            .responseDecodable(of: EconomicIndicatorCycleContainer.self) { response in
                switch response.result {
                    
                case .success(let data):
                    completion(data.statisticSearch.cycle)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    completion([])
                }
            }
    }
    
    private static func getNowDate(type: DateType) -> String {
        let formatter = DateFormatter()
        let now = Date()
        let calendar = Calendar.current
        
        switch type {
            
        case .annual:
            formatter.dateFormat = "yyyy"
            
        case .quater:
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

}
