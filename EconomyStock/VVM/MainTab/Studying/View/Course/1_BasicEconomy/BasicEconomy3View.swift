//
//  BasicEconomyPage3.swift
//  EconomyStock
//
//  Created by 권형일 on 10/10/24.
//

import SwiftUI

struct BasicEconomy3View: View {
    @Environment(NavigationRouter.self) var navRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
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
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color.ESTitle)
                                
                                Text("C")
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
                                    .fontWeight(.semibold)
                                
                                Text("G")
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
                                        Text("1)")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .padding(.leading, 30)
                                        
                                        Text("소비 (Consumption)")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .padding(.top, 2)
                                        
                                        Spacer()
                                    }
                                    
                                    (Text("주로 가계에서 이루어지며, 소득에 비례하고 ")
                                     + Text("이자율")
                                        .foregroundStyle(Color(red:128/255, green:0/255, blue:128/255))
                                        .fontWeight(.bold)
                                     + Text("에 반비례해요"))
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                    .padding(.top, 10)
                                }
                                .padding(.top)
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 130)
                        }
                        
                        ZStack {
                            if nextScrollPart {
                                VStack {
                                    HStack {
                                        Image("Basic_Toktok")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80)
                                            .padding(.top, 130)
                                        
                                        if bubble {
                                            ZStack {
                                                LottieView(fileName: "Bubble", loopMode: .playOnce, scale: 2.5, width: 180, height: 140)
                                                
                                                if bubbleContent {
                                                    Text("월급이 올랐으니\n자동차를 사야지!")
                                                        .font(.system(size: 13))
                                                        .fontWeight(.semibold)
                                                        .padding(.leading, 5)
                                                        .padding(.bottom, 8)
                                                }
                                            }
                                        }
                                    }
                                    
                                    HStack {
                                        if bubble {
                                            ZStack {
                                                LottieView(fileName: "Bubble", loopMode: .playOnce, scale: 2.5, width: 180, height: 140)
                                                    .scaleEffect(x: -1, y: 1, anchor: .center)
                                                
                                                if bubbleContent {
                                                    Text("예금 이자율이\n올랐네. 이번달은\n저축을 좀 해야겠어.")
                                                        .font(.system(size: 13))
                                                        .fontWeight(.semibold)
                                                        .padding(.bottom, 14)
                                                        .padding(.leading, 2)
                                                }
                                            }
                                        }
                                        
                                        Image("Sad_Toktok")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80)
                                            .padding(.top, 130)
                                    }
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 450)
                        }
                        
                        ZStack {
                            if questionMark {
                                VStack(spacing: 0) {
                                    HStack(spacing: 5) {
                                        LottieView(fileName: "QuestionMark", loopMode: .playOnce, scale: 2.0, width: 30, height: 30)
                                            .padding(.leading, 10)
                                            .padding(.top, questionMarkContent ? 5 : 0)
                                        
                                        Text("이자율이란?")
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
                                                .padding(.bottom, 50)
                                            
                                            Text("이자율의 정의는 돈을 빌린 대가이지만, 돈의 가격이라고 생각하면 편해요. 또한, 이자율은 금리와 같은 의미를 가져요.")
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
                                .padding(.top, 23)
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 100)
                        }
                        
                        Rectangle()
                            .fill(.clear)
                            .frame(width: 300, height: 100)
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
                                    navRouter.navigate(.BasicEconomy4View(viewModel))
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
                    
                    if progress.count == 2 {
                        withAnimation {
                            proxy.scrollTo("bottom", anchor: .top)
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation(.smooth(duration: 1.0)) {
                                nextScrollPart = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
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
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                withAnimation(.smooth(duration: 1.0)) {
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        withAnimation(.smooth(duration: 1.0)) {
                                            questionMark = true
                                        }
                                    }
                                }
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
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

#Preview {
    BasicEconomy3View(viewModel: CourseViewModel(course: .DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
