//
//  BasicEconomyPage5.swift
//  EconomyStock
//
//  Created by 권형일 on 10/10/24.
//

import SwiftUI

struct BasicEconomy5View: View {
    @Environment(NavigationRouter.self) var navRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var giveMoney = false
    @State private var nextScrollPart = false
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
                        
                        HStack {
                            VStack(spacing: 5) {
                                Text("소비지출")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                    .opacity(0.2)
                                
                                Text("C")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .opacity(0.2)
                            }
                            
                            Text("+")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .padding(.bottom, 10)
                                .opacity(0.2)
                            
                            VStack(spacing: 5) {
                                Text("투자지출")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                
                                Text("I")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                            }
                            .opacity(0.2)
                            
                            Text("+")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .padding(.bottom, 10)
                                .opacity(0.2)
                            
                            VStack(spacing: 5) {
                                Text("정부지출")
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color.ESTitle)
                                
                                Text("G")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color.ESTitle)
                            }
                            
                            Text("+")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .padding(.bottom, 10)
                                .opacity(0.2)
                            
                            VStack(spacing: 5) {
                                Text("순수지출")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                
                                Text("(X-M)")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                            }
                            .opacity(0.2)
                        }
                        .padding(.top, 5)
                        
                        ZStack {
                            if progress.count >= 1 {
                                VStack(spacing: 10) {
                                    HStack {
                                        Text("3)")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .padding(.leading, 30)
                                        
                                        Text("정부지출")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .padding(.top, 2)
                                        
                                        Spacer()
                                    }
                                    
                                    Text("정부가 상품과 서비스를 시장에서 구매하는 것으로 경제상황을 고려하여 구매에 대한 의사결정을 내려요")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                        .padding(.top, 10)
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 170)
                        }
                        
                        ZStack {
                            if progress.count >= 2 {
                                VStack {
                                    LottieView(fileName: "BasicEconomy1_GovernmentBuilding", loopMode: .playOnce, width: 150, height: 150)
                                        .padding(.trailing, 100)
                                    
                                    if bubble {
                                        ZStack {
                                            LottieView(fileName: "Bubble", loopMode: .playOnce, scale: 2.7, width: 150, height: 150)
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
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 300)
                        }
                        
                        ZStack {
                            if nextScrollPart {
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
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 150)
                        }
                        .padding(.top, 50)
                        
                        ZStack {
                            if progress.count >= 4 {
                                VStack {
                                    HStack {
                                        Image("Suit_Toktok")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80)
                                        
                                        if giveMoney {
                                            VStack(spacing: 0) {
                                                LottieView(fileName: "MoneyAndFinance1_Money", loopMode: .playOnce, toProgress: 0.6, scale: 1.5, width: 70, height: 70)
                                                
                                                LottieView(fileName: "ArrowRight", loopMode: .playOnce, toProgress: 0.5, scale: 1.2, width: 100, height: 50)
                                                    .padding(.leading, 10)
                                            }
                                            .padding(.bottom, 50)
                                        }
                                        
                                        Image("Front_Toktok")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80)
                                    }
                                    
                                    (Text("재난지원금, 실업수당 처럼 정부가 대가 없이 국민에게 지급하기 위해 행해지는 것을 ")
                                     + Text("이전지출")
                                        .foregroundStyle(Color(red:128/255, green:0/255, blue:128/255))
                                        .fontWeight(.bold)
                                     + Text("이라고 해요"))
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                    .padding(.top)
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 250)
                        }
                        .padding(.top, 30)
                        
                        ZStack {
                            if questionMark {
                                VStack(spacing: 0) {
                                    HStack(spacing: 5) {
                                        LottieView(fileName: "QuestionMark", loopMode: .playOnce, scale: 2.0, width: 30, height: 30)
                                            .padding(.leading, 10)
                                            .padding(.top, questionMarkContent ? 5 : 0)
                                        
                                        Text("이전지출은 정부지출에 포함될까요?")
                                            .font(.system(size: 15))
                                            .foregroundStyle(Color(red:128/255, green:0/255, blue:128/255))
                                            .fontWeight(.semibold)
                                            .padding(.vertical, questionMarkContent ? 0 : 5)
                                            .padding(.top, questionMarkContent ? 5 : 0)
                                        
                                        Spacer()
                                    }
                                    
                                    if questionMarkContent {
                                        HStack(spacing: 5) {
                                            Text(":")
                                                .font(.system(size: 15))
                                                .fontWeight(.semibold)
                                                .foregroundStyle(.black.opacity(0.6))
                                                .padding(.leading, 20)
                                                .padding(.bottom, 51)
                                            
                                            Text("이전지출은 단순히 소득의 이전이며, 어떠한 부가가치도 창출하지 않으므로 정부지출에 포함되지 않아요.")
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
                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                .padding(.top, 30)
                                .onTapGesture {
                                    withAnimation(.smooth(duration: 0.7)) {
                                        questionMarkContent.toggle()
                                        
                                        if questionMarkContent {
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                                withAnimation {
                                                    proxy.scrollTo("bottom", anchor: .bottom)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 100)
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
                                    navRouter.navigate(.BasicEconomy6View(viewModel))
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
                withAnimation {
                    if progress.count < 5 {
                        progress.append(1)
                    }
                    
                    if progress.count == 2 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            withAnimation {
                                bubble = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation {
                                        bubbleContent = true
                                    }
                                }
                            }
                        }
                    }
                    
                    if progress.count == 3 {
                        withAnimation {
                            proxy.scrollTo("bottom", anchor: .top)
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation {
                                nextScrollPart = true
                            }
                        }
                    }
                        
                    
                    if progress.count == 4 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation {
                                giveMoney = true
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            withAnimation {
                                questionMark = true
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                            withAnimation {
                                nextButton = true
                                
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
    }
}

#Preview {
    BasicEconomy5View(viewModel: CourseViewModel(course: .DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListCapsule())
}
