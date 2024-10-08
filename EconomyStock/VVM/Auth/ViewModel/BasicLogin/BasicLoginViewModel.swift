//
//  BasicLoginViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 10/8/24.
//

import Foundation

@Observable
class BasicLoginViewModel {
    var email = ""
    var password = ""
    
    func login() async -> Bool {
        return await AuthManager.shared.login(email: self.email, password: self.password)
    }
}
