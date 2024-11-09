//
//  BasicEconomyPage4.swift
//  EconomyStock
//
//  Created by 권형일 on 10/10/24.
//

import SwiftUI

struct BasicEconomy4View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var building = false
    
    @State private var bubble = false
    @State private var bubbleContent = false
    
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
                            
                            Text("GDP (국내총생산)")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .opacity(0.2)
                        .padding(.top)
                        
                        HStack {
                            VStack {
                                Text("소비지출")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                    .opacity(0.2)
                                
                                Text("C")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .opacity(0.2)
                            }
                            
                            Text("+")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .padding(.bottom, 10)
                                .opacity(0.2)
                            
                            VStack {
                                Text("투자지출")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.ESTitle)
                                
                                Text("I")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.ESTitle)
                            }
                            
                            Text("+")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .padding(.bottom, 10)
                                .opacity(0.2)
                            
                            VStack {
                                Text("정부지출")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                
                                Text("G")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                            }
                            .opacity(0.2)
                            
                            Text("+")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .padding(.bottom, 10)
                                .opacity(0.2)
                            
                            VStack {
                                Text("순수지출")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                
                                Text("(X-M)")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                            }
                            .opacity(0.2)
                        }
                        .padding(.top, 5)
                        
                        if progress.count >= 1 {
                            VStack(spacing: 10) {
                                HStack {
                                    Text("1) 소비 (Consumption)")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .padding(.leading, 30)
                                        .padding(.top, 5)
                                    
                                    Spacer()
                                }
                                (Text("투자")
                                    .foregroundStyle(Color(red:128/255, green:0/255, blue:128/255))
                                 + Text("는 주로 기업부문에서 이루어지며, 이자율과 반비례해요"))
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            }
                            .padding(.top)
                        }
                        
                        if progress.count >= 2 {
                            VStack {
                                HStack {
                                    if building {
                                        LottieViewConverter(fileName: "BasicEconomy4_Building", loopMode: .playOnce, toProgress: 0.5, width: 230, height: 230)
                                    }
                                    
                                    Image("TeachingSad_Toktok")
                                        .resizable()
                                        .frame(width: 75, height: 70)
                                        .padding(.top, 165)
                                        .scaleEffect(x: -1, y: 1, anchor: .center)
                                }
                                
                                if bubble {
                                    ZStack {
                                        LottieViewConverter(fileName: "Bubble", loopMode: .playOnce, scale: 3.0, width: 200, height: 200)
                                            .scaleEffect(x: -1, y: -1, anchor: .center)
                                            .padding(.top, 25)
                                        
                                        if bubbleContent {
                                            Text("금리가 너무 많이 올라\n돈을 빌리기가 어려워...\n진행하려던 프로젝트의 수익률도\n높은 편이 아니라서 프로젝트를\n진행할 바엔 은행에 저축해서\n이자를 받는게 낫겠네...")
                                                .font(.system(size: 13))
                                                .fontWeight(.semibold)
                                                .multilineTextAlignment(.center)
                                                .padding(.top, 35)
                                                .padding(.trailing, 5)
                                        }
                                    }
                                }
                            }
                        }
                        
                        if questionMark {
                            VStack {
                                HStack(spacing: 5) {
                                    LottieViewConverter(fileName: "QuestionMark", loopMode: .playOnce, scale: 2.0, width: 30, height: 30)
                                        .padding(.leading, 10)
                                    
                                    Text("투자란?")
                                        .font(.system(size: 15))
                                        .foregroundStyle(Color(red:128/255, green:0/255, blue:128/255))
                                        .fontWeight(.semibold)
                                    
                                    Spacer()
                                }
                                
                                if questionMarkContent {
                                    HStack(spacing: 5) {
                                        Text(":")
                                            .font(.system(size: 15))
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.black.opacity(0.6))
                                            .padding(.leading, 20)
                                            .padding(.bottom, 70)
                                        
                                        Text("경제화에서 투자란 기업이 사업을 시행하거나 토지, 건물, 기계 등을 구입하기 위해 지출하는 행위로, 시세차익을 얻기 위해 행하는 주식 투자의 개념과 달라요.")
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
                                withAnimation(.smooth(duration: 1.0)) {
                                    questionMarkContent.toggle()
                                    
                                    if questionMarkContent {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                            withAnimation(.smooth(duration: 0.1)) {
                                                proxy.scrollTo("bottom", anchor: .bottom)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        Rectangle()
                            .fill(.clear)
                            .frame(width: 300, height: 110)
                            .id("bottom")
                    }
                    
                    if nextButton {
                        VStack {
                            Spacer()
                            
                            ZStack {
                                Button {
                                    viewModel.currentPage += 1
                                    navigationRouter.navigate(.BasicEconomy5View(viewModel))
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
                    
                    if progress.count == 2 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.smooth(duration: 1.0)) {
                                building = true
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            withAnimation(.smooth(duration: 1.0)) {
                                bubble = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        bubbleContent = true
                                    }
                                }
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                            withAnimation(.smooth(duration: 1.0)) {
                                questionMark = true
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
                            withAnimation(.smooth(duration: 1.0)) {
                                nextButton = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        proxy.scrollTo("bottom", anchor: .top)
                                    }
                                }
                                
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
    BasicEconomy4View(viewModel: CourseViewModel(course: .DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
