//
//  CourseCompletionView.swift
//  EconomyStock
//
//  Created by 권형일 on 12/10/24.
//

import SwiftUI

struct CourseCompletionView: View {
    @Environment(NavigationRouter.self) var navRouter
    @Environment(CourseListCapsule.self) var courseListViewCapule
    @State private var viewModel: CourseAndNewsCompletionViewModel
    
    @Binding var isPopupLoading: Bool
    @Binding var loadingBarState: Bool
    
    init(type: CourseAndNewsType, currentPage: Int, isPopupLoading: Binding<Bool>, loadingBarState: Binding<Bool>) {
        self.viewModel = CourseAndNewsCompletionViewModel(type: type, currentPage: currentPage)
        self._isPopupLoading = isPopupLoading
        self._loadingBarState = loadingBarState
    }
    
    var body: some View {
        VStack {
            if isPopupLoading {
                LottieView(fileName: "CompletionEffect", loopMode: .playOnce, width: 120, height: 120)
            } else {
                LottieView(fileName: viewModel.courseCover, loopMode: .loop, width: 140, height: 140)
                
                Text(viewModel.courseName)
                    .font(.system(size: 30, design: .serif))
                    .fontWeight(.bold)
                    .padding(.bottom, 30)
                
                Text("축하드려요!")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                
                Text("강의를 성공적으로 마쳤어요!")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(.top, 5)
                
                Button {
                    loadingBarState = true
                    
                    Task {
                        await viewModel.updateUserCoursePage()
                        
                        courseListViewCapule.isUpdateToggle.toggle()
                    }
                    
                    navRouter.popToRoot()
                } label: {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 80, height: 40)
                        .foregroundStyle(Color.ESTitle)
                        .overlay {
                            Text("확인")
                                .foregroundStyle(.white)
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                        }
                        .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
                        .padding(.top, 30)
                        
                }
            }
        }
        .frame(width: 320, height: 500)
        .background(.ultraThickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    CourseCompletionView(type: .basicEconomy, currentPage: 1, isPopupLoading: .constant(false), loadingBarState: .constant(false))
        .environment(NavigationRouter())
        .environment(CourseListCapsule())
}
