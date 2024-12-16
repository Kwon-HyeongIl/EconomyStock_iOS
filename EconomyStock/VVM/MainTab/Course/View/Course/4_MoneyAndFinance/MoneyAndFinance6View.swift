//
//  MoneyAndFinance6View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/20/24.
//

import SwiftUI

struct MoneyAndFinance6View: View {
    @Environment(NavigationRouter.self) var navRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentImage = false
    
    @State private var nextButton = false
    @State private var beforeButton = false
    
    var body: some View {
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
                    .padding(.top)
                    
                    if progress.count >= 1 {
                        VStack {
                            Text("중앙은행은 화폐발행 및 통화량 조절을 위해 운영되는 은행을 말해요")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                                .padding(.top)
                            
                            if contentImage {
                                LottieView(fileName: "MoneyAndFinance6_Bank", loopMode: .playOnce, fromProgress: 0.35, scale: 1.2, width: 150, height: 150)
                                    .padding(.top)
                            }
                            
                            Spacer()
                        }
                    }
                    
                    if progress.count >= 2 {
                        (Text("우리나리의 중앙은행은 ")
                        + Text("한국은행")
                            .foregroundStyle(Color.ESTitle)
                            .fontWeight(.bold)
                        + Text("이며, 미국의 중앙은행은 연방준비제도(FED)라고 해요"))
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .padding(.top, 50)
                    }
                    
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
                                navRouter.navigate(.MoneyAndFinance7View(viewModel))
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
            withAnimation(.smooth(duration: 1.0)) {
                if progress.count < 3 {
                    progress.append(1)
                }
                
                if progress.count == 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation(.smooth(duration: 1.0)) {
                            contentImage = true
                        }
                    }
                }
                
                if progress.count == 2 {
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

#Preview {
    MoneyAndFinance6View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
