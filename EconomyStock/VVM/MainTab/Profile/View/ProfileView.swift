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
        VStack {
            VStack {
                Spacer()
                
                HStack {
                    Text("프로필")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .padding(.leading)
                    
                    Spacer()
                }
            }
            .frame(height: 100)
            
            ScrollView {
                VStack(spacing: 0) {
                    VStack {
                        if viewModel.isLogin {
                            VStack(spacing: 5) {
                                HStack {
                                    Button {
                                        navRouter.navigate(.AccountInfoView(viewModel))
                                    } label: {
                                        Text(viewModel.remoteUser?.username ?? "")
                                            .font(.system(size: 23))
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.black)
                                            .padding(.leading)
                                            .padding(.bottom, 3)
                                        
                                        Image(systemName: "chevron.right")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 7)
                                            .foregroundStyle(.gray)
                                            .fontWeight(.bold)
                                            .padding(.leading, 5)
                                    }
                                    
                                    Spacer()
                                }
                                
                                HStack(spacing: 0) {
                                    Text("경제스톡과 함께한지")
                                        .font(.system(size: 11))
                                        .foregroundStyle(.gray)
                                        .padding(.leading, 16)
                                    
                                    Text("\(viewModel.dDay)")
                                        .font(.system(size: 13))
                                        .foregroundStyle(Color.ESTitle)
                                        .padding(.leading, 8)
                                    
                                    Text("일")
                                        .font(.system(size: 11))
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
                                                .padding(.leading, 16)
                                            
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
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(.gray.opacity(0.3))
                    }
                    
                    HStack {
                        Text("전체 학습 진행률")
                            .font(.system(size: 20).bold())
                            .opacity(0.8)
                            .padding(.trailing, 25)
                        
                        ProgressCircleView(progressRate: viewModel.totalStudyingRate, isFinishMark: false, circleSize: 70, circleOutStrokeSize: 8, circleInStrokeSize: 6, textSize: 20)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 120)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(.gray.opacity(0.3))
                    }
                    .padding(.top, 20)
                    
                    VStack(spacing: 0) {
                        Button {
                 
                        } label: {
                            HStack {
                                Image(systemName: "bell")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .padding(.leading)
                                
                                Text("알림 관리")
                                    .font(.system(size: 15))
                                    .padding(.leading, 10)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right").padding(.trailing)
                            }
                            .foregroundStyle(.black)
                        }
                        
                        Divider()
                            .padding()
                        
                        Button {
                            
                        } label: {
                            HStack {
                                Image(systemName: "paperplane")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .padding(.leading)
                                
                                Text("고객 센터")
                                    .font(.system(size: 15))
                                    .padding(.leading, 10)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right").padding(.trailing)
                            }
                            .foregroundStyle(.black)
                        }
                    }
                    .padding(.top, 30)
                }
                .padding()
            }
            .scrollIndicators(.never)
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    ProfileView()
        .environment(NavigationRouter())
}
