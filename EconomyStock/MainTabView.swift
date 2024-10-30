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
        
        VStack {
            ZStack {
                switch mainTabCapsule.selectedTab {
                    
                case .house:
                    HomeView()
                    
                case .textBookClosed:
                    CourseListView()
                    
                case .newspaper:
                    NewsView()
                    
                case .person:
                    ProfileView()
                }
                
                VStack {
                    Spacer()
                    
                    MainCustomTabView()
                        .offset(y: 95)
                }
            }
        }
    }
}

#Preview {
    MainTabView()
        .environment(MainTabCapsule())
}
