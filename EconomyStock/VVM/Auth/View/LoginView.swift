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
            Spacer()
            
            Button {
                viewModel.loginWithApple()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 50)
                        .foregroundStyle(.black)
                        .padding(.horizontal, 50)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5)
                    
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
                .padding(.bottom, 10)
            }
            
            Button {
                viewModel.loginWithGoogle()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 50)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 50)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5)
                    
                    HStack {
                        Image("Google_Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 28)
                            .padding(.trailing, 5)
                        
                        Text("Google로 계속하기")
                            .foregroundStyle(.black)
                            .fontWeight(.medium)
                            .opacity(0.6)
                            .font(.system(size: 16))
                    }
                }
                .padding(.bottom, 10)
            }
            
            Button {
                viewModel.loginWithKakao()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 50)
                        .foregroundStyle(Color(red: 254/255, green: 229/255, blue: 0/255))
                        .padding(.horizontal, 50)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5)
                    
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
                .padding(.bottom, 100)
            }
        }
    }
}

#Preview {
    LoginView()
}
