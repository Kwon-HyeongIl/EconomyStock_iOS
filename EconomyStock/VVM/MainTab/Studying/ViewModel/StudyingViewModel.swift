//
//  StudyViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 10/9/24.
//

import SwiftUI

@Observable
class StudyingViewModel {
    var courses: [Course] = []
    
    init() {
        let currentUser = AuthManager.shared.currentUser
        
        var tempCorses: [Course] = []
        
        // I 기초 경제
        let basicEconomyGradient = LinearGradient(
            gradient: Gradient(colors: [.green, Color(red: 0.75, green: 1.0, blue: 0.0)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        let basicEconomyLastPage = Double(currentUser?.studyingCourse.basicEconomyLastPage ?? 0)
        let basicEconomyTotalPage = 5.0
        let basicEconomyProgressRate = (basicEconomyLastPage / basicEconomyTotalPage) * 100.0
        
        tempCorses.append(Course(id: UUID().uuidString, title: "기초 경제", number: "I", description: "설명입니다", lottieFileName: "BasicEconomyCourseCover", backgroundGradient: basicEconomyGradient, progressRate: basicEconomyProgressRate, totalPage: Int(basicEconomyTotalPage)))
        
        
        // II 물가
        let priceLevelGradient = LinearGradient(
            gradient: Gradient(colors: [.yellow, .orange]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        let priceLevelCurrentPage = Double(currentUser?.studyingCourse.priceLevelLastPage ?? 0)
        let priceLevelTotalPage = 5.0
        let priceLevelProgressRate = (priceLevelCurrentPage / priceLevelTotalPage) * 100.0
        
        tempCorses.append(Course(id: UUID().uuidString, title: "물가", number: "II", description: "설명입니다", lottieFileName: "PriceLevelCourseCover", backgroundGradient: priceLevelGradient, progressRate: priceLevelProgressRate, totalPage: Int(priceLevelTotalPage)))
        
        // 다른 항목들 추가
        
        DispatchQueue.main.async {
            self.courses = tempCorses
        }
    }
}
