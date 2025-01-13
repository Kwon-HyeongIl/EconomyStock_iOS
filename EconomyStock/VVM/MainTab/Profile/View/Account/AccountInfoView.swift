//
//  AccountView.swift
//  EconomyStock
//
//  Created by 권형일 on 12/7/24.
//

import SwiftUI

struct AccountInfoView: View {
    @Environment(NavigationRouter.self) var navRouter
    @Environment(LoginCapsule.self) var capsule
    @Bindable var viewModel: ProfileViewModel
    
    
    var body: some View {
        ScrollView {
            
            Button {
                viewModel.singOut()
                capsule.isLoginToggle.toggle()
            } label: {
                Text("로그아웃")
                    .font(.system(size: 13))
            }
        }
        .scrollIndicators(.never)
        .modifier(NavigationBackTitleModifier(title: "계정 정보"))
    }
}

#Preview {
    AccountInfoView(viewModel: ProfileViewModel())
        .environment(NavigationRouter())
        .environment(LoginCapsule())
}
