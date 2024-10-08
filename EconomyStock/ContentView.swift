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
                isSplashVisible = false
            }
        }
    }
}

#Preview {
    ContentView()
}
