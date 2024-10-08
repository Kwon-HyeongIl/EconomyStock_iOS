//
//  LoginViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 10/2/24.
//

import Foundation

@Observable
class LoginViewModel: NSObject {
    var email = ""
    var password = ""
    
    var loadingBarState = false
    
    func login() async -> Bool {
        return await AuthManager.shared.login(email: self.email, password: self.password)
    }
}
