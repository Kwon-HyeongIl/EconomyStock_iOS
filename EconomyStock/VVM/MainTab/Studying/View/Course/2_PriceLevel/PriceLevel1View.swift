//
//  Price1View.swift
//  EconomyStock
//
//  Created by 권형일 on 10/11/24.
//

import SwiftUI

struct PriceLevel1View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var image = false
    
    @State private var nextButton = false
    
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
                        
                        Text("물가의 개념")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    if progress.count >= 1 {
                        Text("물가란, 한 경제 내의 재화와 서비스의 전반적인 가격수준을 의미해요")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .padding(.top)
                        
                        if image {
                            LottieViewConverter(fileName: "PriceLevel1_PriceProduct", loopMode: .playOnce, width: 150, height: 150)
                                .padding(.top)
                        }
                    }
                    
                    if progress.count >= 2 {
                        Text("물가는 시장에서 거래되는 개별상품의 가격을 경제에서 차지하는 중요도에 따라 가중치를 적용한 평균값을 통해 도출해요")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .padding(.top, 120)
                    }
                }
                
                if nextButton {
                    VStack {
                        Spacer()
                        
                        Button {
                            let view = UIView(frame: .zero)
                            UIImpactFeedbackGenerator(style: .light, view: view).impactOccurred()
                            
                            viewModel.currentPage += 1
                            navigationRouter.navigate(.PriceLevel2View(viewModel))
                        } label: {
                            LottieViewConverter(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.0, width: 100, height: 100)
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
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation(.smooth(duration: 1.0)) {
                            image = true
                        }
                    }
                }
                
                if progress.count == 2 {
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

#Preview {
    PriceLevel1View(viewModel: CourseViewModel(course: .DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
