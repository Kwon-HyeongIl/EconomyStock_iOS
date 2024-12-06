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
        let fireYearsBeforeDate = getBeforeDate(year: .five, type: .day)
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
        let oneYearBeforeDate = getBeforeDate(year: .one, type: .month)
        let url = "https://ecos.bok.or.kr/api/StatisticSearch/\(key)/json/kr/1/3000/901Y009/M/\(oneYearBeforeDate)/\(nowDate)/0/?/?/?"
        
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
    
    // 원달러환율
    static func requestWDER(completion: @escaping ([EconomicIndicatorCycleData]) -> Void) {
        guard let key = Bundle.main.infoDictionary?["BANKOFKOREA_OPENAPI_KEY"] as? String else { return }
        let nowDate = getNowDate(type: .day)
        let oneYearBeforeDate = getBeforeDate(year: .one, type: .day)
        let url = "https://ecos.bok.or.kr/api/StatisticSearch/\(key)/json/kr/1/3000/731Y003/D/\(oneYearBeforeDate)/\(nowDate)/0000003/?/?"
        
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
    
    // M1
    static func requestM1(completion: @escaping ([EconomicIndicatorCycleData]) -> Void) {
        guard let key = Bundle.main.infoDictionary?["BANKOFKOREA_OPENAPI_KEY"] as? String else { return }
        let nowDate = getNowDate(type: .month)
        let oneYearBeforeDate = getBeforeDate(year: .one, type: .month)
        let url = "https://ecos.bok.or.kr/api/StatisticSearch/\(key)/json/kr/1/3000/101Y019/M/\(oneYearBeforeDate)/\(nowDate)/BBLA00/?/?"
        
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
    
    // M2
    static func requestM2(completion: @escaping ([EconomicIndicatorCycleData]) -> Void) {
        guard let key = Bundle.main.infoDictionary?["BANKOFKOREA_OPENAPI_KEY"] as? String else { return }
        let nowDate = getNowDate(type: .month)
        let oneYearBeforeDate = getBeforeDate(year: .one, type: .month)
        let url = "https://ecos.bok.or.kr/api/StatisticSearch/\(key)/json/kr/1/3000/101Y004/M/\(oneYearBeforeDate)/\(nowDate)/BBHA00/?/?"
        
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
    
    // 경제성장률
    static func requestEGR(completion: @escaping ([EconomicIndicatorCycleData]) -> Void) {
        guard let key = Bundle.main.infoDictionary?["BANKOFKOREA_OPENAPI_KEY"] as? String else { return }
        let nowDate = getNowDate(type: .quarter)
        let oneYearBeforeDate = getBeforeDate(year: .one, type: .quarter)
        let url = "https://ecos.bok.or.kr/api/StatisticSearch/\(key)/json/kr/1/3000/902Y015/Q/\(oneYearBeforeDate)/\(nowDate)/KOR/?/?"
        
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
    
    // 실업률
    static func requestUR(completion: @escaping ([EconomicIndicatorCycleData]) -> Void) {
        guard let key = Bundle.main.infoDictionary?["BANKOFKOREA_OPENAPI_KEY"] as? String else { return }
        let nowDate = getNowDate(type: .month)
        let oneYearBeforeDate = getBeforeDate(year: .one, type: .month)
        let url = "https://ecos.bok.or.kr/api/StatisticSearch/\(key)/json/kr/1/3000/901Y027/M/\(oneYearBeforeDate)/\(nowDate)/I61BC/I28A/?/?"
        
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
