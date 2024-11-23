//
//  MoneyAndFinance12View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/20/24.
//

import SwiftUI

struct MoneyAndFinance12View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentText1_2 = false
    @State private var contentImage = false
    
    @State private var nextButton = false
    @State private var beforeButton = false
    
    var body: some View {
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
                    .padding(.top)
                    
                    ZStack {
                        if progress.count >= 1 {
                            VStack {
                                VStack(spacing: 5) {
                                    Text("실업률")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                    
                                    Text("경제활동인구 중 실업자가 차지하는 비율을 말해요")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                }
                                
                                Text("(생산가능인구가 아니에요!)")
                                    .font(.system(size: 17))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(Color.ESTitle)
                                    .padding(.horizontal)
                                    .padding(.top, 5)
                                
                                if contentText1_2 {
                                    VStack(spacing: 5) {
                                        Text("고용률")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal)
                                            .foregroundStyle(Color.ESTitle)
                                            .fontWeight(.bold)
                                        
                                        Text("생산가능인구 중 취업자가 차지하는 비율을 말해요")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal)
                                    }
                                    .padding(.top, 20)
                                    
                                    Text("(경제활동인구가 아니에요!)")
                                        .font(.system(size: 17))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .foregroundStyle(Color.ESTitle)
                                        .padding(.horizontal)
                                        .padding(.top, 5)
                                }
                                
                                if contentImage {
                                    LottieView(fileName: "UnEmployment2_Suit", loopMode: .playOnce, width: 180, height: 180)
                                }
                                
                                Spacer()
                            }
                        }
                        
                        Rectangle()
                            .fill(.clear)
                            .frame(width: 100, height: 500)
                    }
                    
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
                                navigationRouter.navigate(.UnEmployment3View(viewModel))
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
                                    contentImage = true
                                    
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

#Preview {
    MoneyAndFinance12View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
