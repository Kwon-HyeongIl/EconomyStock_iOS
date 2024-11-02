//
//  BasicEconomyPage1.swift
//  EconomyStock
//
//  Created by 권형일 on 10/10/24.
//

import SwiftUI

struct BasicEconomy1View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var building = false
    @State private var governmentBuilding = false
    @State private var earth = false
    
    @State private var button = false
    
    var body: some View {
        VStack {
            HStack {
                Text("경제주체")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .padding(.leading)
                
                Spacer()
            }
            
            if progress.count >= 1 {
                (Text("우리나라에서 경제의 주체는 \n")
                 + Text("가계, 기업, 정부, 해외")
                    .foregroundStyle(Color.ESTitle)
                 + Text("부문으로 나뉘어요")
                )
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .padding(.top, 20)
            }
            
            if progress.count >= 2 {
                VStack(spacing: 20) {
                    HStack(spacing: 60) {
                        VStack {
                            LottieViewConverter(fileName: "BasicEconomy1_Home", loopMode: .playOnce, width: 100, height: 100)
                                .padding(.bottom, 5)
                            
                            Text("가계")
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.ESTitle)
                        }
                        
                        if building {
                            VStack {
                                LottieViewConverter(fileName: "BasicEconomy1_Building",  loopMode: .playOnce, toProgress: 0.8, width: 100, height: 100)
                                    .padding(.bottom, 5)
                                
                                Text("기업")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.ESTitle)
                            }
                        }
                            
                    }
                    
                    Text("경제")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.ESTitle)
                        .overlay {
                            Ellipse()
                                .stroke(Color.ESTitle, lineWidth: 2)
                                .frame(width: 80, height: 40)
                        }
                        .padding(.top, 20)
                        
                    
                    HStack(spacing: 60) {
                        if governmentBuilding {
                            VStack {
                                LottieViewConverter(fileName: "BasicEconomy1_GovernmentBuilding", loopMode: .playOnce, width: 100, height: 100)
                                
                                Text("정부")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.ESTitle)
                            }
                        }
                        
                        if earth {
                            VStack {
                                LottieViewConverter(fileName: "BasicEconomy1_Earth", loopMode: .playOnce, toProgress: 0.3, scale: 1.15, width: 100, height: 100)
                                
                                Text("해외")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.ESTitle)
                            }
                        }
                    }
                }
                .padding(.top, 50)
            }
            
            Spacer()
            
            if button {
                Button {
                    viewModel.currentPage += 1
                    navigationRouter.navigate(.BasicEconomy2View(viewModel))
                } label: {
                    Image(systemName: "chevron.right")
                        .modifier(CourseMoveButtonModifier())
                }
            }
        }
        .modifier(CourseToolbarModifier(viewModel: viewModel, currentPage: viewModel.currentPage, totalPage: viewModel.course.totalPage))
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.smooth(duration: 1.0)) {
                progress.append(1)
                
                if progress.count == 2 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation(.smooth(duration: 1.0)) {
                            building = true
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation(.smooth(duration: 1.0)) {
                            governmentBuilding = true
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation(.smooth(duration: 1.0)) {
                            earth = true
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation(.smooth(duration: 1.0)) {
                            button = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    BasicEconomy1View(viewModel: CourseViewModel(course: .DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
