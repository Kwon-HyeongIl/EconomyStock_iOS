//
//  FCMManager.swift
//  EconomyStock
//
//  Created by 권형일 on 10/2/24.
//

import Foundation
import FirebaseAuth

@Observable
class FCMManager {
    static let shared = FCMManager()
    
    var myDeviceToken: String?
    var googleAccessToken: String?
    
    func sendFCMNotification(userId: String, notification: Notification) async {
        // 본인 관련 내용일 경우
//        let currentUserId = AuthManager.shared.currentUser?.id ?? ""
//        if currentUserId == userId {
//            return
//        }
        
        // 수신 사용자의 Firebstore에 알림 저장
        async let _ = NotificationManager.saveNotification(userId: userId, nofitication: notification)
        
        // 수신 사용자가 알림을 허용했는지 체크
        if await !notificationCheckPoint(notification: notification, userId: userId) {
            return
        }
        
        await self.getGoogleOAuthAccessToken()
        
        guard let projectId = Bundle.main.infoDictionary?["FIREBASE_ECONOMYSTOCK_PROJECT_ID"] as? String else { return }
        
        guard let url = URL(string: "https://fcm.googleapis.com/v1/projects/\(projectId)/messages:send") else {
            print("Invalid URL for FCM")
            return
        }
        
        let deviceToken = await AuthManager.shared.getSpecificUserDeviceToken(userId: userId)
        
        let json: [String: Any] = [
            "message": [
                "token": deviceToken,
                "notification": [
                    "body": notification.body,
                    "title": notification.title
                ]
            ]
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])
        request.setValue("Bearer \(googleAccessToken ?? "")", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: request) { _, _, error in
            if let error {
                print(error.localizedDescription)
                return
            }
        }
        .resume()
    }
    
    private func getGoogleOAuthAccessToken() async {
        guard let accessTokenUrlBody = Bundle.main.infoDictionary?["GOOGLE_OAUTH_ACCESS_TOKEN_URL_BODY"] as? String else { return }
        guard let url = URL(string: "https://\(accessTokenUrlBody)") else {
            print("Invalid URL for token")
            return
        }
        
        do {
            guard let firebaseAuthToken = try await Auth.auth().currentUser?.getIDToken() else { return }
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("Bearer \(firebaseAuthToken)", forHTTPHeaderField: "Authorization")
            
            let (data, _) = try await URLSession.shared.data(for: request)
                // Token을 받고 나서 계속 알림 요청을 보내기 위해 URLSession.shared.data 사용
            
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let accessTokenData = json["accessToken"] as? [String: Any],
               let token = accessTokenData["token"] as? String {
                self.googleAccessToken = token
                
            } else {
                print("Invalid response")
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func notificationCheckPoint(notification: Notification, userId: String) async -> Bool {
        let notificationType = await NotificationManager.loadUserNotificationType(userId: userId)
        
        if notificationType.contains(notification.type) {
            return true
        } else {
            return false
        }
    }
}
