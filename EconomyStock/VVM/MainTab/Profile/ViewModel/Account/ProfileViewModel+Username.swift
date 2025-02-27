//
//  ProfileViewModel+Username.swift
//  EconomyStock
//
//  Created by 권형일 on 2/27/25.
//

import Foundation

extension ProfileViewModel {
    func updateUsername(_ username: String) async {
        AuthManager.shared.remoteUser?.username = username
        
        await AuthManager.updateUsername(username)
    }
}
