//
//  StudyView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/4/24.
//

import SwiftUI

struct StudyingView: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @State private var viewModel = StudyingViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                ForEach(viewModel.courses) { course in
                    CourseCoverView(course: course)
                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
                }
            }
        }
        .modifier(NavigationTitleModifier(title: "학습"))
        .scrollIndicators(.never)
    }
}

#Preview {
    StudyingView()
        .environment(NavigationRouter())
}
