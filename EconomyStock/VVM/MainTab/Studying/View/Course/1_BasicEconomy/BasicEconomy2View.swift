//
//  BasicEconomyPage2.swift
//  EconomyStock
//
//  Created by 권형일 on 10/10/24.
//

import SwiftUI

struct BasicEconomy2View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var rotate = false
    
    @State private var nextButton = false
    @State private var beforeButton = false
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("GDP (국내총생산)")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .padding(.leading, 30)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    if progress.count >= 1 {
                        VStack(spacing: 0) {
                            HStack {
                                Text("GDP (Gross Domestic Product)")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .padding(.top, 20)
                                    .padding(.leading, 30)
                                
                                Spacer()
                            }
                            
                            HStack {
                                Text(":일정기간 동안 한 나라의 영토 내에서\n 생산되는 모든 재화와 서비스")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                    .padding(.top, 1)
                                    .padding(.leading, 35)
                                    .padding(.top, 5)
                                
                                Spacer()
                            }
                        }
                    }
                    
                    if progress.count >= 2 {
                        HStack {
                            Text("국민소득 3연 등가의 법칙")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .padding(.top, 20)
                                .padding(.leading, 30)
                            
                            Spacer()
                        }
                    }
                    
                    if progress.count >= 3 {
                        ZStack {
                            VStack {
                                VStack(spacing: 0) {
                                    LottieViewConverter(fileName: "BasicEconomy2_Distribution", loopMode: .playOnce, width: 110, height: 110)
                                    
                                    Text("분배")
                                        .font(.system(size: 15))
                                        .fontWeight(.semibold)
                                        .foregroundStyle(Color.ESTitle)
                                }
                                
                                HStack {
                                    VStack(spacing: 0) {
                                        LottieViewConverter(fileName: "BasicEconomy2_Factory", loopMode: .playOnce, width: 110, height: 110)
                                            .padding(.leading, 30)
                                        
                                        Text("생산")
                                            .font(.system(size: 15))
                                            .fontWeight(.semibold)
                                            .foregroundStyle(Color.ESTitle)
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(spacing: 0) {
                                        LottieViewConverter(fileName: "BasicEconomy2_Payment", loopMode: .playOnce, toProgress: 0.745, width: 110, height: 110)
                                            .padding(.trailing, 30)
                                        
                                        Text("지출")
                                            .font(.system(size: 15))
                                            .fontWeight(.semibold)
                                            .foregroundStyle(Color.ESTitle)
                                    }
                                }
                                .padding(.top, 40)
                            }
                            
                            if rotate {
                                LottieViewConverter(fileName: "BasicEconomy2_Rotate", loopMode: .playOnce, width: 130, height: 130)
                                    .padding(.top, 80)
                            }
                        }
                        .padding(.top, 20)
                    }
                    
                    Spacer()
                    
                    if nextButton {
                        ZStack {
                            Button {
                                viewModel.currentPage += 1
                                navigationRouter.navigate(.BasicEconomy3View(viewModel))
                            } label: {
                                LottieViewConverter(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, width: 200, height: 200)
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
                                            .padding(.leading, 80)
                                            .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
                                    }
                                    
                                    Spacer()
                                }
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
                if progress.count < 4 {
                    progress.append(1)
                }
                
                if progress.count == 3 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation(.smooth(duration: 1.0)) {
                            rotate = true
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        withAnimation(.smooth(duration: 1.0)) {
                            nextButton = true
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                        withAnimation(.smooth(duration: 1.0)) {
                            beforeButton = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    BasicEconomy2View(viewModel: CourseViewModel(course: .DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
