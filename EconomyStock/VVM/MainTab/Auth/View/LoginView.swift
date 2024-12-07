//
//  LoginView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/2/24.
//

import SwiftUI

struct LoginView: View {
    @Environment(NavigationRouter.self) var navRouter
    @State private var viewModel = AuthViewModel()
    
    var body: some View {
        ZStack {
            ScrollView {
                Image("Basic_Toktok")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 600)
                    .opacity(0.1)
                    .ignoresSafeArea()
            }
            
            VStack {
                Image("ES_TitleLogo_Blue")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
                    .padding(.top, 90)
                
                Spacer()
                
                Button {
                    viewModel.loginWithApple()
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(height: 50)
                            .foregroundStyle(.black)
                            .padding(.horizontal, 150)
                            .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                        
                        HStack {
                            Image("Apple_Logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 18)
                                .padding(.trailing, 11)
                            
                            Text("Apple로 계속하기")
                                .foregroundStyle(.white)
                                .fontWeight(.medium)
                                .font(.system(size: 16))
                                .padding(.trailing, 6)
                        }
                    }
                    .padding(.bottom, 12)
                }
                
                Button {
                    viewModel.loginWithGoogle()
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(height: 50)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 150)
                            .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                        
                        HStack {
                            Image("Google_Logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 28)
                                .padding(.trailing, 5)
                            
                            Text("Google로 계속하기")
                                .foregroundStyle(.black)
                                .fontWeight(.medium)
                                .opacity(0.8)
                                .font(.system(size: 16))
                                .padding(.trailing, 1)
                        }
                    }
                    .padding(.bottom, 12)
                }
                
                Button {
                    viewModel.loginWithKakao()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(height: 50)
                            .foregroundStyle(Color(red: 254/255, green: 229/255, blue: 0/255))
                            .padding(.horizontal, 150)
                            .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                        
                        HStack {
                            Image("Kakao_Logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 23)
                                .padding(.trailing, 8)
                            
                            Text("Kakao로 계속하기")
                                .foregroundStyle(.black)
                                .fontWeight(.medium)
                                .font(.system(size: 16))
                                .padding(.trailing, 5)
                        }
                    }
                    .padding(.bottom)
                }
                
                Button {
                    navRouter.navigate(.BasicLoginView(viewModel))
                } label: {
                    Text("또는 다른 방식으로 로그인")
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                        .padding(.bottom, 50)
                }
            }
        }
        .modifier(NavigationBackModifier())
        .onChange(of: viewModel.isLoginSuccess, {
            navRouter.popToRoot()
        })
        .overlay {
            if viewModel.loadingBarState {
                LottieView(fileName: "Loading", loopMode: .loop, width: 200, height: 200)
                    .padding(.bottom, 80)
            }
        }
    }
}

#Preview {
    LoginView()
        .environment(NavigationRouter())
}
