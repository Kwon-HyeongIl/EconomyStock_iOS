//
//  MoneyAndFinance7View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/20/24.
//

import SwiftUI

struct MoneyAndFinance7View: View {
    @Environment(NavigationRouter.self) var navRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentText2_2 = false
    @State private var contentImage1 = false
    @State private var nextScrollPart1 = false
    @State private var contentText3_2 = false
    @State private var contentImage2 = false
    @State private var nextScrollPart2 = false
    @State private var contentText4_2 = false
    @State private var contentImage3 = false
    
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
                            Text("3.")
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                                .foregroundStyle(Color.ESTitle)
                                .padding(.leading, 30)
                                .padding(.bottom, 3)
                            
                            Text("중앙은행의 역할")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .opacity(0.2)
                        .padding(.top)
                        
                        ZStack {
                            if progress.count >= 1 {
                                Text("중앙은행이 하는 일은 무엇이 있을까요?")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 50)
                        }
                        
                        ZStack {
                            if progress.count >= 2 {
                                VStack {
                                    HStack {
                                        Text("1)")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .padding(.bottom, 3)
                                        
                                        Text("화폐 발행 및 통화정책 집행")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                    }
                                    .padding(.top)
                                    
                                    if contentText2_2 {
                                        Text("중앙은행은 화폐를 발행하거나 통화정책을 통해 이자율과 통화량을 조절하는 역할을 수행해요")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal, 20)
                                            .padding(.top, 10)
                                    }
                                    
                                    if contentImage1 {
                                        LottieView(fileName: "MoneyAndFinance7_MoneyControl", loopMode: .playOnce, scale: 1.3, width: 150, height: 150)
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 300)
                        }
                        
                        ZStack {
                            if nextScrollPart1 {
                                VStack {
                                    HStack {
                                        Text("2)")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .padding(.bottom, 26)
                                        
                                        Text("시중은행과 정부를 대상으로 각종 은행 업무 수행")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                    }
                                    .padding(.top, 70)
                                    
                                    if contentText3_2 {
                                        Text("우리가 시중은행에서 예금 또는 대출 업무를 수행하듯이, 시중은행과 정부는 중앙은행에서 예금 또는 대출 업무를 수행해요")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal, 25)
                                            .padding(.top, 10)
                                    }
                                    
                                    if contentImage2 {
                                        LottieView(fileName: "MoneyAndFinance7_ATM", loopMode: .playOnce, scale: 1.2, width: 160, height: 160)
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 500)
                                .id("middle")
                        }
                        
                        ZStack {
                            if nextScrollPart2 {
                                VStack {
                                    HStack {
                                        Text("3)")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .padding(.bottom, 3)
                                        
                                        Text("외환 관리 담당")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                    }
                                    
                                    if contentText4_2 {
                                        (Text("중앙은행은 환율을 안정화시키고, ")
                                        + Text("국제수지 ")
                                            .foregroundStyle(Color(red:128/255, green:0/255, blue:128/255))
                                            .fontWeight(.bold)
                                        + Text("불균형을 조절하는 역할을 수행해요"))
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal, 20)
                                            .padding(.top, 10)
                                    }
                                    
                                    if contentImage3 {
                                        LottieView(fileName: "MoneyAndFinance7_MoneyBalance", loopMode: .playOnce, scale: 1.2, width: 150, height: 150)
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 250)
                        }
                        
                        ZStack {
                            if questionMark {
                                VStack(spacing: 0) {
                                    HStack(spacing: 5) {
                                        LottieView(fileName: "QuestionMark", loopMode: .playOnce, scale: 2.0, width: 30, height: 30)
                                            .padding(.leading, 10)
                                            .padding(.top, questionMarkContent ? 5 : 0)
                                        
                                        Text("국제수지란?")
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
                                                .padding(.bottom, 68)
                                            
                                            Text("국제수지는 경상수지와 자본수지의 합으로, 경상수지란 재화나 서비스의 수출입에서 우리나라의 이익을, 자본수지는 자본의 수출입에서 우리나라의 이익을 의미한다고 생각하면 편해요.")
                                                .font(.system(size: 15))
                                                .fontWeight(.semibold)
                                                .foregroundStyle(.black.opacity(0.6))
                                                .frame(height: 75)
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
                            .frame(width: 100, height: 73)
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
                                    navRouter.navigate(.MoneyAndFinance8View(viewModel))
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
                    if progress.count < 5 {
                        progress.append(1)
                    }
                    
                    if progress.count == 2 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.smooth(duration: 1.0)) {
                                contentText2_2 = true
                                
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
                            proxy.scrollTo("middle", anchor: .bottom)
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation(.smooth(duration: 1.0)) {
                                nextScrollPart1 = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentText3_2 = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            withAnimation(.smooth(duration: 1.0)) {
                                                contentImage2 = true
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    if progress.count == 4 {
                        withAnimation {
                            proxy.scrollTo("bottom", anchor: .top)
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation(.smooth(duration: 1.0)) {
                                nextScrollPart2 = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentText4_2 = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            withAnimation(.smooth(duration: 1.0)) {
                                                contentImage3 = true
                                                
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
                    
                    if progress.count == 5 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.smooth(duration: 1.0)) {
                                
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        
                                        
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
    MoneyAndFinance7View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
