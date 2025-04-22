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
    @ObservationIgnored var BRYearFilter: [String] {
        BR
            .filter { $0.time.hasSuffix("01.01") }
            .map { $0.time }
    }
    
    @ObservationIgnored var bannerUnitId = Bundle.main.infoDictionary?["GOOGLE_ADMOB_BANNER_AD_UNIT_ID"] as? String
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
        EconomicIndicatorManager.requestCPI()
            .map { [unowned self] cycle in
                cycle.map { data in
                    var item = data
                    item.time = self.formatDateString(item.time, type: .month)
                    return item
                }
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("CPI 요청 성공")
                case .failure(let error):
                    print("CPI 요청 실패:", error.localizedDescription)
                }
            }, receiveValue: { [weak self] data in
                self?.CPI = data
            })
            .store(in: &cancellables)
    }
    
    // 원달러환율
    func initWDER() {
        EconomicIndicatorManager.requestWDER()
            .map { [unowned self] cycle in
                cycle.map { data in
                    var item = data
                    item.time = self.formatDateString(item.time, type: .day)
                    return item
                }
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("WDER 요청 성공")
                case .failure(let error):
                    print("WDER 요청 실패:", error.localizedDescription)
                }
            }, receiveValue: { [weak self] data in
                self?.WDER = data
            })
            .store(in: &cancellables)
    }
    
    // M1
    func initM1() {
        EconomicIndicatorManager.requestM1()
            .map { [unowned self] cycle in
                cycle.map { data in
                    var item = data
                    item.time = self.formatDateString(item.time, type: .month)
                    return item
                }
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("M1 요청 성공")
                case .failure(let error):
                    print("M1 요청 실패:", error.localizedDescription)
                }
            }, receiveValue: { [weak self] data in
                self?.M1 = data
            })
            .store(in: &cancellables)
    }
    
    // M2
    func initM2() {
        EconomicIndicatorManager.requestM2()
            .map { [unowned self] cycle in
                cycle.map { data in
                    var item = data
                    item.time = self.formatDateString(item.time, type: .month)
                    return item
                }
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("M2 요청 성공")
                case .failure(let error):
                    print("M2 요청 실패:", error.localizedDescription)
                }
            }, receiveValue: { [weak self] data in
                self?.M2 = data
            })
            .store(in: &cancellables)
    }
    
    // EGR
    func initEGR() {
        EconomicIndicatorManager.requestEGR()
            .map { [unowned self] cycle in
                cycle.map { data in
                    var item = data
                    item.time = self.formatDateString(item.time, type: .quarter)
                    return item
                }
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("EGR 요청 성공")
                case .failure(let error):
                    print("EGR 요청 실패:", error.localizedDescription)
                }
            }, receiveValue: { [weak self] data in
                self?.EGR = data
            })
            .store(in: &cancellables)
    }
    
    // UR
    func initUR() {
        EconomicIndicatorManager.requestUR()
            .map { [unowned self] cycle in
                cycle.map { data in
                    var item = data
                    item.time = self.formatDateString(item.time, type: .month)
                    return item
                }
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("UR 요청 성공")
                case .failure(let error):
                    print("UR 요청 실패:", error.localizedDescription)
                }
            }, receiveValue: { [weak self] data in
                self?.UR = data
            })
            .store(in: &cancellables)
    }
}
