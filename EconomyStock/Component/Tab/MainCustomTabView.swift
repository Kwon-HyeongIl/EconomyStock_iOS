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
                            let fromProgress: CGFloat = {
                                switch tab {
                                    
                                case .home:
                                    return 0.1
                                case .studying:
                                    return 0.1
                                case .news:
                                    return 0.05
                                case .profile:
                                    return 0.3
                                }
                            }()
                            
                            LottieViewConverter(fileName: fillImage, loopMode: .playOnce, fromProgress: fromProgress, width: 23, height: 23)
                                .shadow(color: Color.ESTitle, radius: 10, x: 0, y: 0)
                                .scaleEffect(1.25)
                            
                        } else {
                            LottieViewConverter(fileName: tab.rawValue, loopMode: .playOnce, toProgress: 0.0, width: 23, height: 23)
                        }
                    }
                    .padding(.top, 10)
                    .onTapGesture {
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

