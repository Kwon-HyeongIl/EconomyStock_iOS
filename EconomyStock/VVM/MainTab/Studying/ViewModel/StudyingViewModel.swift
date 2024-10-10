//
//  StudyViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 10/9/24.
//

import SwiftUI

@Observable
class StudyingViewModel {
    var studyingItems: [StudyingItem] = []
    
    init() {
        let currentUser = AuthManager.shared.currentUser
        
        var tempStudyingItems: [StudyingItem] = []
        
        // 기초 경제
        let basicEconomyGradient = LinearGradient(
            gradient: Gradient(colors: [Color.yellow, Color.orange]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        
        let basicEconomyCurrentPage = Double(currentUser?.studyingCourse.BasicEconomyCurrentPage ?? 0)
        let basicEconomyTotalPage = 12.0
        let basicEconomyProgressRate = (basicEconomyCurrentPage / basicEconomyTotalPage) * 100.0
        
        tempStudyingItems.append(StudyingItem(title: "기초 경제", lottieFileName: "BasicEconomyCover", backgroundGradient: basicEconomyGradient, destination: .BasicEconomyCourseIntroductionView, progressRate: basicEconomyProgressRate))
        
        // 다른 항목들 추가
        
        DispatchQueue.main.async {
            self.studyingItems = tempStudyingItems
        }
    }
}

struct StudyingItem: Identifiable {
    let id = UUID()
    let title: String
    let lottieFileName: String
    let backgroundGradient: LinearGradient
    let destination: NavigationStackPath
    var progressRate: Double
}
