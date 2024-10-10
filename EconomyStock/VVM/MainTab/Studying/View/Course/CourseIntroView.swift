//
//  CourseIntroView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/10/24.
//

import SwiftUI

struct CourseIntroView: View {
    @Environment(NavigationRouter.self) var navigationRouter: NavigationRouter
    @Environment(MainTabCapsule.self) var mainTabCapsule: MainTabCapsule
    @Environment(CourseViewModel.self) var viewModel: CourseViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                LottieViewConverter(fileName: viewModel.course.lottieFileName, loopMode: .loop, width: 200, height: 200)
                
                ZStack {
                    Text(viewModel.course.title)
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .padding(.bottom)
                    
                    ProgressCircleView(progressRate: viewModel.course.progressRate)
                        .padding(.leading, 180)
                        .padding(.bottom)
                }
                
                Button {
//                    navigationRouter.navigate(.Page1View)
                } label: {
                    Text("시작하기")
                        .modifier(ShortButtonModifier())
                        .padding(.bottom, 30)
                }
                
                VStack {
                    Text(viewModel.course.description)
                }
                .modifier(TileModifier(height: 400))
            }
        }
        .modifier(NavigationBackModifier())
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    navigationRouter.popToRoot()
                    mainTabCapsule.selectedTab = .house
                } label: {
                    Image(systemName: "house")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28)
                        .foregroundStyle(Color.ESTitle)
                        .padding(.trailing, 5)
                }
            }
        }
        .scrollIndicators(.never)
    }
}

#Preview {
    CourseIntroView()
        .environment(NavigationRouter())
        .environment(MainTabCapsule())
        .environment(CourseViewModel(course: .DUMMY_COURSE))
}
