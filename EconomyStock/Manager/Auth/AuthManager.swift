//
//  AuthManager.swift
//  EconomyStock
//
//  Created by 권형일 on 10/2/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

@Observable
class AuthManager {
    static let shared = AuthManager()
    
    var currentUser: User?
    
    init() {
        Task {
            await loadCurrentUserData()
        }
    }
    
    func createUser(email: String, password: String, username: String, kakaoHashedUid: String = "", appleHashedUid: String = "") async {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            let userId = result.user.uid
            
            if !kakaoHashedUid.isEmpty { // 카카오 회원가입
                await uploadUserData(userId: userId, email: email, username: username, kakaoHashedUid: kakaoHashedUid)
                
            } else if !appleHashedUid.isEmpty { // 애플 회원가입
                await uploadUserData(userId: userId, email: email, username: username, appleHashedUid: appleHashedUid)
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func uploadUserData(userId: String, email: String, username: String, kakaoHashedUid: String = "", appleHashedUid: String = "") async {
        let deviceToken = FCMManager.shared.myDeviceToken ?? ""
        
        await MainActor.run {
            if !kakaoHashedUid.isEmpty {
                // 카카오 회원가입
                self.currentUser = User(id: userId, deviceToken: deviceToken, username: username, authEmail: email, kakaoHashedUid: kakaoHashedUid, notificationType: [.empty])
                
            } else if !appleHashedUid.isEmpty {
                // 애플 회원가입
                self.currentUser = User(id: userId, deviceToken: deviceToken, username: username, authEmail: email, appleHashedUid: appleHashedUid, notificationType: [.empty])
            }
        }
        
        do {
            let encodedUser = try Firestore.Encoder().encode(currentUser)
            try await Firestore.firestore()
                .collection("User").document(userId).setData(encodedUser)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func login(email: String, password: String) async -> Bool {
        do {
            _ = try await Auth.auth().signIn(withEmail: email, password: password)
            await updateDeviceToken()
            await loadCurrentUserData()
            
            return true
            
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    func loadCurrentUserData() async {
        do {
            guard let userId = Auth.auth().currentUser?.uid else { return }
            let loadedCurrentUser = try await Firestore.firestore()
                .collection("User").document(userId).getDocument(as: User.self)
            
            await MainActor.run {
                self.currentUser = loadedCurrentUser
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func updateDeviceToken() async {
        do {
            guard let userId = Auth.auth().currentUser?.uid else { return }
            var editedData: [String : Any] = [:]
            editedData["deviceToken"] = FCMManager.shared.myDeviceToken ?? ""
            
            try await Firestore.firestore()
                .collection("User").document(userId)
                .updateData(editedData)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getSpecificUserDeviceToken(userId: String) async -> String {
        do {
            let userDocument = try await Firestore.firestore()
                .collection("User").document(userId)
                .getDocument()
            
            let user = try userDocument.data(as: User.self)
            
            return user.deviceToken
            
        } catch {
            print(error.localizedDescription)
            return ""
        }
    }
    
    func loadSpecificUser(userId: String) async -> User? {
        do {
            let userDocument = try await Firestore.firestore()
                .collection("User").document(userId)
                .getDocument()
            
            return try userDocument.data(as: User.self)
            
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            
            DispatchQueue.main.async {
                self.currentUser = nil
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
