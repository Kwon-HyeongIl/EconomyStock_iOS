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
            MainTabView()
                .toolbar(isSplashVisible ? .hidden : .visible, for: .navigationBar)
            
            if isSplashVisible {
                SplashView()
                    .animation(.easeOut(duration: 0.4), value: isSplashVisible)
            }
        }
        .task {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    isSplashVisible = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
