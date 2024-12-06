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
    static func requestBR(completion: @escaping ([EconomicIndicatorCycleData]) -> Void) {
        guard let key = Bundle.main.infoDictionary?["BANKOFKOREA_OPENAPI_KEY"] as? String else { return }
        let nowDate = getNowDate(type: .day)
        let fireYearsBeforeDate = getFiveYearsBeforeDate(type: .day)
        let url = "https://ecos.bok.or.kr/api/StatisticSearch/\(key)/json/kr/1/3000/722Y001/D/\(fireYearsBeforeDate)/\(nowDate)/0101000/?/?/?"
        
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
    
    // 소비자물가지수
    static func requestCPI(completion: @escaping ([EconomicIndicatorCycleData]) -> Void) {
        guard let key = Bundle.main.infoDictionary?["BANKOFKOREA_OPENAPI_KEY"] as? String else { return }
        let nowDate = getNowDate(type: .month)
        let fiveYearsBeforeDate = getFiveYearsBeforeDate(type: .month)
        let url = "https://ecos.bok.or.kr/api/StatisticSearch/\(key)/json/kr/1/3000/901Y009/M/\(fiveYearsBeforeDate)/\(nowDate)/0/?/?/?"
        
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

}
