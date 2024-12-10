//
//  UnEmployment7View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/16/24.
//

import SwiftUI

struct UnEmployment7View: View {
    @Environment(NavigationRouter.self) var navRouter
    @Environment(CourseListViewCapsule.self) var courseListViewCapule
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentText1_2 = false
    @State private var contentImage = false
    
    @State private var completeButton = false
    @State private var beforeButton = false
    
    @State private var popup = false
    @State private var isPopupLoading = true
    
    @State private var loadingBarState = false
    
    @Namespace private var animation
    
    var body: some View {
        VStack {
            ZStack {
                ScrollView {
                    HStack {
                        Text("4.")
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
                        VStack {
                            Text("고용은 사람들의 소득 수준을 결정하며, 이는 소비에 직접적인 영향을 미치기 때문에 적절한 고용수준을 유지하는 것은 아주 중요해요")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            if contentText1_2 {
                                Text("또한, 이러한 이유로 고용지표는 한 나라의 경제상황을 알려주는 중요한 지표중 하나가 되어요")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                    .padding(.top, 30)
                            }
                            
                            if contentImage {
                                LottieView(fileName: "UnEmployment7_Business", loopMode: .playOnce, scale: 1.2, width: 150, height: 150)
                                    .padding(.top)
                            }
                            
                            Spacer()
                        }
                        .padding(.top)
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
                                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
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
                                            .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
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
            withAnimation(.smooth(duration: 1.0)) {
                if progress.count < 2 {
                    progress.append(1)
                }
                
                if progress.count == 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation(.smooth(duration: 1.0)) {
                            contentText1_2 = true
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                withAnimation(.smooth(duration: 1.0)) {
                                    contentImage = true
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        withAnimation(.smooth(duration: 1.0)) {
                                            completeButton = true
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                withAnimation(.smooth(duration: 1.0)) {
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
        .popup(isPresented: $popup) {
            CourseCompletionView(type: .unEmployment, currentPage: viewModel.currentPage, isPopupLoading: $isPopupLoading, loadingBarState: $loadingBarState)
            .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.6) {
                    withAnimation(.smooth(duration: 1.0)) {
                        self.isPopupLoading = false
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
    UnEmployment7View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
