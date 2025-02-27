//
//  ServiceCenterView.swift
//  EconomyStock
//
//  Created by 권형일 on 2/27/25.
//

import SwiftUI

struct ServiceCenterView: View {
    @Environment(NavigationRouter.self) var navRouter
    @Bindable var viewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            
        }
        .modifier(NavigationBackTitleModifier(title: "고객 센터"))
    }
}

#Preview {
    ServiceCenterView(viewModel: ProfileViewModel())
        .environment(NavigationRouter())
}
