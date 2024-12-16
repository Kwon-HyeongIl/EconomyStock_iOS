//
//  MainTabView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/1/24.
//

import SwiftUI

struct MainTabView: View {
    @Environment(MainTabCapsule.self) var mainTabCapsule
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        @Bindable var mainTabCapsule = mainTabCapsule
        
            ZStack {
                TabView(selection: $mainTabCapsule.selectedTab) {
                    HomeView()
                        .tag(MainTab.home)
                    
                    CourseListView()
                        .tag(MainTab.studying)
                    
                    NewsView()
                        .tag(MainTab.news)
                    
                    ProfileView()
                        .tag(MainTab.profile)
                }
                
                VStack {
                    Spacer()
                    
                    MainCustomTabView()
                        .offset(y: 95)
                }
            }
    }
}

#Preview {
    MainTabView()
        .environment(MainTabCapsule())
}
