//
//  HomeView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/4/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        Button {
            AuthManager.shared.signOut()
        } label: {
            Text("로그아웃")
        }
    }
}

#Preview {
    HomeView()
}
