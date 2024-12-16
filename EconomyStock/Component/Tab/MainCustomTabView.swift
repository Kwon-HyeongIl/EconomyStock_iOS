//
//  MainCustomTabView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/4/24.
//

import SwiftUI

struct MainCustomTabView: View {
    @Environment(MainTabCapsule.self) var mainTabCapsule
    
    private var fillImage: String {
        mainTabCapsule.selectedTab.rawValue + "_On"
    }
    
    var body: some View {
        @Bindable var mainTabCapsule = mainTabCapsule
        
        VStack {
            HStack {
                ForEach(MainTab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    
                    VStack {
                        if mainTabCapsule.selectedTab == tab {
                            LottieView(fileName: fillImage, loopMode: .playOnce, width: 80, height: tab == .studying ? 28 : (tab == .profile ? 27 : 25))
                                .scaleEffect(1.25)
                            
                        } else {
                            LottieView(fileName: tab.rawValue, loopMode: .playOnce, toProgress: 0.0, width: 80, height: tab == .studying ? 28 : (tab == .profile ? 27 : 25))
                        }
                    }
                    .padding(.top, 10)
                    .onTapGesture {
                        
                        // 햅틱
                        let view = UIView(frame: .zero)
                        UIImpactFeedbackGenerator(style: .light, view: view).impactOccurred()
                        
                        withAnimation(.easeInOut(duration: 0.05)) {
                            mainTabCapsule.selectedTab = tab
                        }
                    }
                    .padding(.bottom, 5)
                    
                    Spacer()
                }
            }
            
            Spacer()
        }
        .frame(height: 150)
        .background(.regularMaterial)
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .shadow(color: .gray.opacity(0.15), radius: 3, x: 0, y: -5)
    }
}

#Preview {
    MainCustomTabView()
        .environment(MainTabCapsule())
}

