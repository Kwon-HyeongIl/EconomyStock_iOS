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
    var remoteUser: User?
    var localUser: LocalUser?
    
    let modelContainer = try! ModelContainer(for: LocalUser.self)
    
    var isLogin: Bool?
    
    init() {
        Task {
            await loadCurrentUserData()
        }
    }
    
    func loadCurrentUserData() async {
        do {
            // 원격 저장소
            if Auth.auth().currentUser != nil {
                guard let userId = Auth.auth().currentUser?.uid else { return }
                
                let remoteUserSnapshot = try await Firestore.firestore()
                    .collection("User").document(userId).getDocument()
                
                try await MainActor.run {
                    self.remoteUser = try remoteUserSnapshot.data(as: User.self)
                    
                    self.isLogin = true
                }
                
            // 로컬 저장소
            } else {
                try await MainActor.run {
                    let user = try modelContainer.mainContext.fetch(FetchDescriptor<LocalUser>())
                    
                    if !user.isEmpty {
                        self.localUser = user.first
                        
                    // 처음 앱을 시작한 경우
                    } else {
                        initLocalUser()
                    }
                    
                    self.isLogin = false
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
        
        try? modelContainer.mainContext.save()
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
                self.remoteUser = User(id: userId, deviceToken: deviceToken, username: username, authEmail: email, notificationType: self.localUser?.notificationType ?? [.empty], totalStudyingPercentage: self.localUser?.totalStudyingPercentage ?? 0.0, studyingCourse: self.localUser?.studyingCourse ?? StudyingCourse())
                
            } else if !appleHashedUid.isEmpty {
                // 애플 회원가입
                self.remoteUser = User(id: userId, deviceToken: deviceToken, username: username, authEmail: email, appleHashedUid: appleHashedUid, notificationType: self.localUser?.notificationType ?? [.empty], totalStudyingPercentage: self.localUser?.totalStudyingPercentage ?? 0.0, studyingCourse: self.localUser?.studyingCourse ?? StudyingCourse())
                
            } else if !googleHashedUid.isEmpty {
                // 구글 회원가입
                self.remoteUser = User(id: userId, deviceToken: deviceToken, username: username, authEmail: email, googleHashedUid: googleHashedUid, notificationType: self.localUser?.notificationType ?? [.empty], totalStudyingPercentage: self.localUser?.totalStudyingPercentage ?? 0.0, studyingCourse: self.localUser?.studyingCourse ?? StudyingCourse())
                
            } else if !kakaoHashedUid.isEmpty {
                // 카카오 회원가입
                self.remoteUser = User(id: userId, deviceToken: deviceToken, username: username, authEmail: email, kakaoHashedUid: kakaoHashedUid, notificationType: self.localUser?.notificationType ?? [.empty], totalStudyingPercentage: self.localUser?.totalStudyingPercentage ?? 0.0, studyingCourse: self.localUser?.studyingCourse ?? StudyingCourse())
            }
        }
        
        do {
            let encodedUser = try Firestore.Encoder().encode(remoteUser)
            try await Firestore.firestore()
                .collection("User").document(userId).setData(encodedUser)
            
            try await deleteLocalUser()
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @MainActor
    private func deleteLocalUser() throws {
        try self.modelContainer.mainContext.delete(model: LocalUser.self)
        try modelContainer.mainContext.save()
        
        self.localUser = nil
    }
    
    func login(email: String, password: String) async -> Bool {
        guard let _ = try? await Auth.auth().signIn(withEmail: email, password: password) else { return false }
        
        await updateDeviceToken()
        await loadCurrentUserData()
        
        return true
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
                self.remoteUser = nil
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
