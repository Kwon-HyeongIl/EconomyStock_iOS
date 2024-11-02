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
                 + Text("가계, 기업, 정부, 해외부문")
                    .foregroundStyle(Color.ESTitle)
                 + Text("으로 나뉘어요")
                )
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .padding(.top, 20)
            }
            
            if progress.count >= 2 {
                VStack(spacing: 20) {
                    HStack(spacing: 50) {
                        LottieViewConverter(fileName: "BasicEconomy1_Home", loopMode: .playOnce, width: 100, height: 100)
                        
                        if building {
                            LottieViewConverter(fileName: "BasicEconomy1_Building",  loopMode: .playOnce, toProgress: 0.8, width: 100, height: 100)
                        }
                            
                    }
                    
                    Text("경제")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.ESTitle)
                        .padding(.top, 20)
                    
                    HStack(spacing: 50) {
                        if governmentBuilding {
                            LottieViewConverter(fileName: "BasicEconomy1_GovernmentBuilding", loopMode: .playOnce, width: 100, height: 100)
                        }
                        
                        if earth {
                            LottieViewConverter(fileName: "BasicEconomy1_Earth", loopMode: .playOnce, toProgress: 0.7, width: 110, height: 110)
                            
                        }
                    }
                }
                .padding(.top, 50)
            }
            
            Spacer()
            
            if progress.count >= 2 {
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
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation(.smooth(duration: 1.0)) {
                            building = true
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation(.smooth(duration: 1.0)) {
                            governmentBuilding = true
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation(.smooth(duration: 1.0)) {
                            earth = true
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
