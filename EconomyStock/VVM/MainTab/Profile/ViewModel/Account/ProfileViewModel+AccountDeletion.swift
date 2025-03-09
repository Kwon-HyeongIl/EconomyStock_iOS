//
//  ProfileViewModel+AccountDeletion.swift
//  EconomyStock
//
//  Created by 권형일 on 3/3/25.
//

import Foundation

extension ProfileViewModel {
    func deleteAccount() async {
        await AuthManager.shared.deleteAccount()
    }
}
