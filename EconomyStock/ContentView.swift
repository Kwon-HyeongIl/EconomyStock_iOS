//
//  ContentView.swift
//  EconomyStock
//
//  Created by 권형일 on 9/30/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isSplashVisible = true
    
    var body: some View {
        ZStack {
            
            /*
             if문의 조건이 충족 될 때, if문 안에 있는 뷰가 생성
             예를 들어, ContentView가 init될 때 currentUser가 nil이면 MainTabView는 생성하지 않고있음
             */
            if AuthManager.shared.currentUser != nil {
                MainTabView()
                    .toolbar(isSplashVisible ? .hidden : .visible, for: .navigationBar)

            } else {
                LoginView()
            }
            
            if isSplashVisible {
                SplashView()
                    .animation(.easeOut(duration: 0.4), value: isSplashVisible)
            }
        }
        .task {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation(.easeOut(duration: 0.4)) {
                    isSplashVisible = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
