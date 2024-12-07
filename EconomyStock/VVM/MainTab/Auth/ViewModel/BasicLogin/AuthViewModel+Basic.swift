//
//  LoginViewModel+Basic.swift
//  EconomyStock
//
//  Created by 권형일 on 11/30/24.
//

import Foundation

extension AuthViewModel {
    func login() async -> Bool {
        return await AuthManager.shared.login(email: self.email, password: self.password)
    }
}
