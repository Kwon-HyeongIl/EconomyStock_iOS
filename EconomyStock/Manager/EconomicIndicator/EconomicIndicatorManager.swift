//
//  EconomicIndicatorManager.swift
//  EconomyStock
//
//  Created by 권형일 on 12/3/24.
//

import Foundation
import Alamofire

class EconomicIndicatorManager {
    static func requestEconomicIndicators(completion: @escaping ([EconomicIndicator]) -> Void) {
        guard let key = Bundle.main.infoDictionary?["BANKOFKOREA_OPENAPI_KEY"] as? String else { return }
        
        let url = "https://ecos.bok.or.kr/api/KeyStatisticList/\(key)/json/kr/1/100"
        
        AF.request(url)
            .validate()
            .responseDecodable(of: EconomicIndicatorListContainer.self) { response in
                switch response.result {
                case .success(let data):
                    completion(data.keyStatisticList.row)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    completion([])
                }
            }
    }
}
