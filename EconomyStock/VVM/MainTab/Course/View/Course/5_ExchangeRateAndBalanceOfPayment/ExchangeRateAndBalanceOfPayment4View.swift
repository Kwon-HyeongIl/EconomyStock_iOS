//
//  ExchangeRateAndBalanceOfPayment4View.swift
//  EconomyStock
//
//  Created by 권형일 on 12/1/24.
//

import SwiftUI

struct ExchangeRateAndBalanceOfPayment4View: View {
    @Environment(NavigationRouter.self) var navRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentText1_2 = false
    @State private var contentText1_3 = false
    @State private var contentImage = false
    @State private var bubble = false
    @State private var bubbleContent = false
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
                            Text("2.")
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                                .foregroundStyle(Color.ESTitle)
                                .padding(.leading, 30)
                                .padding(.bottom, 3)
                            
                            Text("환율변동의 효과")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .opacity(0.2)
                        .padding(.top)
                        
                        HStack {
                            Text("1)")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .padding(.bottom, 3)
                            
                            Text("환율의 상승")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                        }
                        .opacity(0.2)
                        .padding(.top)
                        
                        ZStack {
                            if progress.count >= 1 {
                                VStack {
                                    Text("반면, 국내 수입업자가 미국에서 1$짜리 바나나를 수입해온다면 어떨까요?")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                        .padding(.top)
                                    
                                    if contentText1_2 {
                                        Text("이전에는 1000원에 수입했던 바나나를 2000원에 수입해와야하는 상황이 생겨요")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal)
                                            .padding(.top, 30)
                                    }
                                    
                                    if contentText1_3 {
                                        Text("따라서, 수입업자는 바나나의 수입을 줄이게돼요")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal)
                                            .padding(.top, 30)
                                    }
                                    
                                    if contentImage {
                                        HStack {
                                            Image("KoreaSad_Toktok")
                                                .resizable()
                                                .frame(width: 95, height: 70)
                                                .padding(.top, 100)
                                                .padding(.leading)
                                            
                                            if bubble {
                                                ZStack {
                                                    LottieView(fileName: "Bubble", loopMode: .playOnce, scale: 5.8, width: 50, height: 50)
                                                    
                                                    if bubbleContent {
                                                        Text("2,000원은\n비싸,,")
                                                            .font(.system(size: 15))
                                                            .fontWeight(.semibold)
                                                            .multilineTextAlignment(.center)
                                                            .padding(.leading, 10)
                                                            .padding(.bottom, 3)
                                                    }
                                                }
                                                .padding(.bottom, 60)
                                            }
                                            
                                            VStack {
                                                LottieView(fileName: "ExchangeRateAndBalanceOfPayment4_Banana", loopMode: .playOnce, scale: 1.3, width: 100, height: 100)
                                                    .padding(.top, 80)
                                                
                                                Text("2,000₩")
                                                    .font(.system(size: 20))
                                                    .fontWeight(.semibold)
                                                    .foregroundStyle(.red)
                                            }
                                            .padding(.trailing)
                                        }
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 550)
                        }
                        
                        ZStack {
                            if nextScrollpart {
                                VStack {
                                    (Text("즉, 환율이 상승하면 수출은 증가하고 수입은 감소하게 되어 ")
                                    + Text("순수출이 증가")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                    + Text("해요"))
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 150)
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
                            
                            ZStack {
                                Button {
                                    let view = UIView(frame: .zero)
                                    UIImpactFeedbackGenerator(style: .light, view: view).impactOccurred()
                                    
                                    viewModel.currentPage += 1
                                    navRouter.navigate(.ExchangeRateAndBalanceOfPayment5View(viewModel))
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
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentText1_3 = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            withAnimation(.smooth(duration: 1.0)) {
                                                contentImage = true
                                                
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                                    withAnimation(.smooth(duration: 1.0)) {
                                                        bubble = true
                                                        
                                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                            withAnimation(.smooth(duration: 1.0)) {
                                                                bubbleContent = true
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
                    
                    if progress.count == 2 {
                        withAnimation {
                            proxy.scrollTo("bottom", anchor: .top)
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation(.smooth(duration: 1.0)) {
                                nextScrollpart = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentText2_2 = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            withAnimation(.smooth(duration: 1.0)) {
                                                nextButton = true
                                                
                                                proxy.scrollTo("bottom", anchor: .top)
                                                
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
    ExchangeRateAndBalanceOfPayment4View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
