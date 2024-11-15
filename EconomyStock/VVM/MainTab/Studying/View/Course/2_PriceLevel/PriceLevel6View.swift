//
//  PriceLevel6View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/15/24.
//

import SwiftUI

struct PriceLevel6View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentText1_2 = false
    @State private var contentImage = false
    @State private var nextScrollPart = false
    
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
                            
                            Text("물가의 변동")
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
                        
                        ZStack {
                            if progress.count >= 1 {
                                VStack {
                                    (Text("스태그 플레이션이란 ")
                                     + Text("물가 상승")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("과")
                                     + Text("경기 침체")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("가 공존하는 비정상적인 상황을 의미해요"))
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                    
                                    
                                    if contentText1_2 {
                                        Text("일반적으로는 물가 상승과 경기 과열이 함께 발생하며, 물가의 하락과 경기 침체가 함께 발생해요")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal)
                                            .padding(.top, 30)
                                    }
                                    
                                    if contentImage {
                                        HStack {
                                            LottieViewConverter(fileName: "PriceLevel4_PriceUp", loopMode: .playOnce, scale: 1.1, width: 150, height: 150)
                                            
                                            Text("+")
                                                .font(.system(size: 40))
                                                .fontWeight(.bold)
                                                .foregroundStyle(Color.ESTitle)
                                                .padding(.trailing, 12)
                                            
                                            ZStack {
                                                LottieViewConverter(fileName: "BasicEconomy4_Building", loopMode: .playOnce, toProgress: 0.5, width: 120, height: 120)
                                                
                                                LottieViewConverter(fileName: "PriceLevel3_Rain", loopMode: .playOnce, speed: 0.7, width: 100, height: 100)
                                                    .padding(.bottom, 110)
                                            }
                                        }
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 400)
                        }
                        .padding(.top, 20)
                        
                        ZStack {
                            if nextScrollPart {
                                Text("스태그 플레이션은 인플레이션 또는 디플레이션과 달리 예측이 어렵고, 대처가 쉽지 않다는 특징이 있어요")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 200)
                        }
                        .padding(.top, 30)
                        
                        Rectangle()
                            .fill(.clear)
                            .frame(width: 100, height: 70)
                            .id("bottom")
                    }
                    
                    if nextButton {
                        VStack {
                            Spacer()
                            
                            ZStack {
                                Button {
                                    let view = UIView(frame: .zero)
                                    UIImpactFeedbackGenerator(style: .light, view: view).impactOccurred()
                                    
                                    viewModel.currentPage += 1
                                    navigationRouter.navigate(.PriceLevel7View(viewModel))
                                } label: {
                                    LottieViewConverter(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.0, width: 100, height: 100)
                                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
                                }
                                
                                if beforeButton {
                                    HStack {
                                        Button {
                                            viewModel.currentPage -= 1
                                            navigationRouter.back()
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
                    if progress.count < 4 {
                        progress.append(1)
                    }
                    
                    if progress.count == 1 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.smooth(duration: 1.0)) {
                                contentText1_2 = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentImage = true
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
                                nextScrollPart = true
                                
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

#Preview {
    PriceLevel6View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
