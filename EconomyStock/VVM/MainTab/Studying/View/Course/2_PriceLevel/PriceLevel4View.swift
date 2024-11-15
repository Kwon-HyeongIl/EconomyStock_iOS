//
//  Price4View.swift
//  EconomyStock
//
//  Created by 권형일 on 10/11/24.
//

import SwiftUI

struct PriceLevel4View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentImage1 = false
    @State private var nextScrollPart = false
    @State private var contentText2 = false
    @State private var contentImage2 = false
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
                            Text("인플레이션")
                                .font(.system(size: 22))
                                .fontWeight(.semibold)
                                .padding(.leading, 30)
                            
                            Spacer()
                        }
                        .padding(.top, 5)
                        
                        ZStack {
                            if progress.count >= 1 {
                                VStack {
                                    Text("인플레이션이란 물가가 지속적으로 상승하는 현상을 의미해요")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                    
                                    if contentImage1 {
                                        LottieViewConverter(fileName: "PriceLevel4_PriceUp", loopMode: .playOnce, scale: 1.2, width: 150, height: 150)
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 300)
                        }
                        .padding(.top)
                        
                        ZStack {
                            if nextScrollPart {
                                VStack {
                                    Text("인플레이션은 크게 두 가지로 나뉘어요")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                    
                                    if contentText2 {
                                        HStack {
                                            Text("1)")
                                                .font(.system(size: 20))
                                                .fontWeight(.semibold)
                                            
                                            (Text("경기가 과열")
                                                .foregroundStyle(Color(red:128/255, green:0/255, blue:128/255))
                                                .fontWeight(.bold)
                                            + Text("되었을 때 발생하는 경우"))
                                                .font(.system(size: 20))
                                                .fontWeight(.semibold)
                                                .padding(.top, 2)
                                            
                                            Spacer()
                                        }
                                        .padding(.top, 20)
                                        .padding(.leading, 30)
                                        
                                        if contentImage2 {
                                            LottieViewConverter(fileName: "PriceLevel4_HotEconomy", loopMode: .playOnce, speed: 0.5, width: 150, height: 150)
                                        }
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 300)
                        }
                        
                        ZStack {
                            if progress.count >= 3 {
                                VStack {
                                    HStack {
                                        Text("2)")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                        
                                        Text("원자재 가격 또는 임금의 상승 등 기업의 생산비가 증가하여 발생하는 경우")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .padding(.top, 23)
                                        
                                        Spacer()
                                    }
                                    .padding(.leading, 30)
                                    
                                    if contentImage3 {
                                        LottieViewConverter(fileName: "PriceLevel4_OilPrice", loopMode: .playOnce, width: 150, height: 150)
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 250)
                        }
                        .id("middle")
                        
                        ZStack {
                            if questionMark {
                                VStack {
                                    HStack(spacing: 5) {
                                        LottieViewConverter(fileName: "QuestionMark", loopMode: .playOnce, scale: 2.0, width: 30, height: 30)
                                            .padding(.leading, 10)
                                        
                                        Text("경기 과열이란?")
                                            .font(.system(size: 15))
                                            .foregroundStyle(Color(red:128/255, green:0/255, blue:128/255))
                                            .fontWeight(.semibold)
                                        
                                        Spacer()
                                    }
                                    .padding(.top, questionMarkContent ? 5 : 0)
                                    
                                    if questionMarkContent {
                                        HStack(spacing: 5) {
                                            Text(":")
                                                .font(.system(size: 15))
                                                .fontWeight(.semibold)
                                                .foregroundStyle(.black.opacity(0.6))
                                                .padding(.leading, 20)
                                                .padding(.bottom, 68)
                                            
                                            Text("경기 과열은 경제 내에서 생산이 적정 수준보다 과다하게 이루어지는 현상을 말해요. 이 때 실업률이 하락하고, 국민 소득이 증가하거나 물가가 크게 상승하는 특징이 있어요.")
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
                                    navigationRouter.navigate(.PriceLevel5View(viewModel))
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
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation(.smooth(duration: 1.0)) {
                                contentImage1 = true
                            }
                        }
                    }
                    
                    if progress.count == 2 {
                        withAnimation {
                            proxy.scrollTo("middle", anchor: .bottom)
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation(.smooth(duration: 1.0)) {
                                nextScrollPart = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentText2 = true
                                        
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
                    
                    if progress.count == 3 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.smooth(duration: 1.0)) {
                                contentImage3 = true
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                            withAnimation {
                                proxy.scrollTo("bottom", anchor: .top)
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                            withAnimation(.smooth(duration: 1.0)) {
                                questionMark = true
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
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

#Preview {
    PriceLevel4View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
