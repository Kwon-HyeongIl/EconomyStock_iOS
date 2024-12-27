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
    
    @State private var iAPViewModel = IAPManager()
    
    var body: some View {
        ScrollView {
            
            Text("isPurchased: \(iAPViewModel.isPurchased)")
            
            Button {
                Task {
                    print("결제 버튼 눌림")
//                    await iAPViewModel.purchase()
                }
            } label: {
                Text("결제")
            }
            
            
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
