//
//  PriceLevel9View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/15/24.
//

import SwiftUI

struct PriceLevel9View: View {
    @Environment(NavigationRouter.self) var navRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentText1 = false
    @State private var contentImage = false
    
    @State private var nextButton = false
    @State private var beforeButton = false
    
    var body: some View {
        VStack {
            ZStack {
                ScrollView {
                    HStack {
                        Text("3.")
                            .font(.system(size: 35))
                            .fontWeight(.bold)
                            .foregroundStyle(Color.ESTitle)
                            .padding(.leading, 30)
                            .padding(.bottom, 3)
                        
                        Text("물가 측정 지표")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .opacity(0.2)
                    .padding(.top)
                    
                    HStack {
                        Text("스태그 플레이션")
                            .font(.system(size: 22))
                            .fontWeight(.semibold)
                            .padding(.leading, 30)
                        
                        Spacer()
                    }
                    .padding(.top, 5)
                    
                    if progress.count >= 1 {
                        VStack {
                            HStack {
                                Text("3)")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .padding(.leading, 35)
                                
                                Text("GDP 디플레이터")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .padding(.top, 1)
                                
                                Spacer()
                            }
                            
                            if contentText1 {
                                Text("GDP 디플레이터는 국가 경제의 전반적인 물가 수준을 나타내는 물가 지수를 말해요")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                    .padding(.top, 5)
                            }
                            
                            if contentImage {
                                LottieView(fileName: "PriceLevel9_GDP", loopMode: .playOnce, width: 150, height: 150)
                            }
                            
                            Spacer()
                        }
                    }
                    
                    if progress.count >= 2 {
                        Text("소비, 투자 수출입 등과 관련된 모든 재화와 서비스의 가격 수준을 나타내요")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .padding(.top, 70)
                    }
                }
                
                if nextButton {
                    VStack {
                        Spacer()
                        
                        ZStack {
                            Button {
                                let view = UIView(frame: .zero)
                                UIImpactFeedbackGenerator(style: .light, view: view).impactOccurred()
                                
                                viewModel.currentPage += 1
                                navRouter.navigate(.PriceLevel10View(viewModel))
                            } label: {
                                LottieView(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.0, width: 100, height: 100)
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
                
                if progress.count == 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation(.smooth(duration: 1.0)) {
                            contentText1 = true
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                withAnimation(.smooth(duration: 1.0)) {
                                    contentImage = true
                                }
                            }
                        }
                    }
                }
                
                if progress.count == 2 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation(.smooth(duration: 1.0)) {
                            nextButton = true
                            
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

#Preview {
    PriceLevel9View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
