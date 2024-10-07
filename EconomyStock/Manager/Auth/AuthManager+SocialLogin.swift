//
//  AuthManager+SocialLogin.swift
//  EconomyStock
//
//  Created by 권형일 on 10/2/24.
//

import Foundation
import FirebaseFirestore

extension AuthManager {
    func getAuthEmailWithAppleUid(uid: String) async throws -> String? {
        let userDocuments = try await Firestore.firestore()
            .collection("User").whereField("appleHashedUid", isEqualTo: uid)
            .getDocuments().documents
        
        if userDocuments.count == 0 { return nil }
        if userDocuments.count > 1 { throw CustomError.multipleSameUser }
        
        return try userDocuments.first?.data(as: User.self).authEmail
        
    }
    
    func getAuthEmailWithGoogleUid(uid: String) async throws -> String? {
        let userDocuments = try await Firestore.firestore()
            .collection("User").whereField("googleHashedUid", isEqualTo: uid)
            .getDocuments().documents
        
        if userDocuments.count == 0 { return nil }
        if userDocuments.count > 1 { throw CustomError.multipleSameUser }
        
        return try userDocuments.first?.data(as: User.self).authEmail
    }
    
    func getAuthEmailWithKakaoUid(uid: String) async throws -> String? {
        let userDocuments = try await Firestore.firestore().collection("User")
            .whereField("kakaoHashedUid", isEqualTo: uid)
            .getDocuments().documents
        
        if userDocuments.count == 0 { return nil }
        if userDocuments.count > 1 { throw CustomError.multipleSameUser }
        
        return try userDocuments.first?.data(as: User.self).authEmail
    }
}

