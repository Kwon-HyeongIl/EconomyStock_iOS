//
//  CourseCompletionViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 12/10/24.
//

import Foundation

@Observable
class CourseAndNewsCompletionViewModel {
    let type: CourseType
    
    let currentPage: Int
    var courseName = ""
    var courseCover = ""
    
    var newsName = ""
    
    init(type: CourseType, currentPage: Int) {
        self.type = type
        self.currentPage = currentPage
        initCourseName()
    }
    
    private func initCourseName() {
        switch type {
            
        case .basicEconomy:
            self.courseName = "I 기초 경제"
            self.courseCover = "BasicEconomyCourseCover"
            self.newsName = "소비 투자 활황... 국민소득 5% 증가"
            
        case .priceLevel:
            self.courseName = "II 물가"
            self.courseCover = "PriceLevelCourseCover"
            self.newsName = "고공행진 인플레이션, 서민 경제 직격탄"
            
        case .unEmployment:
            self.courseName = "III 실업"
            self.courseCover = "UnEmploymentCourseCover"
            self.newsName = "실망노동자 증가... 실업률 통계에 잡히지 않는 '보이지 않는 위기'"
            
        case .moneyAndFinance:
            self.courseName = "IV 화폐와 금융"
            self.courseCover = "MoneyAndFinanceCourseCover"
            self.newsName = "한국은행, 화폐공급 확대... 경기 부양 속 물가 우려"
            
        case .exchangeRateAndBalanceOfPayment:
            self.courseName = "V 환율과 국제수지"
            self.courseCover = "ExchangeRateAndBalanceOfPaymentCourseCover"
            self.newsName = "환율 폭등 속 금리 인하... 시장 불안 가중"
        }
    }
    
    func updateUserCoursePage() async {
        CourseManager.updateUserCoursePageRoute(type: type, isEnd: true, currentPage: currentPage)
    }
}
