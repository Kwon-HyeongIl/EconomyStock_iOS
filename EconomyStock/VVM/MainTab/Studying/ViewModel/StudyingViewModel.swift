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
        
        // 기초 경제
        let basicEconomyGradient = LinearGradient(
            gradient: Gradient(colors: [Color.yellow, Color.orange]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        
        let basicEconomyCurrentPage = Double(currentUser?.studyingCourse.BasicEconomyCurrentPage ?? 0)
        let basicEconomyTotalPage = 12.0
        let basicEconomyProgressRate = (basicEconomyCurrentPage / basicEconomyTotalPage) * 100.0
        
        tempCorses.append(Course(id: UUID().uuidString, title: "기초 경제", description: "설명입니다", lottieFileName: "BasicEconomyCover", backgroundGradient: basicEconomyGradient, progressRate: basicEconomyProgressRate))
        
        // 다른 항목들 추가
        
        DispatchQueue.main.async {
            self.courses = tempCorses
        }
    }
}
