//
//  StudyViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 10/9/24.
//

import SwiftUI

@Observable
class StudyingViewModel {
    let studyingItems: [StudyingItem] = [
        StudyingItem(title: "기초 경제", lottieFileName: "BasicEconomyCover", backgroundColor: .yellow, destination: .BasicEconomyCourseView)
    ]
}

struct StudyingItem: Identifiable {
    let id = UUID()
    let title: String
    let lottieFileName: String
    let backgroundColor: Color
    let destination: NavigationStackPath
}
