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
        
        let BasicEconomyGradient = LinearGradient(
            gradient: Gradient(colors: [Color.yellow, Color.orange]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        tempStudyingItems.append(StudyingItem(title: "기초 경제", lottieFileName: "BasicEconomyCover", backgroundGradient: BasicEconomyGradient, destination: .BasicEconomyCourseView, progressRate: currentUser?.studyingCourse.BasicEconomy ?? 0.0))
        
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
