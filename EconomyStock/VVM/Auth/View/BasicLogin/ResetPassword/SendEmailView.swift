//
//  SendEmailView.swift
//  EconomyStock
//
//  Created by 권형일 on 12/7/24.
//

import SwiftUI

struct SendEmailView: View {
    @Environment(NavigationRouter.self) var navRouter
    @Bindable var viewModel: AuthViewModel
    
    @State private var contentShowing = false
    
    var body: some View {
        ScrollView {
            VStack {
                LottieView(fileName: "SendingEmail", loopMode: .playOnce, speed: 0.5, width: 150, height: 150)
                    .padding(.top, 100)
                
                if contentShowing {
                    Text("비밀번호 재설정을 위한 이메일을 발송하였습니다!")
                        .font(.system(size: 22))
                        .multilineTextAlignment(.center)
                        .fontWeight(.semibold)
                        .padding(.top, 40)
                        .padding(.bottom, 30)
                    
                    Button {
                        navRouter.popToRoot()
                    } label: {
                        Text("돌아가기")
                            .modifier(LongButtonModifier())
                    }
                }
            }
        }
        .scrollIndicators(.never)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.smooth(duration: 1.0)) {
                    self.contentShowing = true
                }
            }
        }
        .modifier(NavigationBackModifier())
    }
}

#Preview {
    SendEmailView(viewModel: AuthViewModel())
        .environment(NavigationRouter())
}
