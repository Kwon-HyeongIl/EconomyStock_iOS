//
//  StudyingCover.swift
//  EconomyStock
//
//  Created by 권형일 on 10/9/24.
//

import SwiftUI

struct CourseCoverView: View {
    @Environment(NavigationRouter.self) var navRouter
    @State private var viewModel: CourseViewModel
    
    init(course: Course) {
        self.viewModel = CourseViewModel(course: course)
    }
    
    var body: some View {
        Button {
            navRouter.navigate(.CourseIntroView(viewModel))
        } label: {
            VStack {
                ZStack {
                    ZStack {
                        LottieView(fileName: viewModel.course.lottieFileName, loopMode: .loop, width: 140, height: 140)
                            .padding(.trailing, 190)
                        
                        Text(viewModel.course.number)
                            .font(.system(size: 38, design: .serif))
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .padding(.bottom, 2)
                        
                        HStack {
                            Text(viewModel.course.title)
                                .foregroundStyle(.white)
                                .font(.system(size: 32))
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .frame(width: 140)
                        .padding(.leading, 200)
                        
                    }
                    
                    VStack {
                        HStack {
                            Spacer()
                            
                            ProgressCircleView(progressRate: viewModel.course.progressRate)
                                .padding(.top, 10)
                                .padding(.trailing, 10)
                        }
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
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
