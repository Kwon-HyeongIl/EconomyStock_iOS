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
        
        let currentPage = Double(currentUser?.studyingCourse.BasicEconomyCurrentPage ?? 0)
        let totalPage = 12.0
        self.progressRate = (currentPage / totalPage) * 100.0   
    }
}
