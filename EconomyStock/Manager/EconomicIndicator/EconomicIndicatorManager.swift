//
//  EconomicIndicatorManager.swift
//  EconomyStock
//
//  Created by 권형일 on 12/3/24.
//

import Foundation
import Alamofire
import Combine

class EconomicIndicatorManager {
    
    // 기준금리
    static func requestBR() -> AnyPublisher<[EconomicIndicatorCycleData], Error> {
        guard let key = Bundle.main.infoDictionary?["BANKOFKOREA_OPENAPI_KEY"] as? String else {
            return Fail(error: KeyError.missing)
                .eraseToAnyPublisher()
        }
        
        let nowDate = getNowDate(type: .day)
        let fireYearsBeforeDate = getBeforeDate(year: .five, type: .day)
        let url = "https://ecos.bok.or.kr/api/StatisticSearch/\(key)/json/kr/1/3000/722Y001/D/\(fireYearsBeforeDate)/\(nowDate)/0101000/?/?/?"
        
        return AF.request(url)
            .validate()
            .publishDecodable(type: EconomicIndicatorResponse.self)
            .value()
            .map { $0.statisticSearch.row }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    // 소비자물가지수
    static func requestCPI() -> AnyPublisher<[EconomicIndicatorCycleData], Error> {
        guard let key = Bundle.main.infoDictionary?["BANKOFKOREA_OPENAPI_KEY"] as? String else {
            return Fail(error: KeyError.missing)
                .eraseToAnyPublisher()
        }
        
        let nowDate = getNowDate(type: .month)
        let oneYearBeforeDate = getBeforeDate(year: .one, type: .month)
        let url = "https://ecos.bok.or.kr/api/StatisticSearch/\(key)/json/kr/1/3000/901Y009/M/\(oneYearBeforeDate)/\(nowDate)/0/?/?/?"
        
        return AF.request(url)
            .validate()
            .publishDecodable(type: EconomicIndicatorResponse.self)
            .value()
            .map { $0.statisticSearch.row }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    // 원달러환율
    static func requestWDER() -> AnyPublisher<[EconomicIndicatorCycleData], Error> {
        guard let key = Bundle.main.infoDictionary?["BANKOFKOREA_OPENAPI_KEY"] as? String else {
            return Fail(error: KeyError.missing)
                .eraseToAnyPublisher()
        }
        
        let nowDate = getNowDate(type: .day)
        let oneYearBeforeDate = getBeforeDate(year: .one, type: .day)
        let url = "https://ecos.bok.or.kr/api/StatisticSearch/\(key)/json/kr/1/3000/731Y003/D/\(oneYearBeforeDate)/\(nowDate)/0000003/?/?"
        
        return AF.request(url)
            .validate()
            .publishDecodable(type: EconomicIndicatorResponse.self)
            .value()
            .print("❗️")
            .map { $0.statisticSearch.row }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    // M1
    static func requestM1() -> AnyPublisher<[EconomicIndicatorCycleData], Error> {
        guard let key = Bundle.main.infoDictionary?["BANKOFKOREA_OPENAPI_KEY"] as? String else {
            return Fail(error: KeyError.missing)
                .eraseToAnyPublisher()
        }
        
        let nowDate = getNowDate(type: .month)
        let oneYearBeforeDate = getBeforeDate(year: .one, type: .month)
        let url = "https://ecos.bok.or.kr/api/StatisticSearch/\(key)/json/kr/1/3000/101Y019/M/\(oneYearBeforeDate)/\(nowDate)/BBLA00/?/?"
        
        return AF.request(url)
            .validate()
            .publishDecodable(type: EconomicIndicatorResponse.self)
            .value()
            .map { $0.statisticSearch.row }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    // M2
    static func requestM2() -> AnyPublisher<[EconomicIndicatorCycleData], Error> {
        guard let key = Bundle.main.infoDictionary?["BANKOFKOREA_OPENAPI_KEY"] as? String else {
            return Fail(error: KeyError.missing)
                .eraseToAnyPublisher()
        }
        
        let nowDate = getNowDate(type: .month)
        let oneYearBeforeDate = getBeforeDate(year: .one, type: .month)
        let url = "https://ecos.bok.or.kr/api/StatisticSearch/\(key)/json/kr/1/3000/101Y004/M/\(oneYearBeforeDate)/\(nowDate)/BBHA00/?/?"
        
        return AF.request(url)
            .validate()
            .publishDecodable(type: EconomicIndicatorResponse.self)
            .value()
            .map { $0.statisticSearch.row }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    // 경제성장률
    static func requestEGR() -> AnyPublisher<[EconomicIndicatorCycleData], Error> {
        guard let key = Bundle.main.infoDictionary?["BANKOFKOREA_OPENAPI_KEY"] as? String else {
            return Fail(error: KeyError.missing)
                .eraseToAnyPublisher()
        }
        
        let nowDate = getNowDate(type: .quarter)
        let oneYearBeforeDate = getBeforeDate(year: .one, type: .quarter)
        let url = "https://ecos.bok.or.kr/api/StatisticSearch/\(key)/json/kr/1/3000/902Y015/Q/\(oneYearBeforeDate)/\(nowDate)/KOR/?/?"
        
        return AF.request(url)
            .validate()
            .publishDecodable(type: EconomicIndicatorResponse.self)
            .value()
            .map { $0.statisticSearch.row }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    // 실업률
    static func requestUR() -> AnyPublisher<[EconomicIndicatorCycleData], Error> {
        guard let key = Bundle.main.infoDictionary?["BANKOFKOREA_OPENAPI_KEY"] as? String else {
            return Fail(error: KeyError.missing)
                .eraseToAnyPublisher()
        }
        
        let nowDate = getNowDate(type: .month)
        let oneYearBeforeDate = getBeforeDate(year: .one, type: .month)
        let url = "https://ecos.bok.or.kr/api/StatisticSearch/\(key)/json/kr/1/3000/901Y027/M/\(oneYearBeforeDate)/\(nowDate)/I61BC/I28A/?/?"
        
        return AF.request(url)
            .validate()
            .publishDecodable(type: EconomicIndicatorResponse.self)
            .value()
            .map { $0.statisticSearch.row }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
