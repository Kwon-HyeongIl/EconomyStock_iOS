//
//  MoneyAndFinance1View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/20/24.
//

import SwiftUI

struct MoneyAndFinance1View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentImage = false
    @State private var contentText2_2 = false
    
    @State private var nextButton = false
    
    @Namespace private var animation
    
    var body: some View {
        VStack {
            ZStack {
                ScrollView {
                    HStack {
                        Text("1.")
                            .font(.system(size: 35))
                            .fontWeight(.bold)
                            .foregroundStyle(Color.ESTitle)
                            .padding(.leading, 30)
                            .padding(.bottom, 3)
                        
                        Text("통화")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    if progress.count >= 1 {
                        VStack {
                            (Text("화폐는 경제 내에서 일어나는 여러가지 거래에서 사용되는 지불수단으로, 통화란 ")
                            + Text("현재 유통되고 있는 화폐")
                                .foregroundStyle(Color.ESTitle)
                                .fontWeight(.bold)
                            + Text("를 말해요"))
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                                .padding(.top)
                            
                            if contentImage {
                                LottieView(fileName: "MoneyAndFinance1_Money", loopMode: .playOnce, scale: 1.2, width: 150, height: 150)
                            }
                            
                            Spacer()
                        }
                    }
                    
                    if progress.count >= 2 {
                        Text("예를 들어, 우리가 현재 사용하는 지폐는 화폐이면서 통화이지만,")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .padding(.top, 50)
                        
                        if contentText2_2 {
                            Text("조선시대의 상평통보는 화폐이지만 현재 사용되지 않으므로 통화가 아니에요")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                                .padding(.top)
                        }
                    }
                }
                
                if nextButton {
                    VStack {
                        Spacer()
                        
                        Button {
                            let view = UIView(frame: .zero)
                            UIImpactFeedbackGenerator(style: .light, view: view).impactOccurred()
                            
                            viewModel.currentPage += 1
                            navigationRouter.navigate(.MoneyAndFinance2View(viewModel))
                        } label: {
                            LottieView(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.0, width: 100, height: 100)
                                .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
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
                
                if progress.count == 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation(.smooth(duration: 1.0)) {
                            contentImage = true
                        }
                    }
                }
                
                if progress.count == 2 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation(.smooth(duration: 1.0)) {
                            contentText2_2 = true
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                withAnimation(.smooth(duration: 1.0)) {
                                    nextButton = true
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MoneyAndFinance1View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
