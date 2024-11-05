//
//  BasicEconomyPage3.swift
//  EconomyStock
//
//  Created by 권형일 on 10/10/24.
//

import SwiftUI

struct BasicEconomy3View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack(spacing: 50) {
                Button {
                    viewModel.currentPage -= 1
                    navigationRouter.back()
                } label: {
                    Image(systemName: "chevron.left")
                }
                
                Button {
                    viewModel.currentPage += 1
                    navigationRouter.navigate(.BasicEconomy3View(viewModel))
                } label: {
                    Image(systemName: "chevron.right")
                }
            }
        }
        .modifier(CourseToolbarModifier(viewModel: viewModel, currentPage: viewModel.currentPage, totalPage: viewModel.course.totalPage))
    }
}

#Preview {
    BasicEconomy3View(viewModel: CourseViewModel(course: .DUMMY_COURSE))
        .environment(NavigationRouter())
}
