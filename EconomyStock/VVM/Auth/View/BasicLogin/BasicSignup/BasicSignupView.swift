//
//  SignupView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/8/24.
//

import SwiftUI

struct BasicSignupView: View {
    @Environment(NavigationRouter.self) var navigationRouter: NavigationRouter
    @State private var viewModel = BasicSignupViewModel()
    
    @FocusState private var focus: BasicSignupFocusField?
    
    @State private var isPasswordTextFieldShowing = false
    @State private var isUsernameTextFieldShowing = false
    @State private var emailTextFieldDown = false
    @State private var passwordTextFieldDown = false
    
    @State private var alertEmptyTextField = false
    @State private var alertEmailFormValidation = false
    @State private var alertEmailDulication = false
    
    @State private var loadingBarState = false
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    if isUsernameTextFieldShowing {
                        VStack(spacing: 0) {
                            HStack {
                                Text("닉네임")
                                    .font(.system(size: 12))
                                    .fontWeight(.medium)
                                    .foregroundStyle(focus == .username ? Color.ESTitle : .gray)
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            .padding(.bottom, 5)
                            
                            TextField("닉네임", text: $viewModel.username)
                                .font(.system(size: 20))
                                .padding(.leading, 20)
                                .padding(.bottom, 10)
                                .focused($focus, equals: .username)
                            
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(focus == .username ? Color.ESTitle : .gray)
                                .opacity(focus == .username ? 0.8 : 0.5)
                                .frame(height: 2)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 30)
                        }
                        .padding(.top, 20)
                    }
                    
                    if isPasswordTextFieldShowing {
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
                            
                            SecureField("비밀번호 (6자리 이상)", text: $viewModel.password)
                                .font(.system(size: 20))
                                .padding(.leading, 20)
                                .padding(.bottom, 10)
                                .focused($focus, equals: .password)
                            
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(focus == .password ? Color.ESTitle : .gray)
                                .opacity(focus == .password ? 0.8 : 0.5)
                                .frame(height: 2)
                                .padding(.horizontal, 20)
                                .padding(.bottom, 30)
                        }
                        .padding(.top, isUsernameTextFieldShowing ? 0 : 20)
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
                    .padding(.top, isPasswordTextFieldShowing ? 0 : 20)
                    
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    
                    Button {
                        if !isPasswordTextFieldShowing {
                            // 첫번째 다음
                            guard !viewModel.email.isEmpty else {
                                alertEmptyTextField = true
                                return
                            }
                            
                            guard viewModel.checkEmailFormValidation() else {
                                alertEmailFormValidation = true
                                return
                            }
                            
                            withAnimation(.smooth(duration: 0.2)) {
                                loadingBarState = true
                            }
                            
                            Task {
                                if await !viewModel.checkEmailDuplication() {
                                    withAnimation(.smooth(duration: 0.1)) {
                                        loadingBarState = false
                                    }
                                    
                                    withAnimation(.easeOut(duration: 0.4)) {
                                        isPasswordTextFieldShowing = true
                                    }
                                    
                                    focus = .password
                                    
                                } else {
                                    withAnimation(.smooth(duration: 0.1)) {
                                        loadingBarState = false
                                    }
                                    
                                    alertEmailDulication = true
                                }
                            }
                            
                        } else if !isUsernameTextFieldShowing {
                            // 두번째 다음
                            if viewModel.password.count >= 6 {
                                withAnimation(.easeOut(duration: 0.4)) {
                                    isUsernameTextFieldShowing = true
                                    
                                }
                                
                                focus = .username
                                
                            } else {
                                alertEmptyTextField = true
                            }
                            
                        } else if isUsernameTextFieldShowing {
                            // 완료
                            if !viewModel.username.isEmpty && viewModel.password.count >= 6 {
                                withAnimation(.smooth(duration: 0.2)) {
                                    loadingBarState = true
                                }
                                
                                // 이메일 재검증 1
                                guard viewModel.checkEmailFormValidation() else {
                                    withAnimation(.smooth(duration: 0.1)) {
                                        loadingBarState = false
                                    }
                                    
                                    alertEmailFormValidation = true
                                    return
                                }
                                
                                Task {
                                    //이메일 재검증 2
                                    guard await !viewModel.checkEmailDuplication() else {
                                        withAnimation(.smooth(duration: 0.1)) {
                                            loadingBarState = false
                                        }
                                        
                                        alertEmailDulication = true
                                        return
                                    }
                                    
                                    await viewModel.signup()
                                    navigationRouter.popToRoot()
                                }
                                
                            } else {
                                alertEmptyTextField = true
                            }
                        }
                    } label: {
                        Text(isUsernameTextFieldShowing ? "완료" : "다음")
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.ESTitle)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.horizontal, 5)
                            .padding(.bottom, 5)
                    }
                    .alert("이메일 형식 불일치", isPresented: $alertEmailFormValidation) {
                        Button {
                            
                        } label: {
                            Text("확인")
                        }
                    } message: {
                        Text("~@~.com 형식을 지켜주세요.")
                    }
                    .alert("중복된 이메일", isPresented: $alertEmailDulication) {
                        Button {
                            
                        } label: {
                            Text("확인")
                        }
                    } message: {
                        Text("다른 이메일로 다시 입력해주세요.")
                    }
                    .alert("공백 제출 불가능", isPresented: $alertEmptyTextField) {
                        Button {
                            
                        } label: {
                            Text("확인")
                        }
                    } message: {
                        Text("빈칸으로 제출하실 수 없습니다.")
                    }
                }
            }
            .onAppear {
                focus = .email
            }
            .overlay {
                if loadingBarState {
                    LottieView(fileName: "Loading", loopMode: .loop, width: 180, height: 180)
                        .padding(.bottom, 60)
                }
            }
            .modifier(NavigationBackTitleModifier(title: isUsernameTextFieldShowing ? "닉네임을 입력해주세요" : (isPasswordTextFieldShowing ? "비밀번호를 입력해주세요" : "이메일을 입력해주세요")))
        }
    }
}

#Preview {
    BasicSignupView()
        .environment(NavigationRouter())
}
