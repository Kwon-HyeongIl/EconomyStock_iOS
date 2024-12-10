//
//  BasicEconomy11View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/10/24.
//

import SwiftUI
import PopupView

struct BasicEconomy11View: View {
    @Environment(NavigationRouter.self) var navRouter
    @Environment(CourseListViewCapsule.self) var courseListViewCapule
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentPart2_1 = false
    @State private var contentPart2_2 = false
    @State private var contentPart2_3 = false
    
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
                            Text("3.")
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                                .foregroundStyle(Color.ESTitle)
                                .padding(.leading, 30)
                            
                            Text("마무리")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                                .padding(.top, 5)
                            
                            Spacer()
                        }
                        .padding(.top)
                        
                        Text("경제학이 지향하는 목표")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .padding(.top, 10)
                            .blur(radius: progress.count != 2 ? 0 : 10)
                        
                        if progress.count >= 1 {
                            HStack(spacing: 20) {
                                Ellipse()
                                    .frame(width: 110, height: 60)
                                    .foregroundStyle(Color.ESTitle)
                                    .overlay {
                                        Text("경제성장")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.white)
                                    }
                                    .matchedGeometryEffect(id: "animation", in: animation)
                                
                                Text("+")
                                    .font(.system(size: 30))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.ESTitle)
                                
                                Ellipse()
                                    .frame(width: 110, height: 60)
                                    .foregroundStyle(Color.ESTitle)
                                    .overlay {
                                        Text("물가안정")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.white)
                                    }
                            }
                            .padding(.top)
                            .blur(radius: progress.count == 1 ? 0 : 10)
                        }
                        
                        if progress.count >= 2 {
                            VStack(spacing: 20) {
                                Ellipse()
                                    .frame(width: 110, height: 60)
                                    .foregroundStyle(Color.ESTitle)
                                    .overlay {
                                        Text("경제성장")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.white)
                                    }
                                    .matchedGeometryEffect(id: "animation", in: animation)
                                
                                if contentPart2_1 {
                                    HStack {
                                        Text("=")
                                            .foregroundStyle(Color.ESTitle)
                                            .font(.system(size: 30))
                                            .fontWeight(.semibold)
                                            .padding(.bottom, 5)
                                        
                                        (Text("GDP의 증가 ")
                                         + Text("(생산)")
                                            .foregroundStyle(Color.ESTitle)
                                        )
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                    }
                                    .padding(.top)
                                }
                                
                                if contentPart2_2 {
                                    HStack {
                                        Text("=")
                                            .foregroundStyle(Color.ESTitle)
                                            .font(.system(size: 30))
                                            .fontWeight(.semibold)
                                            .padding(.bottom, 5)
                                        
                                        (Text("국민소득의 증가 ")
                                         + Text("(분배)")
                                            .foregroundStyle(Color.ESTitle)
                                        )
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                    }
                                }
                                
                                if contentPart2_3 {
                                    HStack {
                                        Text("=")
                                            .foregroundStyle(Color.ESTitle)
                                            .font(.system(size: 30))
                                            .fontWeight(.semibold)
                                            .padding(.bottom, 5)
                                        
                                        (Text("소비, 투자, 정부지출, 순수출의 증가 ")
                                         + Text("(지출)")
                                            .foregroundStyle(Color.ESTitle)
                                        )
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                    }
                                }
                            }
                            .padding(.top, 50)
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
                    if progress.count < 3 {
                        progress.append(1)
                    }
                    
                    if progress.count == 2 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            withAnimation(.smooth(duration: 1.0)) {
                                contentPart2_1 = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentPart2_2 = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            withAnimation(.smooth(duration: 1.0)) {
                                                contentPart2_3 = true
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
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
        .popup(isPresented: $popup) {
            if !isCompletePopupAppear {
                AICourseSummaryView(type: .basicEconomy, isCompletePopupAppear: $isCompletePopupAppear)
                    .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                
            } else if isCompletePopupAppear {
                CourseCompletionView(type: .basicEconomy, currentPage: viewModel.currentPage, isPopupLoading: $isPopupLoading, loadingBarState: $loadingBarState)
                    .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.6) {
                            withAnimation(.smooth(duration: 1.0)) {
                                self.isPopupLoading = false
                            }
                        }
                    }
            }
        } customize: {
            $0
                .animation(.spring(duration: 0.7))
                .closeOnTapOutside(false)
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
    BasicEconomy11View(viewModel: CourseViewModel(course: .DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
