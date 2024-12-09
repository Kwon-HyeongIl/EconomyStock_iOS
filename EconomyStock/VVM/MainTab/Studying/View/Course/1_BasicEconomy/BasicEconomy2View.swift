//
//  BasicEconomyPage2.swift
//  EconomyStock
//
//  Created by 권형일 on 10/10/24.
//

import SwiftUI

struct BasicEconomy2View: View {
    @Environment(NavigationRouter.self) var navRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var gdp1 = false
    @State private var gdp2 = false
    @State private var gdp3 = false
    @State private var gdp4 = false
    
    @State private var nextButton = false
    @State private var beforeButton = false
    
    var body: some View {
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
                    .padding(.top)
                    
                    if progress.count >= 1 {
                        VStack(spacing: 0) {
                            HStack {
                                Text("GDP (Gross Domestic Product)")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .padding(.top, 5)
                                    .padding(.leading, 30)
                                
                                Spacer()
                            }
                            
                            Text("일정기간 동안 한 나라의 영토 내에서 생산되는 모든 재화와 서비스")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .padding(.top)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                    }
                    
                    if progress.count >= 2 {
                        VStack {
                            HStack {
                                Text("국내총생산 (GDP)")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .padding(.leading, 30)
                                    .padding(.top, 70)
                                    .padding(.bottom)
                                
                                Spacer()
                            }
                            
                            HStack {
                                if gdp1 {
                                    Text("=")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .padding(.bottom, 10)
                                    
                                    VStack(spacing: 5) {
                                        Text("소비지출")
                                            .font(.system(size: 15))
                                            .fontWeight(.semibold)
                                        
                                        Text("C")
                                            .font(.system(size: 20))
                                            .fontWeight(.bold)
                                            .foregroundStyle(Color.ESTitle)
                                    }
                                }
                                
                                if gdp2 {
                                    Text("+")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .padding(.bottom, 10)
                                    
                                    VStack(spacing: 5) {
                                        Text("투자지출")
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                        
                                        Text("I")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .foregroundStyle(Color.ESTitle)
                                    }
                                }
                                
                                if gdp3 {
                                    Text("+")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .padding(.bottom, 10)
                                    
                                    VStack(spacing: 5) {
                                        Text("정부지출")
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                        
                                        Text("G")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .foregroundStyle(Color.ESTitle)
                                    }
                                }
                                
                                if gdp4 {
                                    Text("+")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .padding(.bottom, 10)
                                    
                                    VStack(spacing: 5) {
                                        Text("순수지출")
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                        
                                        Text("(X-M)")
                                            .font(.system(size: 20))
                                            .fontWeight(.semibold)
                                            .foregroundStyle(Color.ESTitle)
                                    }
                                }
                            }
                        }
                    }
                }
                .scrollIndicators(.never)
                
                if nextButton {
                    VStack {
                        Spacer()
                        
                        ZStack {
                            Button {
                                let view = UIView(frame: .zero)
                                UIImpactFeedbackGenerator(style: .light, view: view).impactOccurred()
                                
                                viewModel.currentPage += 1
                                navRouter.navigate(.BasicEconomy3View(viewModel))
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
                
                if progress.count == 2 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation(.smooth(duration: 1.0)) {
                            gdp1 = true
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                withAnimation(.smooth(duration: 1.0)) {
                                    gdp2 = true
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        withAnimation(.smooth(duration: 1.0)) {
                                            gdp3 = true
                                            
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                                withAnimation(.smooth(duration: 1.0)) {
                                                    gdp4 = true
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation(.smooth(duration: 1.0)) {
                            nextButton = true
                            
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

#Preview {
    BasicEconomy2View(viewModel: CourseViewModel(course: .DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
