//
//  LoginViewModel+BasicSignup.swift
//  EconomyStock
//
//  Created by 권형일 on 11/30/24.
//

import Foundation

extension LoginViewModel {
    func signup() async {
        await AuthManager.shared.createUser(email: self.email, password: self.password, username: self.username)
    }
    
    func checkEmailFormValidation() -> Bool {
        let emailRegex = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return emailPredicate.evaluate(with: self.email)
    }
    
    func checkEmailDuplication() async -> Bool {
        return await AuthManager.shared.checkEmailDuplication(email: self.email)
    }
}
