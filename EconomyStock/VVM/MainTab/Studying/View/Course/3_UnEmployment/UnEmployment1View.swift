//
//  UnEmployment1View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/16/24.
//

import SwiftUI

struct UnEmployment1View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentImage1_1 = false
    @State private var contentImage1_2 = false
    @State private var contentText1 = false
    @State private var contentImage2 = false
    @State private var contentText2 = false
    @State private var contentImage3 = false
    @State private var contentText3 = false
    
    @State private var nextButton = false
    
    @Namespace private var animation
    
    var body: some View {
        VStack {
            ZStack {
                ScrollView {
                    HStack {
                        Text("1.")
                            .font(.system(size: 35))
                            .fontWeight(.bold)
                            .foregroundStyle(Color.ESTitle)
                            .padding(.leading, 30)
                            .padding(.bottom, 3)
                        
                        Text("인구의 분류")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    if progress.count >= 1 {
                        VStack {
                            Text("한 나라의 인구는 다음과 같이 분류될 수 있어요")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                                .padding(.top)
                        }
                    }
                    
                    if contentImage1_1 {
                        Text("총 인구")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.ESTitle)
                            .overlay {
                                Ellipse()
                                    .stroke(Color.ESTitle, lineWidth: 2)
                                    .frame(width: 80, height: 40)
                                    .foregroundStyle(Color.ESTitle)
                                
                            }
                            .padding(.top)
                        
                        
                        if contentImage1_2 {
                            Image(systemName: "chevron.up")
                                .resizable()
                                .fontWeight(.ultraLight)
                                .frame(width: 150, height: 30)
                                .foregroundStyle(Color.ESTitle)
                                .padding(.vertical, 5)
                                .padding(.bottom, 5)
                            
                            HStack(spacing: 30) {
                                Text("그 외")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.ESTitle)
                                    .overlay {
                                        Ellipse()
                                            .stroke(Color.ESTitle, lineWidth: 2)
                                            .frame(width: 70, height: 40)
                                            .foregroundStyle(Color.ESTitle)
                                        
                                    }
                                    .padding(.leading, 25)
                                
                                Text("생산 가능 인구")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.ESTitle)
                                    .overlay {
                                        Ellipse()
                                            .stroke(Color.ESTitle, lineWidth: 2)
                                            .frame(width: 130, height: 40)
                                            .foregroundStyle(Color.ESTitle)
                                        
                                    }
                                    .padding(.leading, progress.count == 1 ? 65 : 0)
                                    .matchedGeometryEffect(id: "animation1", in: animation)
                            }
                        }
                    }
                    
                    if contentText1 {
                        (Text("생산 가능 인구")
                            .foregroundStyle(Color.ESTitle)
                            .fontWeight(.bold)
                         + Text(": 대한민국에 상주하는 만 15세 이상 인구 가운데 군인, 교도소 수감자 등을 제외한 인구"))
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.top, 50)
                    }
                    
                    if progress.count == 2 {
                        Text("생산 가능 인구")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.ESTitle)
                            .overlay {
                                Ellipse()
                                    .stroke(Color.ESTitle, lineWidth: 2)
                                    .frame(width: 130, height: 40)
                                    .foregroundStyle(Color.ESTitle)
                                
                            }
                            .padding(.top)
                            .matchedGeometryEffect(id: "animation1", in: animation)
                        
                        if contentImage2 {
                            Image(systemName: "chevron.up")
                                .resizable()
                                .fontWeight(.ultraLight)
                                .frame(width: 150, height: 30)
                                .foregroundStyle(Color.ESTitle)
                                .padding(.vertical, 5)
                                .padding(.bottom, 5)
                            
                            HStack(spacing: 30) {
                                Text("비경제 활동 인구")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.ESTitle)
                                    .overlay {
                                        Ellipse()
                                            .stroke(Color.ESTitle, lineWidth: 2)
                                            .frame(width: 150, height: 40)
                                            .foregroundStyle(Color.ESTitle)
                                        
                                    }
                                
                                Text("경제 활동 인구")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.ESTitle)
                                    .overlay {
                                        Ellipse()
                                            .stroke(Color.ESTitle, lineWidth: 2)
                                            .frame(width: 130, height: 40)
                                            .foregroundStyle(Color.ESTitle)
                                        
                                    }
                                    .padding(.leading, progress.count == 2 ? 15 : 0)
                                    .matchedGeometryEffect(id: "animation2", in: animation)
                            }
                        }
                        
                        if contentText2 {
                            (Text("경제 활동 인구")
                                .foregroundStyle(Color.ESTitle)
                                .fontWeight(.bold)
                             + Text(": 생산 가능 인구 중 일할 의지와 능력이 모두 있는 사람"))
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .padding(.top, 50)
                            
                            (Text("비경제 활동 인구")
                                .foregroundStyle(Color.ESTitle)
                                .fontWeight(.bold)
                             + Text(": 생산 가능 인구 중 일할 의지와 능력이 없는 사람"))
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .padding(.top, 5)
                        }
                    }
                    
                    if progress.count == 3 {
                        Text("경제 활동 인구")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.ESTitle)
                            .overlay {
                                Ellipse()
                                    .stroke(Color.ESTitle, lineWidth: 2)
                                    .frame(width: 130, height: 40)
                                    .foregroundStyle(Color.ESTitle)
                                
                            }
                            .padding(.top)
                            .matchedGeometryEffect(id: "animation2", in: animation)
                        
                        if contentImage3 {
                            Image(systemName: "chevron.up")
                                .resizable()
                                .fontWeight(.ultraLight)
                                .frame(width: 150, height: 30)
                                .foregroundStyle(Color.ESTitle)
                                .padding(.vertical, 5)
                                .padding(.bottom, 5)
                            
                            HStack(spacing: 30) {
                                Text("실업자")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.ESTitle)
                                    .overlay {
                                        Ellipse()
                                            .stroke(Color.ESTitle, lineWidth: 2)
                                            .frame(width: 100, height: 40)
                                            .foregroundStyle(Color.ESTitle)
                                        
                                    }
                                
                                Text("취업자")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.ESTitle)
                                    .overlay {
                                        Ellipse()
                                            .stroke(Color.ESTitle, lineWidth: 2)
                                            .frame(width: 100, height: 40)
                                            .foregroundStyle(Color.ESTitle)
                                        
                                    }
                                    .padding(.leading, 80)
                            }
                        }
                        
                        if contentText3 {
                            (Text("실업자")
                                .foregroundStyle(Color.ESTitle)
                                .fontWeight(.bold)
                             + Text(": 경제 활동 인구 중 일을 하지 못하고 있는 사람"))
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .padding(.top, 50)
                            
                            (Text("취업자")
                                .foregroundStyle(Color.ESTitle)
                                .fontWeight(.bold)
                             + Text(": 경제 활동 인구 중 일을 하고 있는 사람"))
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                            .padding(.top, 5)
                        }
                    }
                }
                
                if nextButton {
                    VStack {
                        Spacer()
                        
                        Button {
                            let view = UIView(frame: .zero)
                            UIImpactFeedbackGenerator(style: .light, view: view).impactOccurred()
                            
                            viewModel.currentPage += 1
                            navigationRouter.navigate(.PriceLevel2View(viewModel))
                        } label: {
                            LottieViewConverter(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.0, width: 100, height: 100)
                                .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
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
                            contentImage1_1 = true
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                withAnimation(.smooth(duration: 1.0)) {
                                    contentImage1_2 = true
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        withAnimation(.smooth(duration: 1.0)) {
                                            contentText1 = true
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
                if progress.count == 2 {
                    withAnimation(.smooth(duration: 1.0)) {
                        contentImage1_1 = false
                        contentImage1_2 = false
                        contentText1 = false
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation(.smooth(duration: 1.0)) {
                                contentImage2 = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentText2 = true
                                    }
                                }
                            }
                        }
                    }
                }
                
                if progress.count == 3 {
                    withAnimation(.smooth(duration: 1.0)) {
                        contentImage2 = false
                        contentText2 = false
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation(.smooth(duration: 1.0)) {
                                contentImage3 = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentText3 = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            withAnimation(.smooth(duration: 1.0)) {
                                                nextButton = true
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
    UnEmployment1View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
