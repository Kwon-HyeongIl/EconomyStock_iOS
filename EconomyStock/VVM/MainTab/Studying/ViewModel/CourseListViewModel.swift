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
        
        let gradient = LinearGradient(
            gradient: Gradient(colors: [.green, Color(red: 0.75, green: 1.0, blue: 0.0)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        let lastPage = Double(currentUser?.studyingCourse.basicEconomyLastPage ?? 0)
        let totalPage = 5.0
        let progressRate = (lastPage / totalPage) * 100.0
        
        DispatchQueue.main.async {
            self.courses.append(Course(id: UUID().uuidString, type: .basicEconomy, title: "기초 경제", number: "I", description: "설명입니다", lottieFileName: "BasicEconomyCourseCover", backgroundGradient: gradient, progressRate: progressRate, totalPage: Int(totalPage)))
        }
    }
    
    func updateBasicEconomyCourse() {
        let currentUser = AuthManager.shared.currentUser
        
        let lastPage = Double(currentUser?.studyingCourse.basicEconomyLastPage ?? 0)
        let totalPage = 5.0
        let progressRate = (lastPage / totalPage) * 100.0
        
        DispatchQueue.main.async {
            self.courses[0].progressRate = progressRate
        }
    }
    
    // II 물가
    func initPriceLevelCourse() {
        let currentUser = AuthManager.shared.currentUser
        
        let gradient = LinearGradient(
            gradient: Gradient(colors: [.yellow, .orange]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
        let lastPage = Double(currentUser?.studyingCourse.priceLevelLastPage ?? 0)
        let totalPage = 5.0
        let progressRate = (lastPage / totalPage) * 100.0
        
        DispatchQueue.main.async {
            self.courses.append(Course(id: UUID().uuidString, type: .priceLevel, title: "물가", number: "II", description: "설명입니다", lottieFileName: "PriceLevelCourseCover", backgroundGradient: gradient, progressRate: progressRate, totalPage: Int(totalPage)))
        }
    }
    
    func updatePriceLevelCourse() {
        let currentUser = AuthManager.shared.currentUser
        
        let lastPage = Double(currentUser?.studyingCourse.priceLevelLastPage ?? 0)
        let totalPage = 5.0
        let progressRate = (lastPage / totalPage) * 100.0
        
        self.courses[1].progressRate = progressRate
    }
}
