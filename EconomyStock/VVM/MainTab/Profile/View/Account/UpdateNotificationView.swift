//
//  SetAlarmView.swift
//  EconomyStock
//
//  Created by 권형일 on 2/27/25.
//

import SwiftUI

struct UpdateNotificationView: View {
    @Environment(NavigationRouter.self) var navRouter
    @Bindable var viewModel: ProfileViewModel
    
    @State private var eventNotification: Bool
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        
        let notificationType = AuthManager.shared.isLogin ? AuthManager.shared.remoteUser?.notificationType : AuthManager.shared.localUser?.notificationType
        
        self.eventNotification = notificationType?.contains(.event) ?? true ? true : false
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Toggle("경제 지표 변동 사항", isOn: $eventNotification)
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                            .tint(.ESTitle)
                            .padding(.horizontal)
                        Text(eventNotification ? "경제 지표 관련 주요한 변동이 있을 때 알림을 받을 수 있어요." : "경제 지표 관련 주요한 변동이 있어도 알림을 수신 받지 않아요.")
                            .font(.system(size: 12))
                            .foregroundStyle(.gray)
                            .padding(.horizontal)
                        Divider()
                            .padding(.horizontal)
                    }
                    .padding(.top, 5)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    Task {
                        await viewModel.editNotificationType(eventNotification: eventNotification)
                    }
                    navRouter.back()
                } label: {
                    Image(systemName: "chevron.left")
                        .scaledToFit()
                        .frame(width: 24)
                        .fontWeight(.medium)
                        .foregroundStyle(.black)
                }
            }
            
            ToolbarItem(placement: .principal) {
                Text("알림")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    UpdateNotificationView(viewModel: ProfileViewModel())
        .environment(NavigationRouter())
}
