//
//  CourseIntroView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/10/24.
//

import SwiftUI

struct CourseIntroView: View {
    @Environment(NavigationRouter.self) var navRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var alertAskStartContinue = false
    @State private var alertAskStartBeginning = false
    @State private var alertFinishing = false
    
    var body: some View {
        @Bindable var navRouter = navRouter
        
        GeometryReader { proxy in
            ScrollView {
                VStack(spacing: 0) {
                    LottieView(fileName: viewModel.course.lottieFileName, loopMode: .loop, width: 200, height: 200)
                    
                    HStack {
                        Text(viewModel.course.title)
                            .font(.system(size: 35))
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                            .padding(.bottom)
                        
                        ProgressCircleView(progressRate: viewModel.course.progressRate, isFinishMark: true, circleSize: 30, circleOutStrokeSize: 4, circleInStrokeSize: 3, textSize: 8)
                            .padding(.bottom)
                    }
                    
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
                    
                    VStack {
                        switch viewModel.course.type {
                            
                        case .basicEconomy:
                            Text("본격적인 경제 공부를 하기 전에, 이번시간에는 우리 경제에서 경제활동을 하는 주체는 누구인지, 그리고 GDP의 의미와 구성요소에 대해 알아볼게요.")
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 20)
                                .padding(.top)
                            
                        case .priceLevel:
                            Text("물가 안정은 경제성장과 더불어 정부 정책이 지향해야할 가장 중요한 목표 중 하나에요.\n\n이번 시간에는 물가가 무엇인지, 인플레이션과 디플레이션, 그리고 물가측정지표에 대해 알아보아요.")
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 20)
                                .padding(.top)
                            
                        case .unEmployment:
                            Text("경제학이 지향하는 경제 성장이라는 목표는 실업의 감소라고도 볼 수 있어요.\n\n이번 시간에는 실업의 의미에 대해 알아보아요.")
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 20)
                                .padding(.top)
                            
                        case .moneyAndFinance:
                            Text("수천년 전부터 사용되어 온 화폐는 지금까지도 경제생활에 있어서 필수적인 물건이에요.\n화폐는 단순하게 보면 그저 지불수단이지만, 경제에는 지불수단 그 이상의 영향력을 미쳐요.\n이번시간에는 화폐와 금융 전반에 대해서 배워보도록 할게요.")
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 20)
                                .padding(.top)
                            
                        case .exchangeRateAndBalanceOfPayment:
                            Text("세계회가 급속도로 이루어지며 국가간의 재화와 서비스, 자본의 이동은 이전보다 훨씬 활발하게 이루어지고 있어요.\n\n무역이 활발해짐에 따라 환율과 국제수지를 적정수준으로 유지하는 것은 매우 중요하게 되는데요, 이번 시간에는 환율과 국제수지에 대해서 배워보도록 할게요.")
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 20)
                                .padding(.top)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: proxy.size.height / 2.1)
                    .background(.ultraThickMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal, 10)
                    .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
                }
            }
            .modifier(NavigationBackHomeModifier())
            .scrollIndicators(.never)
            .environment(viewModel)
        }
    }
}

#Preview {
    CourseIntroView(viewModel: CourseViewModel(course: .DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(MainTabCapsule())
}
