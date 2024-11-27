//
//  MoneyAndFinance9View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/20/24.
//

import SwiftUI

struct MoneyAndFinance9View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentText2_1 = false
    @State private var contentText2_2 = false
    @State private var contentImage1_1 = false
    @State private var contentImage1_2 = false
    @State private var contentImage1_3 = false
    @State private var nextScrollPart1 = false
    @State private var contentText3_2 = false
    @State private var contentImage2 = false
    @State private var nextScrollPart2 = false
    @State private var contentText4_2 = false
    @State private var contentImage3 = false
    @State private var nextScrollPart3 = false
    @State private var contentText5_2 = false
    @State private var contentImage4 = false
    
    @State private var nextButton = false
    @State private var beforeButton = false
    
    @Namespace private var animation
    
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                ZStack {
                    ScrollView {
                        HStack {
                            Text("4.")
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                                .foregroundStyle(Color.ESTitle)
                                .padding(.leading, 30)
                                .padding(.bottom, 3)
                            
                            Text("화폐의 공급")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .opacity(0.2)
                        .padding(.top)
                        
                        ZStack {
                                if progress.count >= 1 {
                                    VStack {
                                        Text("중앙은행의 화폐 공급은 다음과 같은 경로로 이루어져요")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal)
                                            .padding(.top)
                                        
                                        if contentText2_1 {
                                            HStack {
                                                Text("1)")
                                                    .font(.system(size: 20))
                                                    .fontWeight(.semibold)
                                                    .padding(.bottom, 3)
                                                
                                                Text("정부를 통한 공급")
                                                    .font(.system(size: 20))
                                                    .fontWeight(.semibold)
                                            }
                                            .padding(.top, 30)
                                        }
                                        
                                        if contentText2_2 {
                                            Text("중앙은행이 정부에 대한 예금 또는 대출 업무를 수행하는 방법")
                                                .font(.system(size: 20))
                                                .fontWeight(.semibold)
                                                .multilineTextAlignment(.center)
                                                .padding(.horizontal, 20)
                                                .padding(.top, 10)
                                        }
                                        
                                        if contentImage1_1 {
                                            ZStack {
                                                if contentImage1_2 {
                                                    Image("GovernmentBuilding")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 80)
                                                        .matchedGeometryEffect(id: "animation", in: animation)
                                                    
                                                } else if contentImage1_3 {
                                                    VStack {
                                                        Spacer()
                                                        
                                                        HStack {
                                                            Spacer()
                                                            
                                                            Image("GovernmentBuilding")
                                                                .resizable()
                                                                .scaledToFit()
                                                                .frame(width: 80)
                                                                .matchedGeometryEffect(id: "animation", in: animation)
                                                        }
                                                        .frame(width: 160)
                                                    }
                                                    .frame(height: 150)
                                                }
                                                
                                                LottieView(fileName: "MoneyAndFinance9_BankWith", loopMode: .playOnce, fromProgress: 0.35, scale: 1.5, width: 150, height: 150)
                                                    .padding(.top, 20)
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 400)
                        }
                        
                        ZStack {
                            if nextScrollPart1 {
                                VStack {
                                    HStack {
                                        Text("2)")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .padding(.bottom, 3)
                                        
                                        Text("시중은행을 통한 공급")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                    }
                                    .padding(.top, 50)
                                    
                                    if contentText3_2 {
                                        Text("중앙은행이 시중은행에 대한 예금과 대출업무를 수행하는 방법")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal, 20)
                                            .padding(.top, 10)
                                    }
                                    
                                    if contentImage2 {
                                        LottieView(fileName: "MoneyAndFinance9_BankWithBank", loopMode: .playOnce, fromProgress: 0.4, scale: 1.5, width: 150, height: 150)
                                            .padding(.top, 20)
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 400)
                                .id("front")
                        }
                        
                        ZStack {
                            if nextScrollPart2 {
                                VStack {
                                    HStack {
                                        Text("3)")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .padding(.bottom, 3)
                                        
                                        Text("해외 시장을 통한 공급")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                    }
                                    .padding(.top, 10)
                                    
                                    if contentText4_2 {
                                        Text("수출 증가로 인해 외화가 국내에 유입되고, 이것이 원화로 환전되는 경우")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal, 20)
                                            .padding(.top, 10)
                                    }
                                    
                                    if contentImage3 {
                                        LottieView(fileName: "MoneyAndFinance9_GlobalMoney", loopMode: .playOnce, fromProgress: 0.2, scale: 1.4, width: 150, height: 150)
                                            .padding(.top, 20)
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 350)
                                .id("middle")
                        }
                        
                        ZStack {
                            if nextScrollPart3 {
                                VStack {
                                    HStack {
                                        Text("4)")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .padding(.bottom, 3)
                                        
                                        Text("기타자산변동")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                    }
                                    
                                    if contentText5_2 {
                                        Text("중앙은행이 건물, 시설, 비품 등을 구입하는 경우")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.center)
                                            .padding(.horizontal, 20)
                                            .padding(.top, 10)
                                    }
                                    
                                    if contentImage4 {
                                        LottieView(fileName: "MoneyAndFinance9_BankProduct", loopMode: .playOnce, fromProgress: 0.6, scale: 1.4, width: 150, height: 150)
                                            .padding(.top, 20)
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 350)
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
                                    navigationRouter.navigate(.MoneyAndFinance10View(viewModel))
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
                    
                    if progress.count == 1 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.smooth(duration: 1.0)) {
                                contentText2_1 = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentText2_2 = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            withAnimation(.smooth(duration: 1.0)) {
                                                contentImage1_1 = true
                                                
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                                    withAnimation(.smooth(duration: 1.0)) {
                                                        contentImage1_2 = true
                                                        
                                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                                            withAnimation(.smooth(duration: 1.0)) {
                                                                contentImage1_2 = false
                                                                contentImage1_3 = true
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
                    
                    if progress.count == 2 {
                        withAnimation {
                            proxy.scrollTo("front", anchor: .bottom)
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
                    
                    if progress.count == 3 {
                        withAnimation {
                            proxy.scrollTo("middle", anchor: .bottom)
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation(.smooth(duration: 1.0)) {
                                nextScrollPart2 = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentText4_2 = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            withAnimation(.smooth(duration: 1.0)) {
                                                contentImage3 = true
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
                                nextScrollPart3 = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentText5_2 = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            withAnimation(.smooth(duration: 1.0)) {
                                                contentImage4 = true
                                                
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
            }
        }
    }
}

#Preview {
    MoneyAndFinance9View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
