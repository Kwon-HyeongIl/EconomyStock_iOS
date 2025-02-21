//
//  NewsCompletionView.swift
//  EconomyStock
//
//  Created by 권형일 on 2/16/25.
//

import SwiftUI

struct NewsCompletionView: View {
    @Environment(NavigationRouter.self) var navRouter
    @Environment(NewsListCapsule.self) var newsListCapule
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
                VStack {
                    HStack {
                        LottieView(fileName: viewModel.courseCover, loopMode: .loop, width: 20, height: 20)
                            .scaleEffect(2.5)
                            .padding(.bottom)
                            .padding(.trailing, 5)
                        
                        Text(viewModel.courseName)
                            .font(.system(size: 18, design: .serif))
                            .fontWeight(.bold)
                    }
                    
                    HStack {
                        Text(viewModel.newsName)
                            .foregroundStyle(.white)
                            .font(.system(size: 15).bold())
                            .padding(.horizontal, 10)
                    }
                    .frame(width: 190, height: 80)
                    .background(NewsBackgroundView())
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 3)
                            .foregroundStyle(Color(hex: "4d4d4d"))
                    }
                }
                .scaleEffect(1.2)
                .padding(.bottom, 30)
                
                Text("축하드려요!")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .padding(.top)
                
                Text("뉴스를 성공적으로 마쳤어요!")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(.top, 5)
                
                Button {
                    withAnimation(.smooth(duration: 0.2)) {
                        loadingBarState = true
                    }
                    
                    Task {
//                        await viewModel.updateUserCoursePage()
                        
                        newsListCapule.isUpdateToggle.toggle()
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
    NewsCompletionView(type: .basicEconomy, currentPage: 1, isPopupLoading: .constant(false), loadingBarState: .constant(false))
        .environment(NavigationRouter())
        .environment(NewsListCapsule())
}
