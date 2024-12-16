//
//  ExchangeRateAndBalanceOfPayment10View.swift
//  EconomyStock
//
//  Created by 권형일 on 12/1/24.
//

import SwiftUI

struct ExchangeRateAndBalanceOfPayment10View: View {
    @Environment(NavigationRouter.self) var navRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentText1_2 = false
    @State private var contentImage = false
    @State private var nextScrollpart = false
    @State private var contentText2_2 = false
    
    @State private var nextButton = false
    @State private var beforeButton = false
    
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
                                .padding(.bottom, 3)
                            
                            Text("국제수지")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .opacity(0.2)
                        .padding(.top)
                        
                        ZStack {
                            if progress.count >= 1 {
                                VStack {
                                    Text("이러한 이유로 우리나라의 기준금리는 미국의 기준금리와 움직임을 함께하는 경향이 있어요")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                        .padding(.top)
                                    
                                    if contentText1_2 {
                                        (Text("미국이 기준금리를 인상하여 우리나라의 금리보다 훨씬 높은 수준이 된다면 ")
                                         + Text("자본이 유츌")
                                            .foregroundStyle(Color.ESTitle)
                                            .fontWeight(.bold)
                                         + Text("될 위험에 놓이고, ")
                                         + Text("달러가치가 높아")
                                            .foregroundStyle(Color.ESTitle)
                                            .fontWeight(.bold)
                                         + Text("지며 ")
                                         + Text("환율이 상승")
                                            .foregroundStyle(Color.ESTitle)
                                            .fontWeight(.bold)
                                         + Text("하게 될 위험이 있기 때문이에요"))
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                        .padding(.top, 30)
                                    }
                                    
                                    if contentImage {
                                        LottieView(fileName: "ExchangeRateAndBalanceOfPayment10_Union", loopMode: .playOnce, fromProgress: 0.2, scale: 1.1, width: 180, height: 180)
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 400)
                        }
                        
//                        ZStack {
//                            if nextScrollpart {
//                                VStack {
//                                    
//                                    
//                                    Spacer()
//                                }
//                            }
//                            
//                            Rectangle()
//                                .fill(.clear)
//                                .frame(width: 100, height: 300)
//                        }
//                        
//                        Rectangle()
//                            .fill(.clear)
//                            .frame(width: 100, height: 85)
//                            .id("bottom")
                    }
                    .scrollIndicators(.never)
                    
                    if nextButton {
                        VStack {
                            Spacer()
                            
                            ZStack {
                                Button {
                                    let view = UIView(frame: .zero)
                                    UIImpactFeedbackGenerator(style: .light, view: view).impactOccurred()
                                    
                                    viewModel.currentPage += 1
                                    navRouter.navigate(.ExchangeRateAndBalanceOfPayment11View(viewModel))
                                } label: {
                                    LottieView(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.0, width: 100, height: 100)
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
                withAnimation(.smooth(duration: 1.0)) {
                    if progress.count < 3 {
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
                                                nextButton = true
                                                
//                                                proxy.scrollTo("bottom", anchor: .top)
                                                
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
        }
    }
}

#Preview {
    ExchangeRateAndBalanceOfPayment10View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
