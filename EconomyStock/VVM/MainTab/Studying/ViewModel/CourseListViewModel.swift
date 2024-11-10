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
        
        let parmanentProgressPage = Double(currentUser?.studyingCourse.basicEconomyParmanentProgressPage ?? 0)
        let totalPage = 11.0
        let progressRate = (parmanentProgressPage / totalPage) * 100.0
        
        let lastPage = currentUser?.studyingCourse.basicEconomyLastPage ?? 0
        
        DispatchQueue.main.async {
            self.courses.append(Course(id: UUID().uuidString, type: .basicEconomy, title: "기초 경제", number: "I", description: "설명입니다", lottieFileName: "BasicEconomyCourseCover", backgroundGradient: gradient, parmanentProgressPage: Int(parmanentProgressPage), progressRate: progressRate, lastPage: lastPage, totalPage: Int(totalPage)))
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
        
        let parmanentProgressPage = Double(currentUser?.studyingCourse.priceLevelLastPage ?? 0)
        let totalPage = 5.0
        let progressRate = (parmanentProgressPage / totalPage) * 100.0
        
        let lastPage = currentUser?.studyingCourse.priceLevelLastPage ?? 0
        
        DispatchQueue.main.async {
            self.courses.append(Course(id: UUID().uuidString, type: .priceLevel, title: "물가", number: "II", description: "설명입니다", lottieFileName: "PriceLevelCourseCover", backgroundGradient: gradient, parmanentProgressPage: Int(parmanentProgressPage), progressRate: progressRate, lastPage: lastPage, totalPage: Int(totalPage)))
        }
    }

    func updateAllCourses() {
        courses.removeAll()
        
        initBasicEconomyCourse()
        initPriceLevelCourse()
    }
}
