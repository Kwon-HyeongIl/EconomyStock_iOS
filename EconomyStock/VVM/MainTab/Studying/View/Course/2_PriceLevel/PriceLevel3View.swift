//
//  Price3View.swift
//  EconomyStock
//
//  Created by 권형일 on 10/11/24.
//

import SwiftUI

struct PriceLevel3View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentText1_2 = false
    @State private var contentImage1 = false
    @State private var contentText2 = false
    @State private var nextScrollPart = false
    @State private var contentImage2 = false
    
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
                        .opacity(0.2)
                        .padding(.top)
                        
                        ZStack {
                            if progress.count >= 1 {
                                VStack {
                                    Text("물가 안정이라고 함은 물가가 과도하게 상승하거나, 과도하게 하락하는 것을 막는 것을 의미해요")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                    
                                    if contentText1_2 {
                                        Text("보통 우리는 물가 상승을 더 많이 경험하기 때문에 물가 상승을 부정적으로, 물가 하락을 긍정적으로 보는 경향이 있어요")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal)
                                            .padding(.top, 50)
                                        
                                        if contentImage1 {
                                            ZStack {
                                                HStack {
                                                    VStack(spacing: 0) {
                                                        LottieViewConverter(fileName: "PriceLevel3_BubbleHeart", loopMode: .playOnce, scale: 2.0, width: 40, height: 40)
                                                            .scaleEffect(x: -1, y: 1, anchor: .center)
                                                            .padding(.leading, 60)
                                                        
                                                        Image("Run1_Toktok")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 70)
                                                    }
                                                    
                                                    LottieViewConverter(fileName: "PriceLevel3_PriceDown", loopMode: .playOnce, scale: 1.3, width: 150, height: 150)
                                                }
                                                .opacity(progress.count >= 2 ? 0.4 : 1.0)
                                                
                                                if progress.count >= 2 {
                                                    LottieViewConverter(fileName: "Warning", loopMode: .playOnce, scale: 1.3, width: 120, height: 120)
                                                }
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
                        
                        ZStack {
                            if progress.count >= 2 {
                                (Text("그러나 이것은 ")
                                 + Text("틀린 생각")
                                    .foregroundStyle(Color.ESTitle)
                                    .fontWeight(.bold)
                                 + Text("이에요"))
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 100)
                        }
                        
                        ZStack {
                            if nextScrollPart {
                                VStack {
                                    (Text("적정 수준의 물가 상승은 경제 성장을 촉진할 수 있지만, 물가가 하락한다는 것은 ")
                                    + Text("경기 침체의 ")
                                        .foregroundStyle(Color(red:128/255, green:0/255, blue:128/255))
                                        .fontWeight(.bold)
                                    + Text("대표적인 현상 중 하나이기 때문이에요"))
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                        .padding(.bottom)
                                    
                                    if contentImage2 {
                                        ZStack {
                                            LottieViewConverter(fileName: "BasicEconomy4_Building", loopMode: .playOnce, toProgress: 0.5, scale: 1.1, width: 150, height: 150)
                                            
                                            LottieViewConverter(fileName: "PriceLevel3_Rain", loopMode: .playOnce, speed: 0.7, width: 140, height: 140)
                                                .padding(.bottom, 130)
                                        }
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 400)
                        }
                        .padding(.top, 50)
                        
                        ZStack {
                            if questionMark {
                                VStack {
                                    HStack(spacing: 5) {
                                        LottieViewConverter(fileName: "QuestionMark", loopMode: .playOnce, scale: 2.0, width: 30, height: 30)
                                            .padding(.leading, 10)
                                        
                                        Text("경기 침체란?")
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
                                                .padding(.bottom, 68)
                                            
                                            Text("경기 침체는 경제 내에서 생산이 적정 수준보다 과소하게 이루어지는 현상을 말해요, 이 때 실업률이 상승하고, 국민 소득이 감소하며 물가가 크게 하락하는 특징이 있어요.")
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
                                    navigationRouter.navigate(.PriceLevel4View(viewModel))
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
                                        contentImage1 = true
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
                            withAnimation(.smooth(duration: 1.0)) {
                                nextScrollPart = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentImage2 = true
                                    }
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        questionMark = true
                                    }
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
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
    PriceLevel3View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
