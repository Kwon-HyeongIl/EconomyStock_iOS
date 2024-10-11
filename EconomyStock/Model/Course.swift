//
//  Course.swift
//  EconomyStock
//
//  Created by 권형일 on 10/10/24.
//

import SwiftUI

struct Course: Identifiable {
    let id: String
    
    let title: String
    let number: String
    let description: String
    let lottieFileName: String
    let backgroundGradient: LinearGradient
    let progressRate: Double
}

extension Course {
    static var DUMMY_COURSE = Course(id: UUID().uuidString, title: "기초 경제", number: "III", description: "소개입니다", lottieFileName: "BasicEconomyCourseCover", backgroundGradient: LinearGradient(
        gradient: Gradient(colors: [Color.yellow, Color.orange]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing), progressRate: 100.0)
}
