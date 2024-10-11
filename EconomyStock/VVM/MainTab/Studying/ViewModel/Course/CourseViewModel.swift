//
//  StudyingViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 10/10/24.
//

import Foundation

@Observable
class CourseViewModel: Hashable, Equatable {
    let course: Course
    
    var currentPage = 1
    
    init(course: Course) {
        self.course = course
    }
    
    static func == (lhs: CourseViewModel, rhs: CourseViewModel) -> Bool {
        lhs.course.id == rhs.course.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(course.id)
    }
}
