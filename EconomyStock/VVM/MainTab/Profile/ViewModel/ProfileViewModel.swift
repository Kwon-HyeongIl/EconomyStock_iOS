//
//  ProfileViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 11/12/24.
//

import Foundation

@Observable
class ProfileViewModel {
    let user: User?
    
    init() {
        user = AuthManager.shared.currentUser
    }
    
    func singOut() {
        AuthManager.shared.signOut()
    }
}
