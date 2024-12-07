//
//  MoneyAndFinance13View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/20/24.
//

import SwiftUI

struct MoneyAndFinance13View: View {
    @Environment(NavigationRouter.self) var navRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var nextScrollPart = false
    @State private var contentText2_2 = false
    @State private var contentImage = false
    @State private var bubble = false
    @State private var bubbleContent = false
    
    @State private var nextButton = false
    @State private var beforeButton = false
    
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                ZStack {
                    ScrollView {
                        HStack {
                            Text("5.")
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                                .foregroundStyle(Color.ESTitle)
                                .padding(.leading, 30)
                                .padding(.bottom, 3)
                            
                            Text("중앙은행의 통화정책 수단")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .opacity(0.2)
                        .padding(.top)
                        
                        ZStack {
                            if progress.count >= 1 {
                                VStack {
                                    Text("1~3번의 정책들은 통화량을 변화시키는 방법으로, 특히 2, 3번의 경우 시중은행을 통해 통화량을 변화시키는 방법이에요")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                        .padding(.top)
                                    
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 120)
                        }
                        
                        ZStack {
                            if progress.count >= 2 {
                                Text("중앙은행이 시중은행에 통화를 공급하게 되면 시중은행은 대출여력이 증가하게 되며 대출을 증가시켜요")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 100)
                        }
                        
                        ZStack {
                            if nextScrollPart {
                                VStack {
                                    (Text("따라서, 종전보다 신용도가 낮은 개인과 기업들 대출을 받을 수 있게 되며, 그 결과 경제 내의 ")
                                     + Text("소비와 투자가 증가")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("할 수 있게 돼요"))
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                    .padding(.top, 25)
                                    
                                    if contentImage {
                                        ZStack {
                                            LottieView(fileName: "MoneyAndFinance13_BankMoney", loopMode: .playOnce, fromProgress: 0.35, scale: 2.0, width: 150, height: 150)
                                                .padding(.bottom, 120)
                                            
                                            HStack(spacing: 0) {
                                                Image("Crying_Toktok")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 80)
                                                    .padding(.top, 30)
                                                
                                                if bubble {
                                                    ZStack {
                                                        LottieView(fileName: "Bubble", loopMode: .playOnce, scale: 3.5, width: 100, height: 100)
                                                            .scaleEffect(x: 1, y: -1, anchor: .center)
                                                        
                                                        if bubbleContent {
                                                            Text("대출 받을 수\n있게 되어\n다행이야,,")
                                                                .font(.system(size: 15))
                                                                .fontWeight(.semibold)
                                                                .padding(.leading, 8)
                                                                .padding(.top, 5)
                                                        }
                                                    }
                                                    .padding(.trailing, 80)
                                                    .padding(.top, 260)
                                                }
                                            }
                                        }
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 570)
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
                                    navRouter.navigate(.MoneyAndFinance14View(viewModel))
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
                    if progress.count < 4 {
                        progress.append(1)
                    }
                    
                    if progress.count == 3 {
                        withAnimation {
                            proxy.scrollTo("bottom", anchor: .top)
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation(.smooth(duration: 1.0)) {
                                nextScrollPart = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentImage = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            withAnimation(.smooth(duration: 1.0)) {
                                                bubble = true
                                                
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                    withAnimation(.smooth(duration: 1.0)) {
                                                        bubbleContent = true
                                                        
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
            }
        }
    }
}

#Preview {
    MoneyAndFinance13View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
