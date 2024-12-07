//
//  LoginViewModel+ResetPassword.swift
//  EconomyStock
//
//  Created by 권형일 on 12/7/24.
//

import Foundation
import FirebaseAuth

extension AuthViewModel {
    func sendPasswordResetEmail() {
        Auth.auth().sendPasswordReset(withEmail: self.email) { (error) in
            if error != nil {
                print(error?.localizedDescription ?? "fail email")
            }
        }
    }
}
