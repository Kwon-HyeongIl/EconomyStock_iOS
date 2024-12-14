//
//  AuthManager.swift
//  EconomyStock
//
//  Created by 권형일 on 10/2/24.
//

import Foundation
import SwiftData
import FirebaseAuth
import FirebaseFirestore

@Observable
class AuthManager {
    static let shared = AuthManager()
    
    // 원격
    var currentUser: User?
    
    // 로컬
    let modelContainer = try! ModelContainer(for: LocalUser.self)
    
    init() {
        Task {
            await loadCurrentUserData()
        }
    }
    
    func createUser(email: String, password: String, username: String, appleHashedUid: String = "", googleHashedUid: String = "", kakaoHashedUid: String = "") async {
        
        guard let result = try? await Auth.auth().createUser(withEmail: email, password: password) else { return }
        let userId = result.user.uid
        
        if appleHashedUid.isEmpty && googleHashedUid.isEmpty && kakaoHashedUid.isEmpty {
            // 베이직 회원가입
            await uploadUserData(userId: userId, email: email, username: username)
            
        } else if !appleHashedUid.isEmpty {
            // 애플 회원가입
            await uploadUserData(userId: userId, email: email, username: username, appleHashedUid: appleHashedUid)
            
        } else if !googleHashedUid.isEmpty {
            // 구글 회원가입
            await uploadUserData(userId: userId, email: email, username: username, googleHashedUid: googleHashedUid)
            
        } else if !kakaoHashedUid.isEmpty {
            // 카카오 회원가입
            await uploadUserData(userId: userId, email: email, username: username, kakaoHashedUid: kakaoHashedUid)
        }
    }
    
    private func uploadUserData(userId: String, email: String, username: String, appleHashedUid: String = "", googleHashedUid: String = "", kakaoHashedUid: String = "") async {
        let deviceToken = FCMManager.shared.myDeviceToken ?? ""
        
        await MainActor.run {
            if appleHashedUid.isEmpty && googleHashedUid.isEmpty && kakaoHashedUid.isEmpty {
                // 베이직 회원가입
                self.currentUser = User(id: userId, deviceToken: deviceToken, username: username, authEmail: email, notificationType: [.empty], totalStudyingPercentage: 0.0, studyingCourse: StudyingCourse())
                
            } else if !appleHashedUid.isEmpty {
                // 애플 회원가입
                self.currentUser = User(id: userId, deviceToken: deviceToken, username: username, authEmail: email, appleHashedUid: appleHashedUid, notificationType: [.empty], totalStudyingPercentage: 0.0, studyingCourse: StudyingCourse())
                
            } else if !googleHashedUid.isEmpty {
                // 구글 회원가입
                self.currentUser = User(id: userId, deviceToken: deviceToken, username: username, authEmail: email, googleHashedUid: googleHashedUid, notificationType: [.empty], totalStudyingPercentage: 0.0, studyingCourse: StudyingCourse())
                
            } else if !kakaoHashedUid.isEmpty {
                // 카카오 회원가입
                self.currentUser = User(id: userId, deviceToken: deviceToken, username: username, authEmail: email, kakaoHashedUid: kakaoHashedUid, notificationType: [.empty], totalStudyingPercentage: 0.0, studyingCourse: StudyingCourse())
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
        guard let _ = try? await Auth.auth().signIn(withEmail: email, password: password) else { return false }
        
        await updateDeviceToken()
        await loadCurrentUserData()
        
        return true
    }
    
    func loadCurrentUserData() async {
        do {
            guard let userId = Auth.auth().currentUser?.uid else { return }
            let remoteUserSnapshot = try await Firestore.firestore()
                .collection("User").document(userId).getDocument()
            
            // 원격 저장소 (Firebase)
            if remoteUserSnapshot.exists {
                try await MainActor.run {
                    self.currentUser = try remoteUserSnapshot.data(as: User.self)
                }
                
            // 로컬 저장소 (SwiftData)
            } else {
                try await MainActor.run {
                    let localUser = try modelContainer.mainContext.fetch(FetchDescriptor<LocalUser>())
                    
                    // 로컬에 기본 회원 정보 저장
                    if localUser.isEmpty {
                        initLocalUser()
                    }
                }
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @MainActor
    private func initLocalUser() {
        let deviceToken = FCMManager.shared.myDeviceToken ?? ""
        let user = LocalUser(id: UUID(), deviceToken: deviceToken, notificationType: [.empty], totalStudyingPercentage: 0.0, studyingCourse: StudyingCourse())
        
        modelContainer.mainContext.insert(user)
        
        do {
            try modelContainer.mainContext.save()
            
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
    
    func checkEmailDuplication(email: String) async -> Bool {
        do {
            return try await !Firestore.firestore()
                .collection("User").whereField("authEmail", isEqualTo: email).getDocuments().documents.isEmpty
            
        }  catch {
            return false
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
