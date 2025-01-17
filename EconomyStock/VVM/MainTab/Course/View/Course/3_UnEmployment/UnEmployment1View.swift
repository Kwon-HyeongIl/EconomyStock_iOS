//
//  UnEmployment1View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/16/24.
//

import SwiftUI

struct UnEmployment1View: View {
    @Environment(NavigationRouter.self) var navRouter
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
                        Text("총인구")
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
                            
                            /*
                             matchedGeometryEffect 수정자를 사용할 때, 뷰에 padding이 적용되어 있으면
                             애니메이션 과정에서 끊김이 발생하므로 Spacer로 간격 조절
                             */
                            HStack(spacing: 30) {
                                Spacer()
                                
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
                                    .padding(.leading, 30)
                                
                                Spacer()
                                
                                Text("생산가능인구")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.ESTitle)
                                    .overlay {
                                        Ellipse()
                                            .stroke(Color.ESTitle, lineWidth: 2)
                                            .frame(width: 130, height: 40)
                                            .foregroundStyle(Color.ESTitle)
                                        
                                    }
                                    .matchedGeometryEffect(id: "animation1", in: animation)
                                
                                Spacer()
                            }
                        }
                    }
                    
                    if contentText1 {
                        VStack(spacing: 5) {
                            Text("생산가능인구")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                                .foregroundStyle(Color.ESTitle)
                                .fontWeight(.bold)
                            
                            Text("대한민국에 상주하는 만 15세 이상 인구 가운데 군인, 교도소 수감자 등을 제외한 인구를 말해요")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                        .padding(.top, 50)
                    }
                    
                    if progress.count == 2 {
                        Text("생산가능인구")
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
                                Spacer()
                                
                                Text("비경제활동인구")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.ESTitle)
                                    .overlay {
                                        Ellipse()
                                            .stroke(Color.ESTitle, lineWidth: 2)
                                            .frame(width: 150, height: 40)
                                            .foregroundStyle(Color.ESTitle)
                                        
                                    }
                                
                                Spacer()
                                
                                Text("경제활동인구")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.ESTitle)
                                    .overlay {
                                        Ellipse()
                                            .stroke(Color.ESTitle, lineWidth: 2)
                                            .frame(width: 130, height: 40)
                                            .foregroundStyle(Color.ESTitle)
                                        
                                    }
                                    .matchedGeometryEffect(id: "animation2", in: animation)
                                
                                Spacer()
                            }
                        }
                        
                        if contentText2 {
                            VStack(spacing: 5) {
                                Text("경제활동인구")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                    .foregroundStyle(Color.ESTitle)
                                    .fontWeight(.bold)
                                
                                Text("생산가능인구 중 일할 의지와 능력이 모두 있는 사람을 말해요")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            .padding(.top, 50)
                            
                            VStack(spacing: 5) {
                                Text("비경제활동인구")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                    .foregroundStyle(Color.ESTitle)
                                    .fontWeight(.bold)
                                
                                Text("생산가능인구 중 일할 의지와 능력이 없는 사람을 말해요")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            .padding(.top, 10)
                        }
                    }
                    
                    if progress.count == 3 {
                        Text("경제활동인구")
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
                            VStack(spacing: 5) {
                                Text("실업자")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                    .foregroundStyle(Color.ESTitle)
                                    .fontWeight(.bold)
                                
                                Text("경제활동인구 중 일을 하지 못하고 있는 사람을 말해요")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            .padding(.top, 50)
                            
                            VStack(spacing: 5) {
                                Text("취업자")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                    .foregroundStyle(Color.ESTitle)
                                    .fontWeight(.bold)
                                
                                Text("경제활동인구 중 일을 하고 있는 사람을 말해요")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            .padding(.top, 10)
                        }
                    }
                }
                .scrollIndicators(.never)
                
                if nextButton {
                    VStack {
                        Spacer()
                        
                        Button {
                            let view = UIView(frame: .zero)
                            UIImpactFeedbackGenerator(style: .light, view: view).impactOccurred()
                            
                            viewModel.currentPage += 1
                            navRouter.navigate(.UnEmployment2View(viewModel))
                        } label: {
                            LottieView(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.0, width: 100, height: 100)
                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                        }
                    }
                }
            }
        }
        .modifier(CourseToolbarModifier(viewModel: viewModel, currentPage: viewModel.currentPage, totalPage: viewModel.course.totalPage))
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation {
                if progress.count < 3 {
                    progress.append(1)
                }
                
                if progress.count == 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation {
                            contentImage1_1 = true
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                withAnimation {
                                    contentImage1_2 = true
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        withAnimation {
                                            contentText1 = true
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
                if progress.count == 2 {
                    withAnimation {
                        contentImage1_1 = false
                        contentImage1_2 = false
                        contentText1 = false
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation {
                                contentImage2 = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation {
                                        contentText2 = true
                                    }
                                }
                            }
                        }
                    }
                }
                
                if progress.count == 3 {
                    withAnimation {
                        contentImage2 = false
                        contentText2 = false
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            withAnimation {
                                contentImage3 = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation {
                                        contentText3 = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            withAnimation {
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
        .environment(CourseListCapsule())
}
