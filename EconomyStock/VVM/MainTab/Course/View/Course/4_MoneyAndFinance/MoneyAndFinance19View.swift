//
//  MoneyAndFinance19View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/20/24.
//

import SwiftUI

struct MoneyAndFinance19View: View {
    @Environment(NavigationRouter.self) var navRouter
    @Environment(CourseListCapsule.self) var courseListViewCapule
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentText1_2 = false
    @State private var contentImage1_1 = false
    @State private var contentImage1_2 = false
    
    @State private var completeButton = false
    @State private var beforeButton = false
    
    @State private var popup = false
    @State private var isPopupLoading = true
    @State private var isCompletePopupAppear = false
    
    @State private var loadingBarState = false
    
    @Namespace private var animation
    
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                ZStack {
                    ScrollView {
                        HStack {
                            Text("6.")
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                                .foregroundStyle(Color.ESTitle)
                                .padding(.leading, 30)
                                .padding(.bottom, 3)
                            
                            Text("마무리")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .padding(.top)
                        
                        if progress.count >= 1 {
                            Text("통화량과 이자율은 경제에 직접적인 영향을 주기 때문에 중앙은행은 매우 신중하게 이 둘을 조정해야해요")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                                .padding(.top)
                        }
                        
                        if progress.count >= 2 {
                            VStack {
                                (Text("또한, 정부에서 시행하는 재정정책과 달리 통화정책은 경제에 직접적인 영향을 주기 때문에 ")
                                 + Text("중앙은행이 정부로부터 독립성을 가지는 것")
                                    .foregroundStyle(Color.ESTitle)
                                    .fontWeight(.bold)
                                 + Text("은 매우 중요해요"))
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                                .padding(.top, 30)
                                .padding(.bottom)
                                
                                ZStack {
                                    HStack {
                                        if contentImage1_2 {
                                            Spacer()
                                        }
                                        
                                        Image("GovernmentBuilding")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 115)
                                            .opacity(contentImage1_2 ? 1.0 : 0.0)
                                            .padding(.trailing, contentImage1_2 ? 45 : 0)
                                    }
                                    
                                    HStack {
                                        LottieView(fileName: "MoneyAndFinance6_Bank", loopMode: .playOnce, fromProgress: 0.35, scale: 1.2, width: 120, height: 120)
                                            .padding(.leading, contentImage1_2 ? 45 : 0)
                                        
                                        if contentImage1_2 {
                                            Spacer()
                                        }
                                    }
                                }
                           
                                Spacer()
                            }
                        }
                        
                    }
                    .scrollIndicators(.never)
                    
                    if completeButton {
                        VStack {
                            Spacer()
                            
                            ZStack {
                                Button {
                                    let view = UIView(frame: .zero)
                                    UIImpactFeedbackGenerator(style: .light, view: view).impactOccurred()
                                    
                                    popup = true
                                } label: {
                                    LottieView(fileName: "CourseCompleteButton", loopMode: .playOnce, speed: 0.5, scale: 2.0, width: 100, height: 100)
                                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                }
                                
                                if beforeButton {
                                    HStack {
                                        Button {
                                            viewModel.currentPage -= 1
                                            navRouter.back()
                                        } label: {
                                            Image(systemName: "chevron.left")
                                                .font(.system(size: 25))
                                                .fontWeight(.semibold)
                                                .foregroundStyle(Color.ESTitle)
                                                .padding()
                                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding(.leading, 60)
                                    .padding(.trailing, 70)
                                }
                            }
                        }
                    }
                }
            }
            .modifier(CourseToolbarModifier(viewModel: viewModel, currentPage: viewModel.currentPage, totalPage: viewModel.course.totalPage))
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation {
                    if progress.count < 2 {
                        progress.append(1)
                    }
                    
                    if progress.count == 2 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation {
                                contentImage1_1 = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                                    withAnimation {
                                        contentImage1_2 = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            withAnimation {
                                                completeButton = true
                                                
                                                proxy.scrollTo("bottom", anchor: .top)
                                                
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                    withAnimation {
                                                        beforeButton = true
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        .popup(isPresented: $popup) {
            if !isCompletePopupAppear {
                AICourseSummaryView(type: .moneyAndFinance, isCompletePopupAppear: $isCompletePopupAppear)
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                
            } else if isCompletePopupAppear {
                CourseCompletionView(type: .moneyAndFinance, currentPage: viewModel.currentPage, isPopupLoading: $isPopupLoading, loadingBarState: $loadingBarState)
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            withAnimation {
                                self.isPopupLoading = false
                            }
                        }
                    }
            }
        } customize: {
            $0
                .animation(.spring(duration: 0.7))
                .closeOnTapOutside(true)
                .closeOnTap(false)
                .backgroundColor(.gray.opacity(0.8))
        }
        .overlay {
            if loadingBarState {
                LottieView(fileName: "Loading", loopMode: .loop, width: 200, height: 200)
                    .padding(.bottom, 60)
            }
        }
    }
}

#Preview {
    MoneyAndFinance19View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListCapsule())
}
