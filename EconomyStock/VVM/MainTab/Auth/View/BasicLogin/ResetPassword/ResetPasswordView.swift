//
//  ResetPasswordView.swift
//  EconomyStock
//
//  Created by 권형일 on 12/7/24.
//

import SwiftUI

struct ResetPasswordView: View {
    @Environment(NavigationRouter.self) var navigationRouter: NavigationRouter
    @Bindable var viewModel: AuthViewModel
    
    @State private var alertEmailFormValidation = false
    
    @FocusState private var focus: BasicLoginFocusField?
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("찾으실 계정의\n이메일을 입력해주세요")
                        .font(.system(size: 22))
                        .fontWeight(.semibold)
                        .padding(.leading, 20)
                        .padding(.top)
                    
                    Spacer()
                }
                
                VStack(spacing: 0) {
                    HStack {
                        Text("이메일")
                            .font(.system(size: 12))
                            .fontWeight(.medium)
                            .foregroundStyle(focus == .email ? Color.ESTitle : .gray)
                            .padding(.leading, 20)
                        
                        Spacer()
                    }
                    .padding(.bottom, 5)
                    
                    TextField("이메일", text: $viewModel.email)
                        .font(.system(size: 20))
                        .padding(.leading, 20)
                        .padding(.bottom, 10)
                        .focused($focus, equals: .email)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(focus == .email ? Color.ESTitle : .gray)
                        .opacity(focus == .email ? 0.8 : 0.5)
                        .frame(height: 2)
                        .padding(.horizontal, 20)
                }
                .padding(.top, 5)
                .padding(.bottom)
                
                Button {
                    guard viewModel.checkEmailFormValidation() else {
                        alertEmailFormValidation = true
                        return
                    }
                    
                    viewModel.sendPasswordResetEmail()
                    
                    navigationRouter.navigate(.SendEmailView(viewModel))
                } label: {
                    Text("확인")
                        .modifier(LongButtonModifier())
                }
                .alert("이메일 형식 불일치", isPresented: $alertEmailFormValidation) {
                    Button {
                        
                    } label: {
                        Text("확인")
                    }
                } message: {
                    Text("이메일 형식을 지켜주세요.")
                }
                
                Spacer()
            }
        }
        .onAppear {
            focus = .email
        }
        .modifier(NavigationBackTitleModifier(title: "비밀번호 재설정"))
    }
}

#Preview {
    ResetPasswordView(viewModel: AuthViewModel())
        .environment(NavigationRouter())
}
