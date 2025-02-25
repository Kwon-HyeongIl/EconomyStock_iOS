//
//  ProfileViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 11/12/24.
//

import Foundation

@Observable
class ProfileViewModel: Hashable, Equatable {
    var remoteUser: User? {
        AuthManager.shared.remoteUser
    }
    var localUser: LocalUser? {
        AuthManager.shared.localUser
    }
    
    var isLogin: Bool {
        AuthManager.shared.isLogin
    }
    
    var dDay: Int {
        let components = Calendar.current.dateComponents([.day], from: remoteUser?.startDate ?? Date(), to: Date())
        return (components.day ?? 0) + 1
    }
    
    var totalStudyingRate: Double {
        if isLogin {
            AuthManager.shared.remoteUser?.totalStudyingRate ?? 0.0
        } else {
            AuthManager.shared.localUser?.totalStudyingRate ?? 0.0
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
