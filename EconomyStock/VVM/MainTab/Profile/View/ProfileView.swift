//
//  ProfileView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/4/24.
//

import SwiftUI

struct ProfileView: View {
    @Environment(NavigationRouter.self) var navRouter
    @State private var viewModel = ProfileViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                VStack {
                    if viewModel.isLogin {
                        VStack(spacing: 5) {
                            HStack {
                                Text(viewModel.userName)
                                    .font(.system(size: 23))
                                    .fontWeight(.semibold)
                                    .padding(.leading)
                                
                                Spacer()
                            }
                            
                            HStack(spacing: 0) {
                                Text("경제스톡과 함께한지")
                                    .font(.system(size: 10))
                                    .foregroundStyle(.gray)
                                    .padding(.leading)
                                
                                Text("+52")
                                    .font(.system(size: 13))
                                    .foregroundStyle(Color.ESTitle)
                                    .padding(.bottom, 2)
                                    .padding(.leading, 8)
                                
                                Text("일")
                                    .font(.system(size: 10))
                                    .foregroundStyle(Color.ESTitle)
                                    .padding(.leading, 2)
                                
                                Spacer()
                            }
                        }
                        
                    } else {
                        Button {
                            navRouter.navigate(.LoginView)
                        } label: {
                            ZStack {
                                VStack(spacing: 5) {
                                    HStack {
                                        Text("로그인")
                                            .font(.system(size: 19).bold())
                                            .foregroundStyle(Color.ESTitle)
                                            .padding(.leading)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text("로그인하여 진행상황을 안전하게 저장하세요")
                                            .font(.system(size: 11))
                                            .foregroundStyle(.gray)
                                            .padding(.leading)
                                        
                                        Spacer()
                                    }
                                }
                                
                                HStack {
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(.gray)
                                        .padding(.trailing, 20)
                                }
                            }
                        }
                    }
                }
                .frame(height: 80)
                .frame(maxWidth: .infinity)
                .background(.ultraThickMaterial)
                .cornerRadius(20.0, corners: .allCorners)
                .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
                .padding(.horizontal, 10)
                
                
                HStack {
                    Text("전체 학습 진행률")
                        .font(.system(size: 20).bold())
                        .opacity(0.8)
                        .padding(.trailing, 50)
                        
                    ProgressCircleView(progressRate: viewModel.totalStudyingPercentage)
                        .scaleEffect(2.5)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 120)
                .background(.ultraThickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
                .padding(.horizontal, 10)
                .padding(.top, 20)
                
                VStack(spacing: 0) {
                    Button {
                        navRouter.navigate(.AccountInfoView(viewModel))
                    } label: {
                        HStack {
                            Image(systemName: "person")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                                .padding(.leading, 30)
                            
                            Text("계정 정보")
                                .font(.system(size: 15))
                                .padding(.leading, 10)
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right").padding(.trailing, 30)
                        }
                        .foregroundStyle(.black)
                    }
                    
                    Divider()
                        .padding()
                    
                    HStack {
                        Image(systemName: "bell")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .padding(.leading, 30)
                        
                        Text("알림 관리")
                            .font(.system(size: 15))
                            .padding(.leading, 10)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right").padding(.trailing, 30)
                    }
                }
                .padding(.top, 30)
            }
        }
        .scrollIndicators(.never)
        .modifier(NavigationTitleModifier(title: "프로필"))
    }
}

#Preview {
    ProfileView()
        .environment(NavigationRouter())
}
