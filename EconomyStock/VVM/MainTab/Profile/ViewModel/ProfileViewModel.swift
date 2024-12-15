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
        let remoteUser = AuthManager.shared.remoteUser
        
        if remoteUser != nil {
            self.remoteUser = remoteUser
            
            self.isLogin = true
            self.userName = remoteUser?.username ?? ""
            self.totalStudyingPercentage = remoteUser?.totalStudyingPercentage ?? 0.0
            
        } else {
            let localUser = AuthManager.shared.localUser
            
            self.localUser = localUser
            
            self.totalStudyingPercentage = localUser?.totalStudyingPercentage ?? 0.0
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
