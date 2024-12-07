//
//  LoginViewModel+Google.swift
//  EconomyStock
//
//  Created by 권형일 on 10/6/24.
//

import SwiftUI
import GoogleSignIn

extension AuthViewModel {
    func loginWithGoogle() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else {
            return
        }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { signInResult, error in
            if let error = error {
                print("Error signing in: \(error.localizedDescription)")
                return
            }
            
            DispatchQueue.main.async {
                withAnimation(.smooth(duration: 0.2)) {
                    self.loadingBarState = true 
                }
            }

            guard let uid = signInResult?.user.userID else { return }
            
            Task {
                let hashedUid = AuthManager.shared.hashUidWithSHA512(input: String(uid))
                let hashedPassword = AuthManager.shared.hashPasswordWithHMACSHA256(input: String(uid))
                
                do {
                    if let authEmail = try await AuthManager.shared.getAuthEmailWithGoogleUid(uid: hashedUid) {
                        // 로그인
                        _ = await AuthManager.shared.login(email: authEmail, password: hashedPassword)
                        
                        self.isLoginSuccess = true
                        
                    } else {
                        // 회원가입
                        let newAuthEmail = UUID().uuidString + "@email.com"
                        await AuthManager.shared.createUser(email: newAuthEmail, password: hashedPassword, username: "User." + String(UUID().uuidString.prefix(6)), googleHashedUid: hashedUid)
                        
                        self.isLoginSuccess = true
                    }
                    
                } catch CustomError.multipleSameUser {
                    print("multiple smae user exists")
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
