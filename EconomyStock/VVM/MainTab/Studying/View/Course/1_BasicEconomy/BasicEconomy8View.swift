//
//  BasicEconomy8View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/8/24.
//

import SwiftUI

struct BasicEconomy8View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentPart1 = false
    @State private var contentPart2 = false
    
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
                                Text("3)")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .padding(.leading, 35)
                                
                                Text("화폐발행")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .padding(.top, 1)
                                
                                Spacer()
                            }
                            
                            if contentPart1 {
                                LottieViewConverter(fileName: "BasicEconomy8_MoneyPublish", loopMode: .playOnce, scale: 1.3, width: 150, height: 150)
                                
                                Text("화폐를 발행하여 자금을 조달하는 것은 가장 쉬운 방법이지만, 경제에 유통되는 화폐의 양이 많아지면 물가가 크게 상승해요")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                    .padding(.top)
                            }
                            
                            if contentPart2 {
                                Text("따라서, 거의 사용되지 않는 방법이에요")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                    .padding(.top, 20)
                            }
                        }
                        .padding(.top)
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
                                navigationRouter.navigate(.BasicEconomy9View(viewModel))
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
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
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
    BasicEconomy8View(viewModel: CourseViewModel(course: .DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
