//
//  MoneyAndFinance5View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/20/24.
//

import SwiftUI

struct MoneyAndFinance5View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentText1_2 = false
    @State private var contentImage1_1 = false
    @State private var contentImage1_2 = false
    
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
                            
                            Text("통화 지표")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .padding(.top)
                        
                        ZStack {
                            if progress.count >= 1 {
                                VStack {
                                    Text("통화지표는 어디까지 통화량에 포함시킬 것인가에 따라 다양하게 측정되어요")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                        .padding(.top)
                                    
                                    if contentText1_2 {
                                        (Text("대표적으로 ")
                                        + Text("M1")
                                            .foregroundStyle(Color(red:128/255, green:0/255, blue:128/255))
                                            .fontWeight(.bold)
                                        + Text("과 ")
                                        + Text("M2")
                                            .foregroundStyle(Color(red:128/255, green:0/255, blue:128/255))
                                            .fontWeight(.bold)
                                        + Text("가 있는데, M2가 M1보다 더 넓은 범위의 화폐로 구성되어 있어요"))
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal, 30)
                                        .padding(.top, 35)
                                        .padding(.bottom, 25)
                                    }
                                    
                                    if contentImage1_1 {
                                        ZStack {
                                            if contentImage1_2 {
                                                ZStack {
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .foregroundStyle(.brown.opacity(0.4))
                                                        .frame(width: 250, height: 190)
                                                    
                                                    Text("각종 금융상품")
                                                        .font(.system(size: 18))
                                                        .fontWeight(.semibold)
                                                        .padding(.bottom, 120)
                                                    
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .frame(width: 50, height: 30)
                                                        .foregroundStyle(.brown.opacity(0.5))
                                                        .overlay {
                                                            Text("M2")
                                                                .font(.system(size: 20))
                                                                .fontWeight(.semibold)
                                                        }
                                                        .padding(.bottom, 190)
                                                }
                                            }
                                            
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 20)
                                                    .foregroundStyle(.orange.opacity(0.25))
                                                    .frame(width: 150, height: 80)
                                                
                                                Text("현금, 요구불예금")
                                                    .font(.system(size: 18))
                                                    .fontWeight(.semibold)
                                                
                                                RoundedRectangle(cornerRadius: 20)
                                                    .frame(width: 50, height: 30)
                                                    .foregroundStyle(.orange.opacity(0.5))
                                                    .overlay {
                                                        Text("M1")
                                                            .font(.system(size: 20))
                                                            .fontWeight(.semibold)
                                                    }
                                                    .padding(.bottom, 80)
                                            }
                                            .padding(.top, 50)
                                        }
                                    }
                                    
                                    Spacer()
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
                                        
                                        Text("M1, M2란?")
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
                                                .padding(.bottom, 120)
                                            
                                            Text("M1은 빠르게 현금화할 수 있는 화폐로 구성된 통화지표로, 시중에 유통되는 현금 또는 원하면 즉시 인출이 가능한 예금인 요구불예금 등으로 구성되어요\n\nM2는 M1보다 넓은 의미의 통화지표로, M1보다 현금화가 다소 어려운 화폐들로 구성되어 있어요.")
                                                .font(.system(size: 15))
                                                .fontWeight(.semibold)
                                                .foregroundStyle(.black.opacity(0.6))
                                                .frame(height: 135)
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
                                .frame(width: 100, height: questionMarkContent ? 200 : 100)
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
                                    navigationRouter.navigate(.MoneyAndFinance6View(viewModel))
                                } label: {
                                    LottieView(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.0, width: 100, height: 100)
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
                    if progress.count < 3 {
                        progress.append(1)
                    }
                    
                    if progress.count == 1 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.smooth(duration: 1.0)) {
                                contentText1_2 = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentImage1_1 = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            withAnimation(.smooth(duration: 1.0)) {
                                                contentImage1_2 = true
                                                
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                                    withAnimation(.smooth(duration: 1.0)) {
                                                        proxy.scrollTo("bottom", anchor: .top)
                                                        
                                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                                            withAnimation(.smooth(duration: 1.0)) {
                                                                questionMark = true
                                                                
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
                    }
                }
            }
        }
    }
}

#Preview {
    MoneyAndFinance5View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
