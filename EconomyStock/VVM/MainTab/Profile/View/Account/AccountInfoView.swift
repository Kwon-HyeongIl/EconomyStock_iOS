//
//  AccountView.swift
//  EconomyStock
//
//  Created by 권형일 on 12/7/24.
//

import SwiftUI

struct AccountInfoView: View {
    @Environment(NavigationRouter.self) var navRouter
    @Bindable var viewModel: ProfileViewModel
    @State var tempViewModel = TempViewModel()
    
    @State private var text = ""
    
    var body: some View {
        ScrollView {
            Text(String(tempViewModel.user?.totalStudyingPercentage ?? 99.9))
            
            TextField("text", text: $text)
            
            Button {
                tempViewModel.updatePercentage(num: Double(text) ?? 89.9)
            } label: {
                Text("수정")
            }
        }
        .scrollIndicators(.never)
        .modifier(NavigationBackTitleModifier(title: "계정 정보"))
    }
}

#Preview {
    AccountInfoView(viewModel: ProfileViewModel())
        .environment(NavigationRouter())
}
