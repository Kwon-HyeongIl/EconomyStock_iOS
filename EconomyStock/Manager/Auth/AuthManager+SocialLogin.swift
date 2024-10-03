//
//  AuthManager+SocialLogin.swift
//  EconomyStock
//
//  Created by 권형일 on 10/2/24.
//

import Foundation
import FirebaseFirestore

extension AuthManager {
    func getAuthEmailWithKakaoUid(uid: String) async -> String? {
        do {
            let user = try await Firestore.firestore().collection("User").whereField("kakaoHashedUid", isEqualTo: uid).getDocuments().documents
            if user.isEmpty { return nil }
            let findUser = try user.first?.data(as: User.self)
            
            return findUser?.authEmail
            
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func getAuthEmailWithAppleUid(uid: String) async -> String? {
        do {
            let user = try await Firestore.firestore().collection("User").whereField("appleHashedUid", isEqualTo: uid).getDocuments().documents
            if user.isEmpty { return nil }
            let findUser = try user.first?.data(as: User.self)
            
            return findUser?.authEmail
            
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

