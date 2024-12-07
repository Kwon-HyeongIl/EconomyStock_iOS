//
//  LoginViewModel+Apple.swift
//  EconomyStock
//
//  Created by 권형일 on 10/2/24.
//

import SwiftUI
import AuthenticationServices

extension AuthViewModel: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func loginWithApple() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    // 로그인 성공시 (내부적으로 호출)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            DispatchQueue.main.async {
                withAnimation(.smooth(duration: 0.2)) {
                    self.loadingBarState = true
                }
            }
            
            let uid = appleIDCredential.user
            
            Task {
                let hashedUid = AuthManager.shared.hashUidWithSHA512(input: String(uid))
                let hashedPassword = AuthManager.shared.hashPasswordWithHMACSHA256(input: String(uid))
                
                do {
                    if let authEmail = try await AuthManager.shared.getAuthEmailWithAppleUid(uid: hashedUid) {
                        // 로그인
                        _ = await AuthManager.shared.login(email: authEmail, password: hashedPassword)
                        
                        self.isLoginSuccess = true
                        
                    } else {
                        // 회원가입
                        await AuthManager.shared.createUser(email: UUID().uuidString + "@email.com", password: hashedPassword, username: "User." + String(UUID().uuidString.prefix(6)), appleHashedUid: hashedUid)
                        
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
    
    // 로그인 실패시 (내부적으로 호출)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Apple Login Failed: \(error.localizedDescription)")
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return UIApplication.shared.connectedScenes
                    .compactMap { $0 as? UIWindowScene }
                    .flatMap { $0.windows }
                    .first { $0.isKeyWindow } ?? UIWindow()
    }
}
