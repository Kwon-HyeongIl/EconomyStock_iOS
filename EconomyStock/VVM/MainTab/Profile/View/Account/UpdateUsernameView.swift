//
//  UpdateUsernameView.swift
//  EconomyStock
//
//  Created by 권형일 on 2/27/25.
//

import SwiftUI

struct UpdateUsernameView: View {
    @Environment(NavigationRouter.self) var navRouter
    @Bindable var viewModel: ProfileViewModel
    
    @FocusState private var focus: OneFocusField?
    @State private var username = ""
    
    @State private var loadingBarState = false
    
    var body: some View {
        VStack {
            ZStack {
                ScrollView {
                    VStack(spacing: 0) {
                        HStack {
                            Text("닉네임")
                                .font(.system(size: 12))
                                .fontWeight(.medium)
                                .foregroundStyle(focus == .target ? Color.ESTitle : .gray)
                                .padding(.leading, 20)
                            
                            Spacer()
                        }
                        .padding(.bottom, 5)
                        
                        TextField("새로운 닉네임", text: $username)
                            .font(.system(size: 20))
                            .padding(.leading, 20)
                            .padding(.bottom, 10)
                            .focused($focus, equals: .target)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(focus == .target ? Color.ESTitle : .gray)
                            .opacity(focus == .target ? 0.8 : 0.5)
                            .frame(height: 2)
                            .padding(.horizontal, 20)
                    }
                }
                .scrollIndicators(.never)
                
                VStack {
                    Spacer()
                    
                    Button {
                        Task {
                            self.loadingBarState = true
                            
                            await viewModel.updateUsername(username)
                            
                            navRouter.back()
                        }
                    } label: {
                        Text("저장")
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(username.isEmpty ? .gray : Color.ESTitle)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.horizontal, 5)
                            .padding(.bottom, 5)
                    }
                    .disabled(username.isEmpty)
                }
            }
        }
        .modifier(NavigationBackTitleModifier(title: "닉네임"))
        .overlay {
            if loadingBarState {
                LottieView(fileName: "Loading", loopMode: .loop, width: 200, height: 200)
            }
        }
    }
}

#Preview {
    UpdateUsernameView(viewModel: ProfileViewModel())
        .environment(NavigationRouter())
}
