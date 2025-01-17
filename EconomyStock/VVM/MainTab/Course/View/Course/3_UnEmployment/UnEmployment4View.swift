//
//  UnEmployment4View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/16/24.
//

import SwiftUI

struct UnEmployment4View: View {
    @Environment(NavigationRouter.self) var navRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentText1_2 = false
    @State private var contentImage = false
    @State private var imageAndBubble = false
    @State private var bubbleContent = false
    
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
                            
                            Text("고용 지표")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .opacity(0.2)
                        .padding(.top)
                        
                        ZStack {
                            VStack {
                                if progress.count >= 1 {
                                    (Text("고용은 ")
                                     + Text("소비를 좌우")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("하기 때문에 실업률과 고용률 등의 고용지표가 정말 중요해요"))
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                    .padding(.top)
                                    
                                    if contentText1_2 {
                                        Text("경제 내의 실업이 감소하게 되어 일을 하는 사람들이 많아진다면 사람들의 소비가 증가하게 되겠죠?")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal)
                                            .padding(.top, 30)
                                    }
                                    
                                    if contentImage {
                                        ZStack {
                                            HStack {
                                                LottieView(fileName: "UnEmployment4_Factory", loopMode: .playOnce, width: 140, height: 140)
                                                    .padding(.bottom, 150)
                                                
                                                Spacer()
                                                
                                                LottieView(fileName: "UnEmployment4_Store", loopMode: .playOnce, width: 140, height: 140)
                                                    .padding(.top, 170)
                                            }
                                            
                                            if imageAndBubble {
                                                ZStack {
                                                    LottieView(fileName: "UnEmployment4_Road", loopMode: .playOnce, fromProgress: 0.0, toProgress: 0.0, width: 130, height: 130)
                                                        .rotationEffect(.degrees(-10.0))
                                                        .padding(.trailing, 60)
                                                        .padding(.top, 95)
                                                    
                                                    HStack {
                                                        Image("Run1_Toktok")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 60)
                                                            .padding(.top, 80)
                                                            .padding(.leading, 50)
                                                        
                                                        ZStack {
                                                            LottieView(fileName: "Bubble", loopMode: .playOnce, scale: 3.2, width: 100, height: 100)
                                                                .padding(.bottom, 70)
                                                            
                                                            if bubbleContent {
                                                                Text("퇴근 했으니까\n쇼핑하러 가야지~")
                                                                    .font(.system(size: 13))
                                                                    .fontWeight(.semibold)
                                                                    .padding(.bottom, 78)
                                                                    .padding(.leading, 10)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                Spacer()
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 580)
                        }
                        
                        Rectangle()
                            .fill(.clear)
                            .frame(width: 100, height: 70)
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
                                    navRouter.navigate(.UnEmployment5View(viewModel))
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
                    if progress.count < 3 {
                        progress.append(1)
                    }
                    
                    if progress.count == 1 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation {
                                contentText1_2 = true
                                
                                withAnimation {
                                    proxy.scrollTo("bottom", anchor: .top)
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    withAnimation {
                                        contentImage = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            withAnimation {
                                                imageAndBubble = true
                                                
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                    withAnimation {
                                                        bubbleContent = true
                                                        
                                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                                            withAnimation {
                                                                nextButton = true
                                                                
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
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    UnEmployment4View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListCapsule())
}
