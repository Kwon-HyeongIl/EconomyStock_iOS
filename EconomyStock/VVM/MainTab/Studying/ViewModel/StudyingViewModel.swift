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
        
        let basicEconomyCurrentPage = Double(currentUser?.studyingCourse.basicEconomyCurrentPage ?? 0)
        let basicEconomyTotalPage = 12.0
        let basicEconomyProgressRate = (basicEconomyCurrentPage / basicEconomyTotalPage) * 100.0
        
        tempCorses.append(Course(id: UUID().uuidString, title: "기초 경제", number: "I", description: "설명입니다", lottieFileName: "BasicEconomyCourseCover", backgroundGradient: basicEconomyGradient, progressRate: basicEconomyProgressRate))
        
        
        // II 물가
        let priceGradient = LinearGradient(
            gradient: Gradient(colors: [.yellow, .orange]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        let priceCurrentPage = Double(currentUser?.studyingCourse.priceCurrentPage ?? 0)
        let priceTotalPage = 12.0
        let priceProgressRate = (priceCurrentPage / priceTotalPage) * 100.0
        
        tempCorses.append(Course(id: UUID().uuidString, title: "물가", number: "II", description: "설명입니다", lottieFileName: "PriceCourseCover", backgroundGradient: priceGradient, progressRate: priceProgressRate))
        
        // 다른 항목들 추가
        
        DispatchQueue.main.async {
            self.courses = tempCorses
        }
    }
}
