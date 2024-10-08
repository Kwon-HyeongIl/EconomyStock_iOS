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
    
    var body: some View {
        ZStack {
            VStack {
                Text("등록할 이메일을 입력해주세요.")
                    .font(.system(size: 23))
                    .fontWeight(.semibold)
                    .padding(.bottom, 30)
                
                if isUsernameTextFieldShowing {
                    VStack(spacing: 0) {
                        HStack {
                            Text("닉네임")
                                .font(.system(size: 12))
                                .padding(.leading, 20)
                                .padding(.bottom, 5)
                            
                            Spacer()
                        }
                        .padding(.bottom, 5)
                        TextField("닉네임", text: $viewModel.email)
                            .padding(.leading, 20)
                            .padding(.bottom)
                            .focused($focus, equals: .username)
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.gray)
                            .opacity(0.5)
                            .frame(height: 3)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 35)
                    }
                }
                
                if isPasswordTextFieldShowing {
                    VStack(spacing: 0) {
                        HStack {
                            Text("비밀번호")
                                .font(.system(size: 12))
                                .padding(.leading, 20)
                                .padding(.bottom, 5)
                            
                            Spacer()
                        }
                        .padding(.bottom, 5)
                        SecureField("비밀번호", text: $viewModel.email)
                            .padding(.leading, 20)
                            .padding(.bottom)
                            .focused($focus, equals: .password)
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.gray)
                            .opacity(0.5)
                            .frame(height: 3)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 35)
                    }
                }
                
                VStack(spacing: 0) {
                    HStack {
                        Text("이메일")
                            .font(.system(size: 12))
                            .padding(.leading, 20)
                            .padding(.bottom, 5)
                        
                        Spacer()
                    }
                    .padding(.bottom, 5)
                    TextField("이메일", text: $viewModel.email)
                        .padding(.leading, 20)
                        .padding(.bottom)
                        .focused($focus, equals: .email)
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.gray)
                        .opacity(0.5)
                        .frame(height: 3)
                        .padding(.horizontal, 20)
                }
                
                Spacer()
            }
            
            VStack {
                Spacer()
                
                Button {
                    withAnimation(.smooth(duration: 0.4)) {
                        if !isPasswordTextFieldShowing {
                            // 첫번째 다음
                            isPasswordTextFieldShowing = true
                            focus = .password
                            
                        } else if !isUsernameTextFieldShowing {
                            // 두번째 다음
                            isUsernameTextFieldShowing = true
                            focus = .username
                            
                        } else if isUsernameTextFieldShowing {
                            // 완료
                            
                        }
                    }
                } label: {
                    Text("다음")
                        .modifier(LongButtonModifier(bgColor: .ESTitle))
                        .shadow(color: .gray.opacity(0.8), radius: 10, x: 5, y: 5)
                        .padding(.bottom, 5)
                }
            }
        }
        .onAppear {
            focus = .email
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
