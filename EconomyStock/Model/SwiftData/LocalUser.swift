//
//  LocalUser.swift
//  EconomyStock
//
//  Created by 권형일 on 12/14/24.
//

import Foundation
import SwiftData

@Model
class LocalUser {
    var id: UUID
    
    var deviceToken: String
    var startDate: Date
    
    var isNotificationBadge: Bool?
    var notificationType: [NotificationType]
    
    var totalStudyingRate: Double
    var studyingCourse: StudyingCourse
    var studyingNews: StudyingNews
    
    init(id: UUID, deviceToken: String, startDate: Date, isNotificationBadge: Bool? = nil, notificationType: [NotificationType], totalStudyingPercentage: Double, studyingCourse: StudyingCourse, studyingNews: StudyingNews) {
        self.id = id
        self.deviceToken = deviceToken
        self.startDate = startDate
        self.isNotificationBadge = isNotificationBadge
        self.notificationType = notificationType
        self.totalStudyingRate = totalStudyingPercentage
        self.studyingCourse = studyingCourse
        self.studyingNews = studyingNews
    }
}
