//
//  ProfileViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 11/12/24.
//

import Foundation

@Observable
class ProfileViewModel: Hashable, Equatable {
    var remoteUser: User?
    var localUser: LocalUser?
    
    var isLogin = false
    
    var userName = ""
    var totalStudyingPercentage: Double
    
    init() {
        if AuthManager.shared.isLogin ?? false {
            let user = AuthManager.shared.remoteUser
            self.remoteUser = user
            
            self.isLogin = true
            self.userName = user?.username ?? ""
            self.totalStudyingPercentage = user?.totalStudyingPercentage ?? 0.0
            
        } else {
            let user = AuthManager.shared.localUser
            
            self.localUser = user
            
            self.totalStudyingPercentage = user?.totalStudyingPercentage ?? 0.0
        }
    }
    
    func singOut() {
        AuthManager.shared.signOut()
    }
    
    static func == (lhs: ProfileViewModel, rhs: ProfileViewModel) -> Bool {
        lhs.remoteUser?.id == rhs.remoteUser?.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(remoteUser?.id)
    }
}
