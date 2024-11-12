//
//  BasicEconomy7View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/8/24.
//

import SwiftUI

struct BasicEconomy7View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentPart1 = false
    @State private var contentPart2 = false
    
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
                            Text("정부지출을 위한 재원은 어떻게 조달될까요?")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .padding(.leading, 30)
                            
                            Spacer()
                        }
                        .padding(.top, 5)
                        .opacity(0.2)
                        
                        if progress.count >= 1 {
                            VStack {
                                HStack {
                                    Text("2) 국채발행")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .padding(.leading, 35)
                                    
                                    Spacer()
                                }
                                
                                if contentPart1 {
                                    Image("Bond")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150)
                                        .padding(.top)
                                    
                                    (Text("국채는 국가에서 발행하는 ")
                                    + Text("채권")
                                        .foregroundStyle(Color(red:128/255, green:0/255, blue:128/255))
                                    + Text("으로, 가장 많이 사용되는 방법이에요"))
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.top)
                                        .padding(.horizontal)
                                    
                                    if contentPart2 {
                                        Text("그러나 만기에 이자까지 더해서 갚아야하는 돈으로, 이를 갚기 위해 미래에 세금 징수가 증가할 수 있어요")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .padding(.top)
                                            .padding(.horizontal)
                                    }
                                }
                            }
                            .padding(.top)
                        }
                        
                        if questionMark {
                            VStack {
                                HStack(spacing: 5) {
                                    LottieViewConverter(fileName: "QuestionMark", loopMode: .playOnce, scale: 2.0, width: 30, height: 30)
                                        .padding(.leading, 10)
                                    
                                    Text("채권이란?")
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
                                            .padding(.bottom, 50)
                                        
                                        Text("정부나 회사, 지자체 등에서 자금을 마련하기 위해 발행하는 증권으로, 만기와 빌린 금액, 돈을 빌린 사람 등이 적혀있는 차용증서에요.")
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
                                            withAnimation(.smooth(duration: 0.1)) {
                                                proxy.scrollTo("bottom", anchor: .bottom)
                                            }
                                        }
                                    }
                                }
                            }
                            .padding(.top, 145)
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
                                    let view = UIView(frame: .zero)
                                    UIImpactFeedbackGenerator(style: .light, view: view).impactOccurred()
                                    
                                    viewModel.currentPage += 1
                                    navigationRouter.navigate(.BasicEconomy8View(viewModel))
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
                    if progress.count < 2 {
                        progress.append(1)
                    }
                    
                    if progress.count == 1 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.smooth(duration: 1.0)) {
                                contentPart1 = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentPart2 = true
                                    }
                                }
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            withAnimation(.smooth(duration: 1.0)) {
                                questionMark = true
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                            withAnimation(.smooth(duration: 1.0)) {
                                nextButton = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    withAnimation {
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
    BasicEconomy7View(viewModel: CourseViewModel(course: .DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
