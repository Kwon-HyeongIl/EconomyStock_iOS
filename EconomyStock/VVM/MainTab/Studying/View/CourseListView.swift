//
//  StudyView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/4/24.
//

import SwiftUI

struct CourseListView: View {
    @Environment(CourseListViewCapsule.self) var capsule
    @State private var viewModel = CourseListViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                ForEach(viewModel.courses) { course in
                    CourseCoverView(course: course)
                        .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
                        .padding(.bottom, course.type == CourseType.exchangeRateAndBalanceOfPayment ? 70 : 0)
                }
            }
        }
        .modifier(NavigationTitleModifier(title: "학습"))
        .scrollIndicators(.never)
        .onChange(of: capsule.isUpdate) {
            viewModel.updateAllCourses()
        }
        .onAppear {
            // 임시
            viewModel.updateAllCourses()
        }
    }
}

#Preview {
    CourseListView()
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
