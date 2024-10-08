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
    
    func clearInputData() {
        DispatchQueue.main.async {
            self.email = ""
            self.password = ""
            self.username = ""
        }
    }
}
