//
//  StudyingCover.swift
//  EconomyStock
//
//  Created by 권형일 on 10/9/24.
//

import SwiftUI

struct CourseCoverView: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @State private var viewModel: CourseViewModel
    
    init(course: Course) {
        self.viewModel = CourseViewModel(course: course)
    }
    
    var body: some View {
        Button {
            navigationRouter.navigate(.CourseIntroView(viewModel))
        } label: {
            VStack {
                ZStack {
                    ZStack {
                        LottieView(fileName: viewModel.course.lottieFileName, loopMode: .loop, width: 140, height: 140)
                            .padding(.trailing, 190)
                        
                        HStack(spacing: 0) {
                            Text(viewModel.course.number)
                                .font(.system(size: 38, design: .serif))
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                                .padding(.bottom, 2)
                                
                            
                            Text(viewModel.course.title)
                                .foregroundStyle(.white)
                                .font(.system(size: 32))
                                .fontWeight(.bold)
                                .padding(.leading, 10)
                            
                            Spacer()
                        }
                        .padding(.leading, 170)
                    }
                    
                    HStack {
                        ProgressCircleView(progressRate: viewModel.course.progressRate)
                            .padding(.leading, 320)
                            .padding(.bottom, 110)
                    }
                }
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 170)
            .background(viewModel.course.backgroundGradient)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 10)
            .environment(viewModel)
        }
    }
}

#Preview {
    CourseCoverView(course: Course.DUMMY_COURSE)
        .environment(NavigationRouter())
}
