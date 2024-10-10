//
//  BasicEconomyPage1.swift
//  EconomyStock
//
//  Created by 권형일 on 10/10/24.
//

import SwiftUI

struct Page1BasicEconomyView: View {
    @Environment(CourseViewModel.self) var viewModel: CourseViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    Page1BasicEconomyView()
        .environment(CourseViewModel(course: .DUMMY_COURSE))
}
