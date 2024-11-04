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
                            LottieViewConverter(fileName: fillImage, loopMode: .playOnce, width: 80, height: 25)
                                .shadow(color: Color.ESTitle.opacity(0.5), radius: 10, x: 0, y: 0)
                            
                        } else {
                            LottieViewConverter(fileName: tab.rawValue, loopMode: .playOnce, toProgress: 0.0, width: 80, height: 25)
                        }
                    }
                    .padding(.top, 10)
                    .onTapGesture {
                        
                        // 햅틱
                        let view = UIView(frame: .zero)
                        UIImpactFeedbackGenerator(style: .light, view: view).impactOccurred()
                        
                        withAnimation(.easeInOut(duration: 0.2)) {
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
    }
}

#Preview {
    MainCustomTabView()
        .environment(MainTabCapsule())
}

