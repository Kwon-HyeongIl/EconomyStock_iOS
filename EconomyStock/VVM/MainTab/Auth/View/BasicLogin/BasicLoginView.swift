//
//  BasicLoginView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/8/24.
//

import SwiftUI

struct BasicLoginView: View {
    @Environment(NavigationRouter.self) var navRouter
    @Bindable var viewModel: AuthViewModel
    
    @State private var alertLogin = false
    
    @FocusState private var focus: BasicLoginFocusField?
    
    @State private var loadingBarState = false
    
    var body: some View {
        ScrollView {
            VStack {
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
                
                VStack(spacing: 0) {
                    HStack {
                        Text("비밀번호")
                            .font(.system(size: 12))
                            .fontWeight(.medium)
                            .foregroundStyle(focus == .password ? Color.ESTitle : .gray)
                            .padding(.leading, 20)
                        
                        Spacer()
                    }
                    .padding(.bottom, 5)
                    
                    SecureField("비밀번호", text: $viewModel.password)
                        .font(.system(size: 20))
                        .padding(.leading, 20)
                        .padding(.bottom, 10)
                        .focused($focus, equals: .password)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(focus == .password ? Color.ESTitle : .gray)
                        .opacity(focus == .password ? 0.8 : 0.5)
                        .frame(height: 2)
                        .padding(.horizontal, 20)
                }
                .padding(.bottom, 20)
                
                Button {
                    Task {
                        withAnimation(.smooth(duration: 0.2)) {
                            loadingBarState = true
                        }
                        
                        guard await viewModel.login() else {
                            loadingBarState = false
                            alertLogin = true
                            
                            return
                        }
                        
                        navRouter.popToRoot()
                    }
                } label: {
                    Text("로그인")
                        .modifier(LongButtonModifier())
                        .padding(.bottom, 30)
                }
                .alert("로그인 실패", isPresented: $alertLogin) {
                    Button {
                        loadingBarState = false
                    } label: {
                        Text("확인")
                    }
                } message: {
                    Text("이메일 혹은 비밀번호가 일치하지 않습니다.")
                }
                
                VStack {
                    Button {
                        navRouter.navigate(.BasicSignupView(viewModel))
                    } label: {
                        Text("아직 회원이 아니신가요?")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.ESTitle)
                            .padding(.bottom, 15)
                    }
                    
                    Button {
                        navRouter.navigate(.ResetPasswordView(viewModel))
                    } label: {
                        Text("비밀번호를 잊어버리셨나요?")
                            .font(.system(size: 14))
                            .foregroundStyle(.black)
                            .opacity(0.6)
                            .padding(.bottom, 15)
                    }
                }
                
                Spacer()
            }
        }
        .scrollIndicators(.never)
        .onAppear {
            focus = .email
        }
        .overlay {
            if loadingBarState {
                LottieView(fileName: "Loading", loopMode: .loop, width: 200, height: 200)
                    .padding(.top, 280)
            }
        }
        .onTapGesture {
            focus = nil
        }
        .modifier(NavigationBackTitleModifier(title: "로그인"))
    }
}

#Preview {
    BasicLoginView(viewModel: AuthViewModel())
        .environment(NavigationRouter())
}
