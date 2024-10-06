//
//  LoginView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/2/24.
//

import SwiftUI

struct LoginView: View {
    @State private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            Button {
                viewModel.loginWithKakao()
            } label: {
                Text("카카오 로그인")
            }
            
            Button {
                viewModel.loginWithApple()
            } label: {
                Text("애플 로그인")
            }
            
            Button {
                viewModel.loginWithGoogle()
            } label: {
                Text("구글 로그인")
            }
        }
    }
}

#Preview {
    LoginView()
}
