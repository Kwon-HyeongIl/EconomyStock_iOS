//
//  CourseIntroView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/10/24.
//

import SwiftUI

struct CourseIntroView: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var alertAskStartContinue = false
    @State private var alertAskStartBeginning = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                LottieViewConverter(fileName: viewModel.course.lottieFileName, loopMode: .loop, width: 200, height: 200)
                
                HStack {
                    Text(viewModel.course.title)
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .padding(.bottom)
                    
                    ProgressCircleView(progressRate: viewModel.course.progressRate)
                        .padding(.bottom)
                }
                
                Button {
                    switch viewModel.course.type {
                        
                    case .basicEconomy:
                        if viewModel.course.lastPage == 0 {
                            navigationRouter.navigate(.BasicEconomy1View(viewModel))
                        } else {
                            alertAskStartContinue = true
                        }
                        
                    case .priceLevel:
                        if viewModel.course.lastPage == 0 {
                            navigationRouter.navigate(.PriceLevel1View(viewModel))
                        } else {
                            alertAskStartContinue = true
                        }
                    }
                    
                } label: {
                    Text("시작하기")
                        .modifier(ShortButtonModifier())
                        .padding(.bottom, 30)
                }
                .alert("이이서 계속 하시겠습니까?", isPresented: $alertAskStartContinue) {
                    Button(role: .cancel) {
                        alertAskStartBeginning = true
                    } label: {
                        Text("취소")
                    }
                    
                    Button {
                        switch viewModel.course.type {
                            
                        case .basicEconomy:
                            switch viewModel.course.lastPage {
                                
                            case 1:
                                navigationRouter.navigate(.BasicEconomy1View(viewModel))
                                
                            case 2:
                                viewModel.currentPage = 2
                                navigationRouter.navigate(.BasicEconomy2View(viewModel))
                                
                            case 3:
                                viewModel.currentPage = 3
                                navigationRouter.navigate(.BasicEconomy3View(viewModel))
                                
                            case 4:
                                viewModel.currentPage = 4
                                navigationRouter.navigate(.BasicEconomy4View(viewModel))
                                
                            case 5:
                                viewModel.currentPage = 5
                                navigationRouter.navigate(.BasicEconomy5View(viewModel))
                                
                            default:
                                navigationRouter.navigate(.BasicEconomy1View(viewModel))
                            }
                            
                        case .priceLevel:
                            switch viewModel.course.lastPage {
                                
                            case 1:
                                navigationRouter.navigate(.PriceLevel1View(viewModel))
                                
                            case 2:
                                viewModel.currentPage = 2
                                navigationRouter.navigate(.PriceLevel2View(viewModel))
                                
                            case 3:
                                viewModel.currentPage = 3
                                navigationRouter.navigate(.PriceLevel3View(viewModel))
                                
                            case 4:
                                viewModel.currentPage = 4
                                navigationRouter.navigate(.PriceLevel4View(viewModel))
                                
                            case 5:
                                viewModel.currentPage = 5
                                navigationRouter.navigate(.PriceLevel5View(viewModel))
                                
                            default:
                                navigationRouter.navigate(.PriceLevel1View(viewModel))
                            }
                        }
                    } label: {
                        Text("확인")
                    }
                } message: {
                    Text("이전에 학습하시던 \(viewModel.course.lastPage)페이지로 이동합니다.")
                }
                .alert("처음부터 시작하시겠습니까?", isPresented: $alertAskStartContinue) {
                    Button(role: .cancel) {
                        
                    } label: {
                        Text("취소")
                    }
                    
                    Button {
                        switch viewModel.course.type {
                            
                        case .basicEconomy:
                            navigationRouter.navigate(.BasicEconomy1View(viewModel))
                        case .priceLevel:
                            navigationRouter.navigate(.PriceLevel1View(viewModel))
                        }
                    } label: {
                        Text("확인")
                    }
                } message: {
                    Text("강의 진행률은 초기화되지 않습니다.")
                }
                
                VStack {
                    Text(viewModel.course.description)
                }
                .modifier(TileModifier(height: 400))
            }
        }
        .modifier(NavigationBackHomeModifier())
        .scrollIndicators(.never)
        .environment(viewModel)
    }
}

#Preview {
    CourseIntroView(viewModel: CourseViewModel(course: .DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(MainTabCapsule())
}
