//
//  MoneyAndFinance2View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/20/24.
//

import SwiftUI

struct MoneyAndFinance2View: View {
    @Environment(NavigationRouter.self) var navigationRouter
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
                        Text("2.")
                            .font(.system(size: 35))
                            .fontWeight(.bold)
                            .foregroundStyle(Color.ESTitle)
                            .padding(.leading, 30)
                            .padding(.bottom, 3)
                        
                        Text("통화")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding(.top)

                    if progress.count >= 1 {
                        VStack {
                            Text("통화량이란 한 경제 내에서 유통되는 화폐의 양을 의미해요")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                                .padding(.top)
                         
                            if contentImage {
                                LottieViewConverter(fileName: "MoneyAndFinance2_MoneyReport", loopMode: .playOnce, scale: 1.2, width: 150, height: 150)
                            }
                            
                            Spacer()
                        }
                    }
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
                
                if progress.count == 3 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation(.smooth(duration: 1.0)) {
                            
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
    MoneyAndFinance2View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
