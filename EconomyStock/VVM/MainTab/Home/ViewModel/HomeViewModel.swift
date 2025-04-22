//
//  HomeViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 12/3/24.
//

import Foundation
import Combine

@Observable
class HomeViewModel {
    var isLogin: Bool {
        AuthManager.shared.isLogin
    }
    
    var bannerUnitId = Bundle.main.infoDictionary?["GOOGLE_ADMOB_BANNER_AD_UNIT_ID"] as? String
    
    var BR = [EconomicIndicatorCycleData]()
    var CPI = [EconomicIndicatorCycleData]()
    var WDER = [EconomicIndicatorCycleData]()
    var M1 = [EconomicIndicatorCycleData]()
    var M2 = [EconomicIndicatorCycleData]()
    var EGR = [EconomicIndicatorCycleData]()
    var UR = [EconomicIndicatorCycleData]()
    
    var isFirstLoad = true
    var isRedacted = true
    
    // 그래프 X축 연도 필터
    var BRYearFilter: [String] {
        BR
            .filter { $0.time.hasSuffix("01.01") }
            .map { $0.time }
    }
    
    @ObservationIgnored private var cancellables = Set<AnyCancellable>()
    
    init() {
        initBR()
        initCPI()
        initWDER()
        initM1()
        initM2()
        initEGR()
        initUR()
    }

    // 기준금리 (5년치 일 데이터를 1/7)
    func initBR() {
        EconomicIndicatorManager.requestBR()
            .map { [unowned self] cycle -> [EconomicIndicatorCycleData] in
                stride(from: 0, to: cycle.count, by: 7).map { idx in
                    var item = cycle[idx]
                    item.time = self.formatDateString(item.time, type: .day)
                    return item
                }
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("BR 요청 성공")
                case .failure(let error):
                    print("BR 요청 실패:", error.localizedDescription)
                }
            }, receiveValue: { [weak self] data in
                self?.BR = data
            })
            .store(in: &cancellables)
    }
    
    // 소비자물가지수
    func initCPI() {
        EconomicIndicatorManager.requestCPI { CPI in
            DispatchQueue.main.async {
                self.CPI = CPI.map { data in
                    var modifiedData = data
                    modifiedData.time = self.formatDateString(data.time, type: .month)
                    
                    return modifiedData
                }
            }
        }
    }
    
    // 원달러환율
    func initWDER() {
        EconomicIndicatorManager.requestWDER { WDER in
            DispatchQueue.main.async {
                self.WDER = WDER.map { data in
                    var modifiedData = data
                    modifiedData.time = self.formatDateString(data.time, type: .day)
                    
                    return modifiedData
                }
            }
        }
    }
    
    // M1
    func initM1() {
        EconomicIndicatorManager.requestM1 { M1 in
            DispatchQueue.main.async {
                self.M1 = M1.map { data in
                    var modifiedData = data
                    modifiedData.time = self.formatDateString(data.time, type: .month)
                    
                    return modifiedData
                }
            }
        }
    }
    
    // M2
    func initM2() {
        EconomicIndicatorManager.requestM2 { M2 in
            DispatchQueue.main.async {
                self.M2 = M2.map { data in
                    var modifiedData = data
                    modifiedData.time = self.formatDateString(data.time, type: .month)
                    
                    return modifiedData
                }
            }
        }
    }
    
    // EGR
    func initEGR() {
        EconomicIndicatorManager.requestEGR { EGR in
            DispatchQueue.main.async {
                self.EGR = EGR.map { data in
                    var modifiedData = data
                    modifiedData.time = self.formatDateString(data.time, type: .quarter)
                    
                    return modifiedData
                }
            }
        }
    }
    
    // UR
    func initUR() {
        EconomicIndicatorManager.requestUR { UR in
            DispatchQueue.main.async {
                self.UR = UR.map { data in
                    var modifiedData = data
                    modifiedData.time = self.formatDateString(data.time, type: .month)
                    
                    return modifiedData
                }
            }
        }
    }
}
