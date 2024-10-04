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
        mainTabCapsule.selectedTab.rawValue + ".fill"
    }
    
    var body: some View {
        @Bindable var mainTabCapsule = mainTabCapsule
        
        VStack {
            HStack {
                ForEach(MainTab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    
                    VStack {
                        Image(systemName: mainTabCapsule.selectedTab == tab ? fillImage : tab.rawValue)
                            .scaleEffect(mainTabCapsule.selectedTab == tab ? 1.25 : 1.0)
                            .foregroundStyle(mainTabCapsule.selectedTab == tab ? Color.ESTitle : .black)
                            .font(.system(size: 19))
                            .padding(.bottom, 1)
                            .padding(.top, 10)
                        
                        Text(tab.title)
                            .font(.system(size: 9))
                            .fontWeight(.medium)
                            .foregroundStyle(mainTabCapsule.selectedTab == tab ? Color.ESTitle : .black)
                    }
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.1)) {
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

