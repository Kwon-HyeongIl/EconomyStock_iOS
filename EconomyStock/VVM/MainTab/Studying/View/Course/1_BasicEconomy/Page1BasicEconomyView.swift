//
//  BasicEconomyPage1.swift
//  EconomyStock
//
//  Created by 권형일 on 10/10/24.
//

import SwiftUI

struct Page1BasicEconomyView: View {
    @Environment(NavigationRouter.self) var navigationRouter: NavigationRouter
    @Bindable var viewModel: CourseViewModel
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .modifier(NavigationBackModifier())
    }
}

#Preview {
    Page1BasicEconomyView(viewModel: CourseViewModel(course: .DUMMY_COURSE))
}
