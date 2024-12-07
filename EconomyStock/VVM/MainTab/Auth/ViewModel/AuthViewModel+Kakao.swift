//
//  LoginViewModel+Kakao.swift
//  EconomyStock
//
//  Created by 권형일 on 10/2/24.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

extension AuthViewModel {
    func loginWithKakao() {
        if AuthApi.hasToken() {
            UserApi.shared.accessTokenInfo { _, error in
                if let _ = error { // 유효하지 않은 토큰
                    self.openKakaoService()
                } else { // 유효한 토큰
                    self.continueFirebaseAuthWithKakao()
                }
            }
        } else { // 토큰이 없는 경우
            self.openKakaoService()
        }
    }
    
    func openKakaoService() {
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { oauthToken, error in // 카카오톡 앱으로 로그인
                if let error {
                    //로그인 실패
                    print("Kakao Sign In Error: ", error.localizedDescription)
                    return
                }
                
                // 로그인 성공
                _ = oauthToken
                self.continueFirebaseAuthWithKakao()
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { oauthToken, error in // 카카오 웹으로 로그인
                if let error {
                    // 로그인 실패
                    print("Kakao Sign In Error: ", error.localizedDescription)
                    return
                }
                
                // 로그인 성공
                _ = oauthToken
                self.continueFirebaseAuthWithKakao()
            }
        }
    }
    
    func continueFirebaseAuthWithKakao() {
        UserApi.shared.me { kakaoUser, error in
            if let error {
                print("Kakao Sign In Error: ", error.localizedDescription)
                return
            }
            
            DispatchQueue.main.async {
                withAnimation(.smooth(duration: 0.2)) {
                    self.loadingBarState = true 
                }
            }
            
            guard let uid = kakaoUser?.id else { return }
            
            Task {
                let hashedUid = AuthManager.shared.hashUidWithSHA512(input: String(uid))
                let hashedPassword = AuthManager.shared.hashPasswordWithHMACSHA256(input: String(uid))
                
                do {
                    if let authEmail = try await AuthManager.shared.getAuthEmailWithKakaoUid(uid: hashedUid) {
                        // 로그인
                        _ = await AuthManager.shared.login(email: authEmail, password: hashedPassword)
                        
                        self.isLoginSuccess = true
                        
                    } else {
                        // 회원가입
                        let newAuthEmail = UUID().uuidString + "@email.com"
                        await AuthManager.shared.createUser(email: newAuthEmail, password: hashedPassword, username: "User." + String(UUID().uuidString.prefix(6)), kakaoHashedUid: hashedUid)
                        
                        self.isLoginSuccess = true
                    }
                    
                } catch CustomError.multipleSameUser {
                    print("multiple same user exists")
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
