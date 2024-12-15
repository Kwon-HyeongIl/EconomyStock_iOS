//
//  BasicEconomyPage1.swift
//  EconomyStock
//
//  Created by 권형일 on 10/10/24.
//

import SwiftUI
import PopupView

struct BasicEconomy1View: View {
    @Environment(NavigationRouter.self) var navRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentImage = false
    @State private var building = false
    @State private var governmentBuilding = false
    @State private var earth = false
    
    @State private var nextButton = false
    
    @State private var popup = false
    
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
                        
                        Text("경제주체")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    if progress.count >= 1 {
                        (Text("우리나라에서 경제의 주체는 \n")
                         + Text("가계, 기업, 정부, 해외")
                            .foregroundStyle(Color.ESTitle)
                            .fontWeight(.bold)
                         + Text("부문으로 나뉘어요")
                        )
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .padding(.top, 5)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        
                        if contentImage {
                            VStack(spacing: 5) {
                                HStack(spacing: 60) {
                                    VStack {
                                        LottieView(fileName: "BasicEconomy1_Home", loopMode: .playOnce, width: 100, height: 100)
                                            .padding(.bottom, 5)
                                        
                                        Text("가계")
                                            .font(.system(size: 15))
                                            .fontWeight(.semibold)
                                            .foregroundStyle(Color.ESTitle)
                                    }
                                    
                                    if building {
                                        VStack {
                                            LottieView(fileName: "BasicEconomy1_Building",  loopMode: .playOnce, toProgress: 0.8, width: 100, height: 100)
                                                .padding(.bottom, 5)
                                            
                                            Text("기업")
                                                .font(.system(size: 15))
                                                .fontWeight(.semibold)
                                                .foregroundStyle(Color.ESTitle)
                                        }
                                    }
                                    
                                }
                                
                                Ellipse()
                                    .frame(width: 90, height: 50)
                                    .foregroundStyle(Color.ESTitle)
                                    .overlay {
                                        Text("경제")
                                            .font(.system(size: 25))
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.white)
                                    }
                                    .padding(.top, 20)
                                
                                HStack(spacing: 60) {
                                    if governmentBuilding {
                                        VStack {
                                            LottieView(fileName: "BasicEconomy1_GovernmentBuilding", loopMode: .playOnce, width: 100, height: 100)
                                            
                                            Text("정부")
                                                .font(.system(size: 15))
                                                .fontWeight(.semibold)
                                                .foregroundStyle(Color.ESTitle)
                                        }
                                    }
                                    
                                    if earth {
                                        VStack {
                                            LottieView(fileName: "BasicEconomy1_Earth", loopMode: .playOnce, toProgress: 0.3, scale: 1.15, width: 100, height: 100)
                                            
                                            Text("해외")
                                                .font(.system(size: 15))
                                                .fontWeight(.semibold)
                                                .foregroundStyle(Color.ESTitle)
                                        }
                                    }
                                }
                            }
                            .padding(.top, 20)
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
                            navRouter.navigate(.BasicEconomy2View(viewModel))
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
            withAnimation(.smooth(duration: 1.0)) {
                if progress.count < 2 {
                    progress.append(1)
                }
                
                if progress.count == 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation(.smooth(duration: 1.0)) {
                            contentImage = true
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                withAnimation(.smooth(duration: 1.0)) {
                                    building = true
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        withAnimation(.smooth(duration: 1.0)) {
                                            governmentBuilding = true
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                withAnimation(.smooth(duration: 1.0)) {
                                                    earth = true
                                                    
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
        }
        .onAppear {
            popup = true
        }
        .popup(isPresented: $popup) {
            HStack {
                (Text("진행하시려면 화면을 ")
                + Text("터치 ")
                    .foregroundStyle(Color.ESTitle)
                + Text("해주세요"))
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
            }
            .frame(width: 300, height: 80)
            .background(.ultraThickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
            .padding(.bottom, 50)
        } customize: {
            $0
                .type(.toast)
                .closeOnTap(true)
                .closeOnTapOutside(true)
        }
    }
}

#Preview {
    BasicEconomy1View(viewModel: CourseViewModel(course: .DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
