//
//  SignupViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 10/8/24.
//

import Foundation

@Observable
class BasicSignupViewModel {
    var email = ""
    var password = ""
    var username = ""
    
    func signup() async {
        await AuthManager.shared.createUser(email: self.email, password: self.password, username: self.username)
    }
    
    func clearInputData() {
        DispatchQueue.main.async {
            self.email = ""
            self.password = ""
            self.username = ""
        }
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
