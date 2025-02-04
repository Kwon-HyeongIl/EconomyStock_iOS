//
//  ExchangeRateAndBalanceOfPayment1View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/30/24.
//

import SwiftUI
import PopupView

struct ExchangeRateAndBalanceOfPayment1View: View {
    @Environment(NavigationRouter.self) var navRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentImage = false
    @State private var nextScrollPart = false
    @State private var contentText2_2 = false
    
    @State private var nextButton = false
    
    @State private var popup = false
    
    @Namespace private var animation
    
    var body: some View {
        ScrollViewReader { proxy in
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
                            
                            Text("환율의 개념")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .padding(.top)
                        
                        ZStack {
                            if progress.count >= 1 {
                                VStack {
                                    Text("환율이란 자국 통화와 외국통화가 교환되는 비율을 의미해요")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                        .padding(.top)
                                    
                                    if contentImage {
                                        LottieView(fileName: "ExchangeRateAndBalanceOfPayment1_MoneyExchange", loopMode: .playOnce, fromProgress: 0.4, scale: 1.3, width: 180, height: 180)
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
                                    Text("우리나리에서는 주로 원달러 환율을 주로 사용하며, 1$ = 1,400원과 같은 방식으로 표기해요")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                        .padding(.top)
                                    
                                    if contentText2_2 {
                                        Text("이는 달러가 1,400원과 같은 가치를 가진다는 것으로, 1달러를 얻기 위해서는 1,400원을 지불해야한다는 것을 의미해요")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal)
                                            .padding(.top, 30)
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 280)
                        }
                        
                        Rectangle()
                            .fill(.clear)
                            .frame(width: 100, height: 85)
                            .id("bottom")
                    }
                    .scrollIndicators(.never)
                    
                    if nextButton {
                        VStack {
                            Spacer()
                            
                            Button {
                                let view = UIView(frame: .zero)
                                UIImpactFeedbackGenerator(style: .light, view: view).impactOccurred()
                                
                                viewModel.currentPage += 1
                                navRouter.navigate(.ExchangeRateAndBalanceOfPayment2View(viewModel))
                            } label: {
                                LottieView(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.0, width: 100, height: 100)
                                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                            }
                        }
                    }
                }
            }
            .modifier(CourseToolbarModifier(viewModel: viewModel, currentPage: viewModel.currentPage, totalPage: viewModel.course.totalPage))
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation {
                    if progress.count < 3 {
                        progress.append(1)
                    }
                    
                    if progress.count == 1 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation {
                                contentImage = true
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
            .onAppear {
                popup = true
            }
            .popup(isPresented: $popup) {
                HStack {
                    (Text("진행하시려면 화면을 ")
                    + Text("터치 ")
                        .foregroundStyle(Color.ESTitle)
                    + Text("해주세요"))
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                }
                .frame(width: 300, height: 80)
                .background(.ultraThickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
                .padding(.bottom, 50)
            } customize: {
                $0
                    .type(.toast)
                    .closeOnTap(true)
                    .closeOnTapOutside(true)
            }
        }
    }
}

#Preview {
    ExchangeRateAndBalanceOfPayment1View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListCapsule())
}
