//
//  BasicCourseViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 10/9/24.
//

import Foundation

@Observable
class BasicEconomyCourseViewModel {
    var currentUser: User?
    
    var progressRate: Double = 0.0
    
    init() {
        self.currentUser = AuthManager.shared.currentUser
        self.progressRate = currentUser?.studyingCourse.BasicEconomy ?? 0.0
    }
}
