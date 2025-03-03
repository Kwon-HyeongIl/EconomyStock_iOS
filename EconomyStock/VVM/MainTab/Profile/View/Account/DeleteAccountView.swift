//
//  deleteAccountView.swift
//  EconomyStock
//
//  Created by 권형일 on 3/3/25.
//

import SwiftUI

struct DeleteAccountView: View {
    @Environment(NavigationRouter.self) var navRouter
    @Environment(MainTabCapsule.self) var capsule
    @Bindable var viewModel: ProfileViewModel
    
    @State private var loadingBarState = false
    
    var body: some View {
        VStack {
            ZStack {
                ScrollView {
                    VStack {
                        Text("\(viewModel.remoteUser?.username ?? "")님\n\n정말 경제스톡을 떠나실 건가요?")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                        
                        Image("Frustration_Toktok")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .scaleEffect(x: -1, y: 1)
                            .padding(.top)
                        
                        Text("아래의 확인 버튼을 누르면 사용자의 모든 데이터가 삭제됩니다.")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .padding(.top, 50)
                    }
                }
                .scrollIndicators(.never)
                
                VStack {
                    Spacer()
                    
                    Button {
                        self.loadingBarState = true
                        
                        viewModel.deleteAccount()
                        
                        capsule.selectedTab = .home
                        navRouter.popToRoot()
                    } label: {
                        Text("확인")
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.ESTitle)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.horizontal, 5)
                            .padding(.bottom, 5)
                    }
                }
            }
        }
        .modifier(NavigationBackTitleModifier(title: "회원 탈퇴"))
    }
}

#Preview {
    DeleteAccountView(viewModel: ProfileViewModel())
        .environment(NavigationRouter())
        .environment(MainTabCapsule())
}
