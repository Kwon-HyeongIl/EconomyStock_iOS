//
//  StudyView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/4/24.
//

import SwiftUI

struct CourseListView: View {
    @Environment(LoginCapsule.self) var loginCapsule
    @Environment(CourseListCapsule.self) var courseListCapsule
    @State private var viewModel = CourseListViewModel()
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                
                HStack {
                    Text("학습")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .padding(.leading)
                    
                    Spacer()
                }
                .padding(.bottom, 5)
            }
            .frame(height: 100)
            
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(viewModel.courses) { course in
                        CourseCoverView(course: course)
                            .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
                            .padding(.bottom, course.type == CourseType.exchangeRateAndBalanceOfPayment ? 70 : 0)
                    }
                }
            }
            .scrollIndicators(.never)
        }
        .ignoresSafeArea(edges: .top)
        .onChange(of: courseListCapsule.isUpdateToggle) {
            viewModel.updateAllCourses()
        }
        .onAppear {
            print("courseListCapsule", courseListCapsule.isUpdateToggle)
            print("t1")
            print(loginCapsule.isLogin)
            if loginCapsule.isLogin {
                viewModel.updateAllCourses()
                print("로그인 후 코스 다시 로드")
            }
        }
        .onAppear {
            if viewModel.isFirstLoad {
                viewModel.updateAllCourses()
                viewModel.isFirstLoad = false
            }
        }
    }
}

#Preview {
    CourseListView()
        .environment(NavigationRouter())
        .environment(LoginCapsule())
        .environment(CourseListCapsule())
}
