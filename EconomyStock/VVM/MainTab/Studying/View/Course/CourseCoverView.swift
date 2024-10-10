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
                    HStack(spacing: 0) {
                        LottieViewConverter(fileName: viewModel.course.lottieFileName, loopMode: .loop, width: 140, height: 140)
                        
                        Text(viewModel.course.title)
                            .foregroundStyle(.white)
                            .font(.system(size: 32))
                            .fontWeight(.bold)
                            .padding(.trailing, 55)
                            .padding(.leading, 20)
                    }
                    
                    HStack {
                        if viewModel.course.progressRate == 100.0 {
                            Image(systemName: "checkmark.seal")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35)
                                .fontWeight(.semibold)
                                .foregroundStyle(.green)
                                .padding(.leading, 320)
                                .padding(.bottom, 105)
                            
                        } else {
                            ProgressCircleView(progressRate: viewModel.course.progressRate)
                                .padding(.leading, 320)
                                .padding(.bottom, 105)
                        }
                    }
                }
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 160)
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
