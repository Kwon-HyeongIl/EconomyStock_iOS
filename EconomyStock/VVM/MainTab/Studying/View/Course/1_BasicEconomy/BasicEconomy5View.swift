//
//  BasicEconomyPage5.swift
//  EconomyStock
//
//  Created by 권형일 on 10/10/24.
//

import SwiftUI

struct BasicEconomy5View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var giveMoney = false
    
    @State private var bubble = false
    @State private var bubbleContent = false
    
    @State private var questionMark = false
    @State private var questionMarkContent = false
    
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
                            
                            Text("GDP (국내총생산)")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .opacity(0.2)
                        .padding(.top)
                        
                        if progress.count >= 1 {
                            VStack(spacing: 10) {
                                HStack {
                                    Text("2) 정부지출")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .padding(.leading, 30)
                                        .padding(.top, 5)
                                    
                                    Spacer()
                                }
                                
                                Text("정부가 상품과 서비스를 시장에서 구매하는 것으로 경제상황을 고려하여 구매에 대한 의사결정을 내려요")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                        }
                        
                        if progress.count >= 2 {
                            VStack {
                                LottieViewConverter(fileName: "BasicEconomy1_GovernmentBuilding", loopMode: .playOnce, width: 200, height: 200)
                                    .padding(.trailing, 100)
                                
                                if bubble {
                                    ZStack {
                                        LottieViewConverter(fileName: "Bubble", loopMode: .playOnce, scale: 2.7, width: 150, height: 150)
                                            .scaleEffect(x: 1, y: -1, anchor: .center)
                                        
                                        if bubbleContent {
                                            Text("이번 달 예산은...")
                                                .font(.system(size: 18))
                                                .fontWeight(.semibold)
                                                .padding(.leading, 10)
                                                .padding(.top)
                                        }
                                    }
                                    .padding(.leading, 100)
                                }
                            }
                        }
                        
                        if progress.count >= 3 {
                            VStack {
                                (Text("정부지출은 정부가 지출하는 모든 것을 포함하지만, ")
                                 + Text("재난지원금, 실업수당 ")
                                    .foregroundStyle(Color.ESTitle)
                                 + Text("등은 포함하지 않아요"))
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            }
                            .padding(.top, 50)
                        }
                        
                        if progress.count >= 4 {
                            VStack {
                                HStack {
                                    Image("Suit_Toktok")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80)
                                    
                                    if giveMoney {
                                        VStack(spacing: 0) {
                                            LottieViewConverter(fileName: "BasicEconomy5_Money", loopMode: .playOnce, toProgress: 0.6, scale: 1.5, width: 100, height: 50)
                                            
                                            LottieViewConverter(fileName: "ArrowRight", loopMode: .playOnce, toProgress: 0.5, scale: 1.2, width: 100, height: 50)
                                                .padding(.leading, 10)
                                        }
                                        .padding(.horizontal)
                                        .padding(.bottom)
                                    }
                                    
                                    Image("Front_Toktok")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80)
                                }
                                
                                (Text("재난지원금, 실업수당 처럼 정부가 대가 없이 국민에게 지급하기 위해 행해지는 것을 ")
                                 + Text("이전지출")
                                    .foregroundStyle(Color(red:128/255, green:0/255, blue:128/255))
                                 + Text("이라고 해요"))
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                                .padding(.top)
                            }
                            .padding(.top, 50)
                        }
                        
                        if questionMark {
                            VStack {
                                HStack(spacing: 5) {
                                    LottieViewConverter(fileName: "QuestionMark", loopMode: .playOnce, scale: 2.0, width: 30, height: 30)
                                        .padding(.leading, 10)
                                    
                                    Text("이전지출이란?")
                                        .font(.system(size: 15))
                                        .foregroundStyle(Color(red:128/255, green:0/255, blue:128/255))
                                        .fontWeight(.semibold)
                                    
                                    Spacer()
                                }
                                
                                if questionMarkContent {
                                    HStack(spacing: 5) {
                                        Text(":")
                                            .font(.system(size: 15))
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.black.opacity(0.6))
                                            .padding(.leading, 20)
                                            .padding(.bottom, 33)
                                        
                                        Text("단순히 소득의 이전이며, 어떠한 부가가치도 창출하지 않으므로 정부지출에 포함되지 않아요.")
                                            .font(.system(size: 15))
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.black.opacity(0.6))
                                            .padding(.bottom, 10)
                                        
                                        Spacer()
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .background(.purple.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(.horizontal)
                            .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                            .padding(.top, 30)
                            .onTapGesture {
                                withAnimation(.smooth(duration: 1.0)) {
                                    questionMarkContent.toggle()
                                    
                                    if questionMarkContent {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                            withAnimation(.smooth(duration: 0.1)) {
                                                proxy.scrollTo("bottom", anchor: .bottom)
                                            }
                                        }
                                    }
                                }
                            }
                            .padding(.top, 30)
                        }
                        
                        Rectangle()
                            .fill(.clear)
                            .frame(width: 300, height: 110)
                            .id("bottom")
                    }
                    
                    if nextButton {
                        VStack {
                            Spacer()
                            
                            ZStack {
                                Button {
                                    viewModel.currentPage += 1
                                    navigationRouter.navigate(.BasicEconomy6View(viewModel))
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
                    if progress.count < 5 {
                        progress.append(1)
                    }
                    
                    if progress.count == 2 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
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
                    
                    if progress.count == 4 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.smooth(duration: 1.0)) {
                                giveMoney = true
                                
                                proxy.scrollTo("bottom", anchor: .top)
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            withAnimation(.smooth(duration: 1.0)) {
                                questionMark = true
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                            withAnimation(.smooth(duration: 1.0)) {
                                nextButton = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        proxy.scrollTo("bottom", anchor: .top)
                                    }
                                }
                                
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

#Preview {
    BasicEconomy5View(viewModel: CourseViewModel(course: .DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
