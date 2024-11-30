//
//  MoneyAndFinance18View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/20/24.
//

import SwiftUI

struct MoneyAndFinance18View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentText2_2 = false
    @State private var contentImage1 = false
    @State private var nextScrollPart1 = false
    @State private var contentText3_2 = false
    @State private var contentImage2 = false
    @State private var nextScrollPart2 = false
    
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
                                Text("기준금리의 인상 또는 인하는 어떤 기준으로 결정될까요?")
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
                            if progress.count >= 2 {
                                VStack {
                                    Text("앞에서 이자율은 돈의 가치이며, 화폐가치는 물가와 반비례한다고 배웠던 것을 기억하시나요?")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                    
                                    if contentText2_2 {
                                        (Text("다시 말해, 기준금리의 인상은 화폐의 가치를 상승시키는 것이며, 화폐 가치의 상승은 ")
                                         + Text("물가가 하락")
                                            .foregroundStyle(Color.ESTitle)
                                            .fontWeight(.bold)
                                         + Text("하는 것을 의미해요"))
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                        .padding(.top, 25)
                                    }
                                    
                                    if contentImage1 {
                                        LottieView(fileName: "MoneyAndFinance18_PriceDown", loopMode: .playOnce, width: 180, height: 180)
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 450)
                        }
                        
                        ZStack {
                            if nextScrollPart1 {
                                VStack {
                                    Text("즉, 중앙은행은 인플레이션을 억제하고자 할 때 기준금리를 인상해요")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                    
                                    if contentText3_2 {
                                        (Text("하지만, 기준금리의 인상은 소비와 투자 등을 감소시키며 ")
                                        + Text("경기를 악화")
                                            .foregroundStyle(Color.ESTitle)
                                            .fontWeight(.bold)
                                        + Text("시켜요"))
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal)
                                            .padding(.top, 25)
                                    }
                                    
                                    if contentImage2 {
                                        LottieView(fileName: "PriceLevel3_BadEconomy", loopMode: .playOnce, width: 180, height: 180)
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 400)
                                .id("middle")
                        }
                        
                        ZStack {
                            if nextScrollPart2 {
                                (Text("따라서, ")
                                + Text("물가가 어느정도 안정되면 기준금리를 다시 인하")
                                    .foregroundStyle(Color.ESTitle)
                                    .fontWeight(.bold)
                                + Text("시켜요"))
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 150)
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
                                    navigationRouter.navigate(.MoneyAndFinance19View(viewModel))
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
                    if progress.count < 5 {
                        progress.append(1)
                    }
                    
                    if progress.count == 2 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.smooth(duration: 1.0)) {
                                contentText2_2 = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentImage1 = true
                                    }
                                }
                            }
                        }
                    }
                    
                    if progress.count == 3 {
                        withAnimation {
                            proxy.scrollTo("middle", anchor: .bottom)
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation(.smooth(duration: 1.0)) {
                                nextScrollPart1 = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentText3_2 = true
                                        
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
                    
                    if progress.count == 4 {
                        withAnimation {
                            proxy.scrollTo("bottom", anchor: .top)
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation(.smooth(duration: 1.0)) {
                                nextScrollPart2 = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
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
    }
}

#Preview {
    MoneyAndFinance18View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
