//
//  NewsCoverView.swift
//  EconomyStock
//
//  Created by 권형일 on 12/31/24.
//

import SwiftUI

struct NewsCoverView: View {
    @Environment(NavigationRouter.self) var navRouter
    @State private var viewModel: NewsViewModel
    
    @State private var alertAskStartContinue = false
    @State private var alertAskStartBeginning = false
    @State private var alertFinishing = false
    
    init(news: News) {
        self.viewModel = NewsViewModel(news: news)
    }
    
    var body: some View {
        Button {
            switch viewModel.news.type {
                
            case .basicEconomy:
                if viewModel.news.lastPage == 0 {
                    navRouter.navigate(.BasicEconomyNewsView(viewModel))
                    
                } else if viewModel.news.lastPage == 8 {
                    alertFinishing = true
                    
                } else {
                    alertAskStartContinue = true
                }
                
            case .priceLevel:
                if viewModel.news.lastPage == 0 {
                    navRouter.navigate(.PriceLevelNewsView(viewModel))
                    
                } else if viewModel.news.lastPage == 6 {
                    alertFinishing = true
                    
                } else {
                    alertAskStartContinue = true
                }
                
            case .unEmployment:
                if viewModel.news.lastPage == 0 {
                    navRouter.navigate(.UnEmploymentNewsView(viewModel))
                    
                } else if viewModel.news.lastPage == 7 {
                    alertFinishing = true
                    
                } else {
                    alertAskStartContinue = true
                }
                
            case .moneyAndFinance:
                if viewModel.news.lastPage == 0 {
                    navRouter.navigate(.MoneyAndFinanceNewsView(viewModel))
                    
                } else if viewModel.news.lastPage == 6 {
                    alertFinishing = true
                    
                } else {
                    alertAskStartContinue = true
                }
                
            case .exchangeRateAndBalanceOfPayment:
                if viewModel.news.lastPage == 0 {
                    navRouter.navigate(.ExchangeRateAndBalanceOfPaymentNewsView(viewModel))
                    
                } else if viewModel.news.lastPage == 7 {
                    alertFinishing = true
                    
                } else {
                    alertAskStartContinue = true
                }
            }
        } label: {
            HStack {
                ZStack {
                    HStack {
                        ZStack {
                            Image("News_Toktok")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 85)
                            
                            Image("ES_TitleLogo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50)
                                .padding(.top, 43)
                            
                        }
                        .padding(.leading, 20)
                        
                        VStack {
                            HStack {
                                LottieView(fileName: viewModel.news.lottieFileName, loopMode: .loop, width: 20, height: 20)
                                    .scaleEffect(2.5)
                                    .padding(.bottom)
                                    .padding(.trailing, 5)
                                
                                Text(viewModel.news.number)
                                    .font(.system(size: 20, design: .serif))
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                                
                                Text(viewModel.news.title)
                                    .foregroundStyle(.white)
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                
                                Spacer()
                            }
                            .padding(.leading, 20)
                            
                            HStack {
                                Text(viewModel.news.newsTitle)
                                    .foregroundStyle(.white)
                                    .font(.system(size: 15).bold())
                                    .padding(.horizontal, 10)
                            }
                            .frame(width: 190, height: 80)
                            .background(NewsBackgroundView())
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 3)
                                    .foregroundStyle(Color(hex: "4d4d4d"))
                            }
                            .padding(.trailing)
                        }
                        .padding(.leading, 20)
                        
                        Spacer()
                    }
                    
                    VStack {
                        HStack {
                            Spacer()
                            
                            ProgressCircleView(progressRate: viewModel.news.progressRate, isFinishMark: true, circleSize: 30, circleOutStrokeSize: 4, circleInStrokeSize: 3, textSize: 8)
                                .padding(.top, 10)
                                .padding(.trailing, 10)
                        }
                        
                        Spacer()
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 170)
            .background(viewModel.news.backgroundGradient)
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
                viewModel.newsContinue(viewModel: viewModel, navRouter: navRouter)
            } label: {
                Text("확인")
            }
        } message: {
            Text("이전에 학습하시던 \(viewModel.news.lastPage)단계로 이동합니다.")
        }
        .alert("처음부터 시작하시겠습니까?", isPresented: $alertAskStartBeginning) {
            Button(role: .cancel) {
                
            } label: {
                Text("취소")
            }
            
            Button {
                viewModel.newsContinue(viewModel: viewModel, navRouter: navRouter)
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
                viewModel.newsContinue(viewModel: viewModel, navRouter: navRouter)
            } label: {
                Text("확인")
            }
        } message: {
            Text("첫페이지로 돌아갑니다. 강의 진행률은 초기화되지 않습니다.")
        }
    }
}

#Preview {
    NewsCoverView(news: News.DUMMY_NEWS)
        .environment(NavigationRouter())
}
