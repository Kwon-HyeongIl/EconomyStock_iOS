//
//  Price1View.swift
//  EconomyStock
//
//  Created by 권형일 on 10/11/24.
//

import SwiftUI

struct PriceLevel1View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var contentPart1 = false
    @State private var contentPart2 = false
    
    @State private var nextButton = false
    
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
                        
                        Text("물가의 개념")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .opacity(0.2)
                    .padding(.top)
                    
                    HStack {
                        Text("정부지출을 위한 재원은 어떻게 조달될까요?")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .padding(.leading, 30)
                        
                        Spacer()
                    }
                    .padding(.top, 5)
                    
                }
                
                if nextButton {
                    VStack {
                        Spacer()
                        
                        Button {
                            let view = UIView(frame: .zero)
                            UIImpactFeedbackGenerator(style: .light, view: view).impactOccurred()
                            
                            viewModel.currentPage += 1
                            navigationRouter.navigate(.BasicEconomy2View(viewModel))
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
                if progress.count < 2 {
                    progress.append(1)
                }
                
                if progress.count == 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                        withAnimation(.smooth(duration: 1.0)) {
                            nextButton = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PriceLevel1View(viewModel: CourseViewModel(course: .DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
