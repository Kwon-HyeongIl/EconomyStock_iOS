//
//  StudyingCover.swift
//  EconomyStock
//
//  Created by 권형일 on 10/9/24.
//

import SwiftUI

struct CourseCoverView: View {
    @Environment(NavigationRouter.self) var navRouter
    @State private var viewModel: CourseViewModel
    
    @State private var alertAskStartContinue = false
    @State private var alertAskStartBeginning = false
    @State private var alertFinishing = false
    
    init(course: Course) {
        self.viewModel = CourseViewModel(course: course)
    }
    
    var body: some View {
        Button {
            switch viewModel.course.type {
                
            case .basicEconomy:
                if viewModel.course.lastPage == 0 {
                    navRouter.navigate(.BasicEconomy1View(viewModel))
                    
                } else if viewModel.course.lastPage == 11 {
                    alertFinishing = true
                    
                } else {
                    alertAskStartContinue = true
                }
                
            case .priceLevel:
                if viewModel.course.lastPage == 0 {
                    navRouter.navigate(.PriceLevel1View(viewModel))
                    
                } else if viewModel.course.lastPage == 10 {
                    alertFinishing = true
                    
                } else {
                    alertAskStartContinue = true
                }
                
            case .unEmployment:
                if viewModel.course.lastPage == 0 {
                    navRouter.navigate(.UnEmployment1View(viewModel))
                    
                } else if viewModel.course.lastPage == 7 {
                    alertFinishing = true
                    
                } else {
                    alertAskStartContinue = true
                }
                
            case .moneyAndFinance:
                if viewModel.course.lastPage == 0 {
                    navRouter.navigate(.MoneyAndFinance1View(viewModel))
                    
                } else if viewModel.course.lastPage == 19 {
                    alertFinishing = true
                    
                } else {
                    alertAskStartContinue = true
                }
                
            case .exchangeRateAndBalanceOfPayment:
                if viewModel.course.lastPage == 0 {
                    navRouter.navigate(.ExchangeRateAndBalanceOfPayment1View(viewModel))
                    
                } else if viewModel.course.lastPage == 11 {
                    alertFinishing = true
                    
                } else {
                    alertAskStartContinue = true
                }
            }
        } label: {
            VStack {
                ZStack {
                    ZStack {
                        LottieView(fileName: viewModel.course.lottieFileName, loopMode: .loop, width: 140, height: 140)
                            .padding(.trailing, 190)
                        
                        Text(viewModel.course.number)
                            .font(.system(size: 38, design: .serif))
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .padding(.bottom, 2)
                        
                        HStack {
                            Text(viewModel.course.title)
                                .foregroundStyle(.white)
                                .font(.system(size: 32))
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .frame(width: 140)
                        .padding(.leading, 200)
                        
                    }
                    
                    VStack {
                        HStack {
                            Spacer()
                            
                            ProgressCircleView(progressRate: viewModel.course.progressRate, isFinishMark: true, circleSize: 30, circleOutStrokeSize: 4, circleInStrokeSize: 3, textSize: 8)
                                .padding(.top, 10)
                                .padding(.trailing, 10)
                        }
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
            }
            .frame(maxWidth: .infinity)
            .frame(height: 170)
            .background(viewModel.course.backgroundGradient)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 10)
            .environment(viewModel)
        }
        .alert("이이서 계속 하시겠습니까?", isPresented: $alertAskStartContinue) {
            Button(role: .cancel) {
                alertAskStartBeginning = true
            } label: {
                Text("취소")
            }
            
            Button {
                viewModel.courseContinue(viewModel: viewModel, navRouter: navRouter)
            } label: {
                Text("확인")
            }
        } message: {
            Text("이전에 학습하시던 \(viewModel.course.lastPage)페이지로 이동합니다.")
        }
        .alert("처음부터 시작하시겠습니까?", isPresented: $alertAskStartBeginning) {
            Button(role: .cancel) {
                
            } label: {
                Text("취소")
            }
            
            Button {
                switch viewModel.course.type {
                case .basicEconomy:
                    navRouter.navigate(.BasicEconomy1View(viewModel))
                case .priceLevel:
                    navRouter.navigate(.PriceLevel1View(viewModel))
                case .unEmployment:
                    navRouter.navigate(.UnEmployment1View(viewModel))
                case .moneyAndFinance:
                    navRouter.navigate(.MoneyAndFinance1View(viewModel))
                case .exchangeRateAndBalanceOfPayment:
                    navRouter.navigate(.ExchangeRateAndBalanceOfPayment1View(viewModel))
                }
            } label: {
                Text("확인")
            }
        } message: {
            Text("강의 진행률은 초기화되지 않습니다.")
        }
        .alert("이미 완료한 강의입니다", isPresented: $alertFinishing) {
            Button(role: .cancel) {
                
            } label: {
                Text("취소")
            }
            
            Button {
                switch viewModel.course.type {
                case .basicEconomy:
                    navRouter.navigate(.BasicEconomy1View(viewModel))
                case .priceLevel:
                    navRouter.navigate(.PriceLevel1View(viewModel))
                case .unEmployment:
                    navRouter.navigate(.UnEmployment1View(viewModel))
                case .moneyAndFinance:
                    navRouter.navigate(.MoneyAndFinance1View(viewModel))
                case .exchangeRateAndBalanceOfPayment:
                    navRouter.navigate(.ExchangeRateAndBalanceOfPayment1View(viewModel))
                }
            } label: {
                Text("확인")
            }
        } message: {
            Text("첫페이지로 돌아갑니다. 강의 진행률은 초기화되지 않습니다.")
        }
    }
}

#Preview {
    CourseCoverView(course: Course.DUMMY_COURSE)
        .environment(NavigationRouter())
}
