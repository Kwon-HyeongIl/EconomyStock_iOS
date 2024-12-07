//
//  BasicEconomy6View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/8/24.
//

import SwiftUI

struct BasicEconomy6View: View {
    @Environment(NavigationRouter.self) var navRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var image = false
    
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
                    
                    Text("정부지출을 위한 재원은 어떻게 조달될까요?")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.top, 5)
                    
                    if progress.count >= 1 {
                        VStack {
                            HStack {
                                Text("1)")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .padding(.leading, 35)
                                
                                Text("소득세/법인세 등의 조세 부과")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .padding(.top, 1)
                                
                                Spacer()
                            }
                            
                            if image {
                                ZStack {
                                    LottieView(fileName: "BasicEconomy6_MoneyStack", loopMode: .playOnce, scale: 1.2, width: 150, height: 150)
                                        .padding(.trailing, 150)
                                        .opacity(0.6)
                                    
                                    HStack {
                                        Image("Angry_Toktok")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80)
                                        
                                        ZStack {
                                            Image("Suit_Toktok")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 80)
                                                .scaleEffect(x: -1, y: 1, anchor: .center)
                                            
                                            LottieView(fileName: "Sweat", loopMode: .playOnce, toProgress: 0.5, width: 50, height: 50)
                                                .padding(.bottom, 70)
                                                .padding(.leading, 90)
                                        }
                                    }
                                    .padding(.leading, 50)
                                    .padding(.top, 40)
                                }
                                .padding(.top)
                            }
                        }
                        .padding(.top)
                    }
                    
                    if progress.count >= 2 {
                        HStack {
                            LottieView(fileName: "ArrowRight", loopMode: .playOnce, toProgress: 0.5, width: 80, height: 80)
                            
                            Text("저항이 심해요..!")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .padding(.trailing, 10)
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
                                navRouter.navigate(.BasicEconomy7View(viewModel))
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
                if progress.count < 3 {
                    progress.append(1)
                }
                
                if progress.count == 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation(.smooth(duration: 1.0)) {
                            image = true
                        }
                    }
                }
                
                if progress.count == 2 {
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
    BasicEconomy6View(viewModel: CourseViewModel(course: .DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
