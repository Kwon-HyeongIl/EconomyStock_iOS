//
//  ProfileViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 11/12/24.
//

import Foundation

@Observable
class ProfileViewModel: Hashable, Equatable {
    let user: User?
    
    init() {
        user = AuthManager.shared.remoteUser
    }
    
    func singOut() {
        AuthManager.shared.signOut()
    }
    
    static func == (lhs: ProfileViewModel, rhs: ProfileViewModel) -> Bool {
        lhs.user?.id == rhs.user?.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(user?.id)
    }
}
