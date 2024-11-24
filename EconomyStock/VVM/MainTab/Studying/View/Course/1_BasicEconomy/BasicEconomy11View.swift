//
//  BasicEconomy11View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/10/24.
//

import SwiftUI
import PopupView

struct BasicEconomy11View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Environment(CourseListViewCapsule.self) var courseListViewCapule
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentPart2_1 = false
    @State private var contentPart2_2 = false
    @State private var contentPart2_3 = false
    
    @State private var completeButton = false
    @State private var beforeButton = false
    
    @State private var popup = false
    @State private var popupComplete = true
    
    @State private var loadingBarState = false
    
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
                            
                            Text("마무리")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                                .padding(.top, 5)
                            
                            Spacer()
                        }
                        .padding(.top)
                        
                        Text("경제학이 지향하는 목표")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .padding(.top, 10)
                            .blur(radius: progress.count != 2 ? 0 : 10)
                        
                        if progress.count >= 1 {
                            HStack(spacing: 20) {
                                Ellipse()
                                    .frame(width: 110, height: 60)
                                    .foregroundStyle(Color.ESTitle)
                                    .overlay {
                                        Text("경제성장")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.white)
                                    }
                                    .matchedGeometryEffect(id: "animation", in: animation)
                                
                                Text("+")
                                    .font(.system(size: 30))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.ESTitle)
                                
                                Ellipse()
                                    .frame(width: 110, height: 60)
                                    .foregroundStyle(Color.ESTitle)
                                    .overlay {
                                        Text("물가안정")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.white)
                                    }
                            }
                            .padding(.top)
                            .blur(radius: progress.count == 1 ? 0 : 10)
                        }
                        
                        if progress.count >= 2 {
                            VStack(spacing: 20) {
                                Ellipse()
                                    .frame(width: 110, height: 60)
                                    .foregroundStyle(Color.ESTitle)
                                    .overlay {
                                        Text("경제성장")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.white)
                                    }
                                    .matchedGeometryEffect(id: "animation", in: animation)
                                
                                if contentPart2_1 {
                                    HStack {
                                        Text("=")
                                            .foregroundStyle(Color.ESTitle)
                                            .font(.system(size: 30))
                                            .fontWeight(.semibold)
                                            .padding(.bottom, 5)
                                        
                                        (Text("GDP의 증가 ")
                                         + Text("(생산)")
                                            .foregroundStyle(Color.ESTitle)
                                        )
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                    }
                                    .padding(.top)
                                }
                                
                                if contentPart2_2 {
                                    HStack {
                                        Text("=")
                                            .foregroundStyle(Color.ESTitle)
                                            .font(.system(size: 30))
                                            .fontWeight(.semibold)
                                            .padding(.bottom, 5)
                                        
                                        (Text("국민소득의 증가 ")
                                         + Text("(분배)")
                                            .foregroundStyle(Color.ESTitle)
                                        )
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                    }
                                }
                                
                                if contentPart2_3 {
                                    HStack {
                                        Text("=")
                                            .foregroundStyle(Color.ESTitle)
                                            .font(.system(size: 30))
                                            .fontWeight(.semibold)
                                            .padding(.bottom, 5)
                                        
                                        (Text("소비, 투자, 정부지출, 순수출의 증가 ")
                                         + Text("(지출)")
                                            .foregroundStyle(Color.ESTitle)
                                        )
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                    }
                                }
                            }
                            .padding(.top, 50)
                        }
                    }
                    
                    if completeButton {
                        VStack {
                            Spacer()
                            
                            ZStack {
                                Button {
                                    let view = UIView(frame: .zero)
                                    UIImpactFeedbackGenerator(style: .light, view: view).impactOccurred()
                                    
                                    popup = true
                                } label: {
                                    LottieView(fileName: "CourseCompleteButton", loopMode: .playOnce, speed: 0.5, scale: 2.0, width: 100, height: 100)
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
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            withAnimation(.smooth(duration: 1.0)) {
                                contentPart2_1 = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        contentPart2_2 = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            withAnimation(.smooth(duration: 1.0)) {
                                                contentPart2_3 = true
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
                            withAnimation(.smooth(duration: 1.0)) {
                                completeButton = true
                                
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
        .popup(isPresented: $popup) {
            VStack {
                if popupComplete {
                    LottieView(fileName: "CourseComplete", loopMode: .playOnce, scale: 1.3, width: 200, height: 200)
                } else {
                    LottieView(fileName: "BasicEconomyCourseCover", loopMode: .loop, width: 150, height: 150)
                    
                    Text("I 기초 경제")
                        .font(.system(size: 30, design: .serif))
                        .fontWeight(.bold)
                    
                    Text("축하드려요!")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .padding(.top)
                    
                    Text("강의를 성공적으로 마쳤어요!")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding(.top, 5)
                    
                    Button {
                        withAnimation(.smooth(duration: 0.2)) {
                            loadingBarState = true
                        }
                        
                        if AuthManager.shared.currentUser?.studyingCourse.basicEconomyParmanentProgressPage ?? 0 < viewModel.currentPage {
                            AuthManager.shared.currentUser?.studyingCourse.basicEconomyParmanentProgressPage = viewModel.currentPage
                            
                            Task {
                                await AuthManager.shared.updateCourseParmanentProgressPage(courseType: viewModel.course.type, parmanentProgressPage: viewModel.currentPage)
                            }
                        }
                        
                        // CurrentUser의 lastPage 값 바꾸기 (1페이지로 초기화)
                        AuthManager.shared.currentUser?.studyingCourse.basicEconomyLastPage = 1
                        
                        courseListViewCapule.isUpdate.toggle()
                        
                        // DB User의 lastPage 값 바꾸기 (1페이지로 초기화)
                        Task {
                            await AuthManager.shared.updateCourseLastPage(courseType: viewModel.course.type, lastPage: 1)
                        }
            
                        navigationRouter.popToRoot()
                    } label: {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 80, height: 40)
                            .foregroundStyle(Color.ESTitle)
                            .overlay {
                                Text("돌아가기")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                            }
                            .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
                            .padding(.top, 30)
                            
                    }
                }
            }
            .frame(width: 300, height: 500)
            .background(.ultraThickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.6) {
                    withAnimation(.smooth(duration: 1.0)) {
                        popupComplete = false
                    }
                }
            }
        } customize: {
            $0
                .animation(.spring(duration: 0.7))
                .closeOnTapOutside(true)
                .closeOnTap(false)
                .backgroundColor(.gray.opacity(0.8))
        }
        .overlay {
            if loadingBarState {
                LottieView(fileName: "Loading", loopMode: .loop, width: 180, height: 180)
                    .padding(.bottom, 60)
            }
        }
    }
}

#Preview {
    BasicEconomy11View(viewModel: CourseViewModel(course: .DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
