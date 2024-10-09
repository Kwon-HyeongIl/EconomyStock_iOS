//
//  Page1.swift
//  EconomyStock
//
//  Created by 권형일 on 10/10/24.
//

import SwiftUI

struct Page1View: View {
    @Environment(NavigationRouter.self) var navigationRouter: NavigationRouter
    @Environment(BasicEconomyCourseViewModel.self) var viewModel: BasicEconomyCourseViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    Page1View()
        .environment(NavigationRouter())
        .environment(BasicEconomyCourseViewModel())
}
