//
//  News.swift
//  EconomyStock
//
//  Created by 권형일 on 12/31/24.
//

import SwiftUI

struct News: Identifiable {
    let id: String
    
    let type: CourseAndNewsType
    let title: String
    let newsTitle: String
    let number: String
    let lottieFileName: String
    let backgroundGradient: LinearGradient
    var parmanentProgressPage: Int
    var progressRate: Double
    var lastPage: Int
    let totalPage: Int
}

extension News {
    static var DUMMY_NEWS = News(id: UUID().uuidString, type: .basicEconomy, title: "기초 경제", newsTitle: "소비 투자 활황... 국민 소득 5% 증가", number: "III", lottieFileName: "BasicEconomyCourseCover", backgroundGradient: LinearGradient(
        gradient: Gradient(colors: [Color.yellow, Color.orange]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing), parmanentProgressPage: 5, progressRate: 100.0, lastPage: 3, totalPage: 5)
}
