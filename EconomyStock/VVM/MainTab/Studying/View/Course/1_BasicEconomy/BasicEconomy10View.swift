//
//  BasicEconomy10View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/7/24.
//

import SwiftUI

struct BasicEconomy10View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentPart1_1 = false
    @State private var contentPart2 = false
    @State private var contentPart2_1 = false
    @State private var contentPart2_2 = false
    
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
                        
                        Text("아까 앞에서")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .padding(.top)
                        
                        HStack {
                            VStack {
                                Text("소비지출")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                
                                Text("C")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.ESTitle)
                            }
                            
                            Text("+")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .padding(.bottom, 10)
                            
                            VStack {
                                Text("투자지출")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                
                                Text("I")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.ESTitle)
                            }
                            
                            Text("+")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .padding(.bottom, 10)
                            
                            VStack {
                                Text("정부지출")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                
                                Text("G")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.ESTitle)
                            }
                            
                            Text("+")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .padding(.bottom, 10)
                            
                            VStack {
                                Text("순수지출")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                
                                Text("(X-M)")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.ESTitle)
                            }
                        }
                        .padding(.top, 10)
                        
                        (Text("즉, ")
                         + Text("생산과 지출이 같아")
                            .foregroundStyle(Color(red:128/255, green:0/255, blue:128/255))
                            .fontWeight(.bold)
                         + Text("진다고 했어요"))
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.top, 10)
                        
                        ZStack {
                            if progress.count >= 1 {
                                VStack {
                                    Text("그 이유는 가장 이상적인 경제 상태에서 생산된 몫은 생산에 도움을 준 사람들에게 소득으로 분배되기 때문이에요 ")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                    
                                    if contentPart1_1 {
                                        LottieViewConverter(fileName: "BasicEconomy10_MoneyDistribution", loopMode: .playOnce, scale: 1.2, width: 150, height: 150)
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 100)
                        }
                        .padding(.top, 60)
                        
                        ZStack {
                            if contentPart2 {
                                VStack {
                                    Text("또한, 사람들은 이렇게 해서 얻은 소득을 모두 지출해요. 이를 통해 생산과 지출이 같아져요")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                    
                                    if contentPart2_1 {
                                        ZStack {
                                            VStack {
                                                VStack(spacing: 0) {
                                                    LottieViewConverter(fileName: "BasicEconomy10_Distribution", loopMode: .playOnce, width: 110, height: 110)
                                                    
                                                    Text("분배")
                                                        .font(.system(size: 15))
                                                        .fontWeight(.semibold)
                                                        .foregroundStyle(Color.ESTitle)
                                                }
                                                
                                                HStack {
                                                    VStack(spacing: 0) {
                                                        LottieViewConverter(fileName: "BasicEconomy10_Factory", loopMode: .playOnce, width: 110, height: 110)
                                                            .padding(.leading, 30)
                                                        
                                                        Text("생산")
                                                            .font(.system(size: 15))
                                                            .fontWeight(.semibold)
                                                            .foregroundStyle(Color.ESTitle)
                                                    }
                                                    
                                                    Spacer()
                                                    
                                                    VStack(spacing: 0) {
                                                        LottieViewConverter(fileName: "BasicEconomy10_Payment", loopMode: .playOnce, toProgress: 0.745, width: 110, height: 110)
                                                            .padding(.trailing, 30)
                                                        
                                                        Text("지출")
                                                            .font(.system(size: 15))
                                                            .fontWeight(.semibold)
                                                            .foregroundStyle(Color.ESTitle)
                                                    }
                                                }
                                                .padding(.top, 40)
                                            }
                                            
                                            if contentPart2_2 {
                                                VStack {
                                                    HStack(spacing: 60) {
                                                        Image(systemName: "equal")
                                                            .frame(width: 30, height: 30)
                                                            .fontWeight(.semibold)
                                                            .foregroundStyle(Color.ESTitle)
                                                            .rotationEffect(.degrees(-45))
                                                            .scaleEffect(2.0)
                                                        
                                                        Image(systemName: "equal")
                                                            .frame(width: 30, height: 30)
                                                            .fontWeight(.semibold)
                                                            .foregroundStyle(Color.ESTitle)
                                                            .rotationEffect(.degrees(45))
                                                            .scaleEffect(2.0)
                                                    }
                                                    .padding(.top, 100)
                                                    
                                                    Image(systemName: "equal")
                                                        .frame(width: 30, height: 30)
                                                        .fontWeight(.semibold)
                                                        .foregroundStyle(Color.ESTitle)
                                                        .padding(.top, 20)
                                                        .scaleEffect(2.0)
                                                }
                                            }
                                        }
                                        .padding(.top, 20)
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 300)
                        }
                        .padding(.top, 80)
                        
                        ZStack {
                            if questionMark {
                                VStack {
                                    HStack(spacing: 5) {
                                        LottieViewConverter(fileName: "QuestionMark", loopMode: .playOnce, scale: 2.0, width: 30, height: 30)
                                            .padding(.leading, 10)
                                        
                                        Text("생산과 지출이 같다는게 무슨 의미일까요?")
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
                                                .padding(.bottom, 33)
                                            
                                            Text("생산과 지출이 같다는건 생산, 분배, 지출을 화폐가치로 환산한 값이 일치한다는 것을 의미해요.")
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
                                    withAnimation(.smooth(duration: 0.7)) {
                                        questionMarkContent.toggle()
                                        
                                        if questionMarkContent {
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                                withAnimation {
                                                    proxy.scrollTo("bottom", anchor: .bottom)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 100)
                        }
                        .padding(.top, 30)
                        
                        Rectangle()
                            .fill(.clear)
                            .frame(width: 300, height: 85)
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
                                    navigationRouter.navigate(.BasicEconomy11View(viewModel))
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
                        if progress.count == 1 {
                            withAnimation {
                                proxy.scrollTo("bottom", anchor: .bottom)
                            }
                            
                            withAnimation(.smooth(duration: 1.0)) {
                                progress.append(1)
                            }
                            
                        } else {
                            progress.append(1)
                        }
                    }
                    
                    if progress.count == 1 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.smooth(duration: 1.0)) {
                                contentPart1_1 = true
                            }
                        }
                    }
                    
                    if progress.count == 2 {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.smooth(duration: 1.0)) {
                                contentPart2 = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentPart2_1 = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                            withAnimation(.smooth(duration: 1.0)) {
                                                contentPart2_2 = true
                                                
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                                    withAnimation {
                                                        proxy.scrollTo("bottom", anchor: .top)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
                            withAnimation(.smooth(duration: 1.0)) {
                                questionMark = true
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
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

#Preview {
    BasicEconomy10View(viewModel: CourseViewModel(course: .DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
