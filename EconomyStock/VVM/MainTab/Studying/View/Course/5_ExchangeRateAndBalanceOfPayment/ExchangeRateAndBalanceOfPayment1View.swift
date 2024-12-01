//
//  ExchangeRateAndBalanceOfPayment1View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/30/24.
//

import SwiftUI

struct ExchangeRateAndBalanceOfPayment1View: View {
    @Bindable var viewModel: CourseViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ExchangeRateAndBalanceOfPayment1View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
}
