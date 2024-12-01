//
//  ExchangeRateAndBalanceOfPayment13View.swift
//  EconomyStock
//
//  Created by 권형일 on 12/1/24.
//

import SwiftUI

struct ExchangeRateAndBalanceOfPayment13View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ExchangeRateAndBalanceOfPayment13View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
