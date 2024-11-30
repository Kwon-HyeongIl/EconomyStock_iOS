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
    
    var isLoginSuccess = false
    
    var loadingBarState = false // 소셜 로그인 뷰모델 내에서 컨트롤하기 위해 뷰모델 내에 선언
    
    func login() async -> Bool {
        return await AuthManager.shared.login(email: self.email, password: self.password)
    }
}



