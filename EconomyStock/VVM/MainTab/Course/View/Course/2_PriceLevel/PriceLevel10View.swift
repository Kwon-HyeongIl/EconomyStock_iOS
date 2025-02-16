//
//  PriceLevel10View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/15/24.
//

import SwiftUI

struct PriceLevel10View: View {
    @Environment(NavigationRouter.self) var navRouter
    @Environment(CourseListCapsule.self) var courseListViewCapule
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentText1_2 = false
    @State private var contentImage1 = false
    @State private var nextScrollPart = false
    @State private var contentText2_2 = false
    @State private var contentImage2 = false
    
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
                        
                        ZStack {
                            if progress.count >= 1 {
                                VStack {
                                    Text("일반적으로 경제가 성장할 때 물가는 상승하고 경제성장이 둔화될 때 물가가 하락해요")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                    
                                    if contentText1_2 {
                                        (Text("따라서, ")
                                        + Text("물가안정")
                                            .foregroundStyle(Color.ESTitle)
                                            .fontWeight(.bold)
                                        + Text("과 ")
                                        + Text("경제성장")
                                            .foregroundStyle(Color.ESTitle)
                                            .fontWeight(.bold)
                                        + Text("을 동시에 달성하는 것은 매우 어려워요"))
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                        .padding(.top, 30)
                                    }
                                    
                                    if contentImage1 {
                                        LottieView(fileName: "PriceLevel10_Balance", loopMode: .playOnce, width: 150, height: 150)
                                            .padding(.top, 10)
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 300)
                        }
                        
                        ZStack {
                            if nextScrollPart {
                                VStack {
                                    Text("하지만, 방법이 없는 것은 아니에요")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                        .padding(.bottom, 35)
                                    
                                    if contentText2_2 {
                                        Text("기술 진보를 통해 경제의 생산 능력이 향상된다면 물가를 안정적인 수준으로 유지하면서 경제가 성장하는 것이 가능해요")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal)
                                            .padding(.bottom, 5)
                                    }
                                    
                                    if contentImage2 {
                                        LottieView(fileName: "PriceLevel10_ScienceProgress", loopMode: .playOnce, scale: 1.3, width: 150, height: 150)
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 300)
                        }
                        .padding(.top, 60)
                        
                        ZStack {
                            if progress.count >= 3 {
                                Text("하지만, 기술 진보는 현실적으로 시간이 매우 오래 걸리고 어렵기 때문에 정부와 금융 당국은 경제에 최대한 손실을 입히지 않고 적절하게 둘을 조절 해야할 필요가 있어요")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 240)
                        }
                        .padding(.top, 30)
                        
                        Rectangle()
                            .fill(.clear)
                            .frame(width: 100, height: 70)
                            .id("bottom")
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
                    if progress.count < 4 {
                        progress.append(1)
                    }
                    
                    if progress.count == 1 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation {
                                contentText1_2 = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    withAnimation {
                                        contentImage1 = true
                                    }
                                }
                            }
                        }
                    }
                    
                    if progress.count == 2 {
                        withAnimation {
                            proxy.scrollTo("bottom", anchor: .top)
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation {
                                nextScrollPart = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation {
                                        contentText2_2 = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            withAnimation {
                                                contentImage2 = true
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    if progress.count == 3 {
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
        .popup(isPresented: $popup) {
            if !isCompletePopupAppear {
                AICourseSummaryView(type: .priceLevel, isCompletePopupAppear: $isCompletePopupAppear)
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                
            } else if isCompletePopupAppear {
                CourseCompletionView(type: .priceLevel, currentPage: viewModel.currentPage, isPopupLoading: $isPopupLoading, loadingBarState: $loadingBarState)
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
    PriceLevel10View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListCapsule())
}
