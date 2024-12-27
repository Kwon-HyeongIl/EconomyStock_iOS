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
    
    var isNotificationBadge: Bool?
    var notificationType: [NotificationType]
    
    var totalStudyingPercentage: Double
    var studyingCourse: StudyingCourse
    
    init(id: UUID, deviceToken: String, isNotificationBadge: Bool? = nil, notificationType: [NotificationType], totalStudyingPercentage: Double, studyingCourse: StudyingCourse) {
        self.id = id
        self.deviceToken = deviceToken
        self.isNotificationBadge = isNotificationBadge
        self.notificationType = notificationType
        self.totalStudyingPercentage = totalStudyingPercentage
        self.studyingCourse = studyingCourse
    }
}
