//
//  CourseCompletionView.swift
//  EconomyStock
//
//  Created by 권형일 on 12/10/24.
//

import SwiftUI

struct CourseCompletionView: View {
    @Environment(NavigationRouter.self) var navRouter
    @Environment(CourseListViewCapsule.self) var courseListViewCapule
    @State private var viewModel: CourseCompletionViewModel
    
    @Binding var isPopupLoading: Bool
    @Binding var loadingBarState: Bool
    
    init(type: CourseType, currentPage: Int, isPopupLoading: Binding<Bool>, loadingBarState: Binding<Bool>) {
        self.viewModel = CourseCompletionViewModel(type: type, currentPage: currentPage)
        self._isPopupLoading = isPopupLoading
        self._loadingBarState = loadingBarState
    }
    
    var body: some View {
        VStack {
            if isPopupLoading {
                LottieView(fileName: "CourseComplete", loopMode: .playOnce, scale: 1.3, width: 200, height: 200)
            } else {
                LottieView(fileName: viewModel.courseCover, loopMode: .loop, width: 150, height: 150)
                
                Text(viewModel.courseName)
                    .font(.system(size: 30, design: .serif))
                    .fontWeight(.bold)
                
                Text("축하드려요!")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .padding(.top)
                
                Text("강의를 성공적으로 마쳤어요!")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(.top, 5)
                
                Button {
                    withAnimation(.smooth(duration: 0.2)) {
                        loadingBarState = true
                    }
                    
                    Task {
                        await viewModel.updateUserCoursePage()
                        
                        courseListViewCapule.isUpdate.toggle()
                    }
                    
                    navRouter.popToRoot()
                } label: {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 80, height: 40)
                        .foregroundStyle(Color.ESTitle)
                        .overlay {
                            Text("돌아가기")
                                .foregroundStyle(.white)
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                        }
                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
                        .padding(.top, 30)
                        
                }
            }
        }
        .frame(width: 320, height: 520)
        .background(.ultraThickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    CourseCompletionView(type: .basicEconomy, currentPage: 1, isPopupLoading: .constant(false), loadingBarState: .constant(false))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
