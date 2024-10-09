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
        
        tempStudyingItems.append(StudyingItem(title: "기초 경제", lottieFileName: "BasicEconomyCover", backgroundColor: .yellow, destination: .BasicEconomyCourseView, progressRate: currentUser?.studyingCourse.BasicEconomy ?? 0.0))
        
        // 다른 항목들 추가
        
        self.studyingItems = tempStudyingItems
    }
}

struct StudyingItem: Identifiable {
    let id = UUID()
    let title: String
    let lottieFileName: String
    let backgroundColor: Color
    let destination: NavigationStackPath
    var progressRate: Double
}
