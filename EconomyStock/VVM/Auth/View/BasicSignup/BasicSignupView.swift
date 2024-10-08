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
    
    @State private var isEmptyAlertShowing = false
    @State private var isEmailFormValidatedAlertShowing = false
    @State private var isEmailDulicatedAlertShowing = false
    
    @State private var loadingBarState = false
    
    var body: some View {
        ZStack {
            VStack {
                if isUsernameTextFieldShowing {
                    Text("닉네임을 입력해주세요.")
                        .font(.system(size: 23))
                        .fontWeight(.semibold)
                        .padding(.bottom, 30)
                    
                } else if isPasswordTextFieldShowing {
                    Text("비밀번호를 입력해주세요.")
                        .font(.system(size: 23))
                        .fontWeight(.semibold)
                        .padding(.bottom, 30)
                    
                } else {
                    Text("등록할 이메일을 입력해주세요.")
                        .font(.system(size: 23))
                        .fontWeight(.semibold)
                        .padding(.bottom, 30)
                }
                
                if isUsernameTextFieldShowing {
                    VStack(spacing: 0) {
                        HStack {
                            Text("닉네임")
                                .font(.system(size: 12))
                                .fontWeight(.medium)
                                .foregroundStyle(focus == .username ? Color.ESTitle : .gray)
                                .padding(.leading, 20)
                                .padding(.bottom, 5)
                            
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
                            .frame(height: 3)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 30)
                    }
                }
                
                if isPasswordTextFieldShowing {
                    VStack(spacing: 0) {
                        HStack {
                            Text("비밀번호")
                                .font(.system(size: 12))
                                .fontWeight(.medium)
                                .foregroundStyle(focus == .password ? Color.ESTitle : .gray)
                                .padding(.leading, 20)
                                .padding(.bottom, 5)
                            
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
                            .frame(height: 3)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 30)
                    }
                }
                
                VStack(spacing: 0) {
                    HStack {
                        Text("이메일")
                            .font(.system(size: 12))
                            .fontWeight(.medium)
                            .foregroundStyle(focus == .email ? Color.ESTitle : .gray)
                            .padding(.leading, 20)
                            .padding(.bottom, 5)
                        
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
                        .frame(height: 3)
                        .padding(.horizontal, 20)
                }
                
                Spacer()
            }
            
            VStack {
                Spacer()
                
                Button {
                    Task {
                        if !isPasswordTextFieldShowing {
                            // 첫번째 다음
                            if !viewModel.email.isEmpty {
                                if viewModel.checkEmailFormValidation() {
                                    if await viewModel.checkEmailDuplication() {
                                        withAnimation(.easeOut(duration: 1.0)) {
                                            isPasswordTextFieldShowing = true
                                            focus = .password
                                        }
                                    } else {
                                        isEmailDulicatedAlertShowing = true
                                    }
                                    
                                } else {
                                    isEmailFormValidatedAlertShowing = true
                                }
                                
                            } else {
                                isEmptyAlertShowing = true
                            }
                            
                        } else if !isUsernameTextFieldShowing {
                            // 두번째 다음
                            if viewModel.password.count >= 6 {
                                withAnimation(.easeOut(duration: 1.5)) {
                                    isUsernameTextFieldShowing = true
                                    focus = .username
                                }
                                
                            } else {
                                isEmptyAlertShowing = true
                            }
                            
                        } else if isUsernameTextFieldShowing {
                            // 완료
                            if !viewModel.username.isEmpty {
                                withAnimation(.smooth(duration: 0.2)) {
                                    loadingBarState = true
                                }
                                Task {
                                    await viewModel.signup()
                                    viewModel.clearInputData()
                                    navigationRouter.popToRoot()
                                }
                                
                            } else {
                                isEmptyAlertShowing = true
                            }
                        }
                    }
                } label: {
                    Text(isUsernameTextFieldShowing ? "완료" : "다음")
                        .modifier(LongButtonModifier(bgColor: .ESTitle))
                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                        .padding(.bottom, 5)
                }
                .alert("이메일 형식 불일치", isPresented: $isEmailFormValidatedAlertShowing) {
                    Button {
                        
                    } label: {
                        Text("확인")
                    }
                } message: {
                    Text("~@~.com 형식을 지켜주세요.")
                }
                .alert("중복된 이메일", isPresented: $isEmailDulicatedAlertShowing) {
                    Button {
                        
                    } label: {
                        Text("확인")
                    }
                } message: {
                    Text("다른 이메일로 다시 입력해주세요.")
                }
                .alert("공백 제출 불가능", isPresented: $isEmptyAlertShowing) {
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
                LottieView(fileName: "Loading", loopMode: .loop)
                    .scaleEffect(0.5)
                    .padding(.bottom, 60)
            }
        }
        .toolbarBackground(Color.ESTitle, for: .navigationBar)
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    navigationRouter.back()
                    viewModel.clearInputData()
                } label: {
                    Image(systemName: "chevron.left")
                        .fontWeight(.medium)
                        .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    BasicSignupView()
        .environment(NavigationRouter())
}
