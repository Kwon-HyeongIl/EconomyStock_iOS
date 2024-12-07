//
//  ExchangeRateAndBalanceOfPayment6View.swift
//  EconomyStock
//
//  Created by 권형일 on 12/1/24.
//

import SwiftUI

struct ExchangeRateAndBalanceOfPayment6View: View {
    @Environment(NavigationRouter.self) var navRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentText1_2 = false
    @State private var contentImage1_1 = false
    @State private var contentImage1_2 = false
    @State private var nextScrollpart = false
    @State private var contentText2_2 = false
    
    @State private var nextButton = false
    @State private var beforeButton = false
    
    @Namespace private var animation
    
    var body: some View {
        ScrollViewReader { proxy in
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
                            
                            Text("국제수지")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .padding(.top)
                        
                        ZStack {
                            if progress.count >= 1 {
                                VStack {
                                    Text("국제수지란 한 나라가 일정기간동안 다른 나라와 거래한 모든 것을 집계한 것으로,")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                        .padding(.top)
                                    
                                    if contentText1_2 {
                                        (Text("거래의 형태에 따라 ")
                                         + Text("경상수지")
                                            .foregroundStyle(Color.ESTitle)
                                            .fontWeight(.bold)
                                         + Text("와 ")
                                         + Text("자본수지")
                                            .foregroundStyle(Color.ESTitle)
                                            .fontWeight(.bold)
                                         + Text("로 나뉘어요"))
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding(.horizontal)
                                        .padding(.top, 30)
                                    }
                                    
                                    if contentImage1_1 {
                                        VStack {
                                            ZStack {
                                                Ellipse()
                                                    .frame(width: 90, height: 50)
                                                    .foregroundStyle(Color.ESTitle)
                                                    .overlay {
                                                        Text("국제수지")
                                                            .font(.system(size: 18))
                                                            .fontWeight(.semibold)
                                                            .foregroundStyle(.white)
                                                    }
                                                    .matchedGeometryEffect(id: "balanceOfPayment", in: animation)
                                                
                                                Ellipse()
                                                    .frame(width: 90, height: 50)
                                                    .foregroundStyle(Color.ESTitle)
                                                    .overlay {
                                                        Text("경상수지")
                                                            .font(.system(size: 18))
                                                            .fontWeight(.semibold)
                                                            .foregroundStyle(.white)
                                                    }
                                                    .opacity(0.0)
                                                    .matchedGeometryEffect(id: "currentAccountBalance", in: animation)
                                                
                                                Ellipse()
                                                    .frame(width: 90, height: 50)
                                                    .foregroundStyle(Color.ESTitle)
                                                    .overlay {
                                                        Text("자본수지")
                                                            .font(.system(size: 18))
                                                            .fontWeight(.semibold)
                                                            .foregroundStyle(.white)
                                                    }
                                                    .opacity(0.0)
                                                    .matchedGeometryEffect(id: "CapitalAccount", in: animation)
                                            }
                                        }
                                        .frame(height: 150)
                                        .padding(.top)
                                        
                                    } else if contentImage1_2 {
                                        VStack {
                                            Ellipse()
                                                .frame(width: 90, height: 50)
                                                .foregroundStyle(Color.ESTitle)
                                                .overlay {
                                                    Text("국제수지")
                                                        .font(.system(size: 18))
                                                        .fontWeight(.semibold)
                                                        .foregroundStyle(.white)
                                                }
                                                .matchedGeometryEffect(id: "balanceOfPayment", in: animation)
                                            
                                            Image(systemName: "chevron.up")
                                                .resizable()
                                                .fontWeight(.ultraLight)
                                                .frame(width: 150, height: 30)
                                                .foregroundStyle(Color.ESTitle)
                                                .padding(.top, 5)
                                                .padding(.bottom, 5)
                                            
                                            HStack {
                                                Ellipse()
                                                    .frame(width: 90, height: 50)
                                                    .foregroundStyle(Color.ESTitle)
                                                    .overlay {
                                                        Text("경상수지")
                                                            .font(.system(size: 18))
                                                            .fontWeight(.semibold)
                                                            .foregroundStyle(.white)
                                                    }
                                                    .padding(.leading, 50)
                                                    .matchedGeometryEffect(id: "currentAccountBalance", in: animation)
                                                
                                                Spacer()
                                                
                                                Ellipse()
                                                    .frame(width: 90, height: 50)
                                                    .foregroundStyle(Color.ESTitle)
                                                    .overlay {
                                                        Text("자본수지")
                                                            .font(.system(size: 18))
                                                            .fontWeight(.semibold)
                                                            .foregroundStyle(.white)
                                                    }
                                                    .padding(.trailing, 50)
                                                    .matchedGeometryEffect(id: "CapitalAccount", in: animation)
                                            }
                                        }
                                        .padding(.top, 20)
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 400)
                        }
                        
//                        ZStack {
//                            if nextScrollpart {
//                                VStack {
//                                    
//                                    
//                                    Spacer()
//                                }
//                            }
//                            
//                            Rectangle()
//                                .fill(.clear)
//                                .frame(width: 100, height: 300)
//                        }
//                        
//                        Rectangle()
//                            .fill(.clear)
//                            .frame(width: 100, height: 85)
//                            .id("bottom")
                    }
                    
                    if nextButton {
                        VStack {
                            Spacer()
                            
                            ZStack {
                                Button {
                                    let view = UIView(frame: .zero)
                                    UIImpactFeedbackGenerator(style: .light, view: view).impactOccurred()
                                    
                                    viewModel.currentPage += 1
                                    navRouter.navigate(.ExchangeRateAndBalanceOfPayment7View(viewModel))
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
                                contentText1_2 = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentImage1_1 = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                            withAnimation(.smooth(duration: 1.0)) {
                                                contentImage1_1 = false
                                                contentImage1_2 = true
                                                
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                                    withAnimation(.smooth(duration: 1.0)) {
                                                        nextButton = true
                                                        
//                                                        proxy.scrollTo("bottom", anchor: .top)
                                                        
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
    ExchangeRateAndBalanceOfPayment6View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
