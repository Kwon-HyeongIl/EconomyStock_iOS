//
//  IsLoginControlManager.swift
//  EconomyStock
//
//  Created by 권형일 on 10/31/24.
//

import Foundation
import FirebaseAuth

/**
 ContentView에서 AuthManager.shared.currentUser로 로그인 했는지 여부를 파악해서 LoginView를 띄울지 MainTabView를 띄울지 정하게 하면,
 다른 뷰에서 다른 기능을 하면서 currentUser 객체의 값을 수정하면 currentUser를 참조하는 모든 뷰가 다시 렌더링 되므로 ContentView currentUser nil 여부 블록 내부의
 MainTabView, CourseListView 등의 뷰들이 불필요하게 다시 init 되는 문제가 생기므로,
 
 LoginView를 띄울지 MainTabView를 띄울지 정하는 상태 변수를 다른곳에서 참조 안되고 여기서만 사용되도록 새로 정의
 */
@Observable
class IsLoginControlManager {
    static let shared = IsLoginControlManager()
    
    var isLogin: Bool
    
    init() {
        if Auth.auth().currentUser != nil {
            isLogin = true
        } else {
            isLogin = false
        }
    }
}
