//
//  UnEmployment5View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/16/24.
//

import SwiftUI

struct UnEmployment5View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentImage1_1 = false
    @State private var contentImage1_2 = false
    @State private var contentImage1_3 = false
    @State private var nextScrollPart = false
    @State private var contentText2_2 = false
    
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
                            
                            Text("임금")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .padding(.top)
                        
                        ZStack {
                            VStack {
                                if progress.count >= 1 {
                                    Text("임금은 노동의 대가를 의미해요")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                    .padding(.top)
                                }
                                
                                if contentImage1_1 {
                                    LottieView(fileName: "BasicEconomy10_Distribution", loopMode: .playOnce, width: 130, height: 130)
                                }
                                
                                if contentImage1_2 {
                                    HStack(spacing: 40) {
                                        LottieView(fileName: "ArrowRight", loopMode: .playOnce, toProgress: 0.5, scale: 1.4, width: 60, height: 60)
                                            .rotationEffect(.degrees(126))
                                        
                                        LottieView(fileName: "ArrowRight", loopMode: .playOnce, toProgress: 0.5, scale: 1.4, width: 60, height: 60)
                                            .rotationEffect(.degrees(52))
                                    }
                                }
                                
                                if contentImage1_3 {
                                    HStack(spacing: 70) {
                                        VStack {
                                            Image("Suit_Toktok")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 80)
                                            
                                            Text("근로자")
                                                .font(.system(size: 18))
                                                .fontWeight(.semibold)
                                                .foregroundStyle(Color.ESTitle)
                                                .padding(.top, 10)
                                        }
                                        .padding(.leading, 15)
                                        .padding(.top, 30)
                                        
                                        VStack {
                                            LottieView(fileName: "BasicEconomy4_Building", loopMode: .playOnce, toProgress: 0.5, width: 100, height: 100)
                                            
                                            Text("기업")
                                                .font(.system(size: 18))
                                                .fontWeight(.semibold)
                                                .foregroundStyle(Color.ESTitle)
                                                .padding(.top, 5)
                                        }
                                    }
                                }
                                
                                Spacer()
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 400)
                        }
                        
                        ZStack {
                            if nextScrollPart {
                                VStack {
                                    (Text("근로자")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("에게는 소득의 원천이 되어 소비지출이 늘어날 수 있게 하며,"))
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                    
                                    if contentText2_2 {
                                        (Text("기업")
                                            .foregroundStyle(Color.ESTitle)
                                            .fontWeight(.bold)
                                         + Text("에게는 생산비용으로 재화나 서비스의 가격에 영향을 미치게 되어요"))
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                        .padding(.top, 20)
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 200)
                        }
                        .padding(.top, 50)
                        
                        Rectangle()
                            .fill(.clear)
                            .frame(width: 100, height: 85)
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
                                    navigationRouter.navigate(.UnEmployment6View(viewModel))
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
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation(.smooth(duration: 1.0)) {
                                contentImage1_1 = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentImage1_2 = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                            withAnimation(.smooth(duration: 1.0)) {
                                                contentImage1_3 = true
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    if progress.count == 2 {
                        withAnimation {
                            proxy.scrollTo("bottom", anchor: .bottom)
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation(.smooth(duration: 1.0)) {
                                nextScrollPart = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentText2_2 = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            withAnimation(.smooth(duration: 1.0)) {
                                                nextButton = true
                                                
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
    UnEmployment5View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
