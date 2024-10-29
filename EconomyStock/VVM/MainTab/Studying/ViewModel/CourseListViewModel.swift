//
//  StudyViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 10/9/24.
//

import SwiftUI

@Observable
class CourseListViewModel {
    var courses: [Course] = []
    
    init() {
        initBasicEconomyCourse()
        initPriceLevelCourse()
    }
    
    // I 기초 경제
    func initBasicEconomyCourse() {
        let currentUser = AuthManager.shared.currentUser
        
        let basicEconomyGradient = LinearGradient(
            gradient: Gradient(colors: [.green, Color(red: 0.75, green: 1.0, blue: 0.0)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        let basicEconomyLastPage = Double(currentUser?.studyingCourse.basicEconomyLastPage ?? 0)
        let basicEconomyTotalPage = 5.0
        let basicEconomyProgressRate = (basicEconomyLastPage / basicEconomyTotalPage) * 100.0
        
        DispatchQueue.main.async {
            self.courses.append(Course(id: UUID().uuidString, type: .basicEconomy, title: "기초 경제", number: "I", description: "설명입니다", lottieFileName: "BasicEconomyCourseCover", backgroundGradient: basicEconomyGradient, progressRate: basicEconomyProgressRate, totalPage: Int(basicEconomyTotalPage)))
        }
    }
    
    // II 물가
    func initPriceLevelCourse() {
        let currentUser = AuthManager.shared.currentUser
        
        let priceLevelGradient = LinearGradient(
            gradient: Gradient(colors: [.yellow, .orange]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        let priceLevelCurrentPage = Double(currentUser?.studyingCourse.priceLevelLastPage ?? 0)
        let priceLevelTotalPage = 5.0
        let priceLevelProgressRate = (priceLevelCurrentPage / priceLevelTotalPage) * 100.0
        
        DispatchQueue.main.async {
            self.courses.append(Course(id: UUID().uuidString, type: .priceLevel, title: "물가", number: "II", description: "설명입니다", lottieFileName: "PriceLevelCourseCover", backgroundGradient: priceLevelGradient, progressRate: priceLevelProgressRate, totalPage: Int(priceLevelTotalPage)))
        }
    }
}
