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
        Button {
            viewModel.kakaoAuthSignIn()
        } label: {
            Text("카카오 로그인")
        }
    }
}

#Preview {
    LoginView()
}
