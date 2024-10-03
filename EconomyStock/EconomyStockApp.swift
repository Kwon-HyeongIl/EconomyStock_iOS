//
//  EconomyStockApp.swift
//  EconomyStock
//
//  Created by 권형일 on 9/30/24.
//

import SwiftUI
import FirebaseCore
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct EconomyStockApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State private var navigationRouter = NavigationRouter()
    
    let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? ""
    
    init() {
        // Kakao 로그인 관련 초기화
        KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
        
        print("앱키", kakaoAppKey)
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationRouter.path) {
                ContentView()
                    .navigationDestination(for: NavigationStackView.self) { view in
                        navigationRouter.destinationNavigate(to: view)
                    }
                    .onOpenURL { url in
                        // Kakao 로그인 URL 처리
                        if (AuthApi.isKakaoTalkLoginUrl(url)) {
                            _ = AuthController.handleOpenUrl(url: url)
                        }
                    }
                    .preferredColorScheme(.light)
            }
        }
        .environment(navigationRouter)
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
