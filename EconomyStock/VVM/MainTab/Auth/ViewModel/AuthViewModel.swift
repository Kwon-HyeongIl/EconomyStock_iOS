//
//  LoginViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 10/2/24.
//

import Foundation

@Observable
class AuthViewModel: NSObject {
    var email = "" // 로그인 및 회원가입 용도
    var password = "" // 로그인 및 회원가입 용도
    var username = "" // 회원가입 용도
    
    var isLoginSuccess = false
    
    var loadingBarState = false // 소셜 로그인 뷰모델 내에서 컨트롤하기 위해 뷰모델 내에 선언
}
