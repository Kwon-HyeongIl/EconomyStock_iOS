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
    
    init(news: News) {
        self.viewModel = NewsViewModel(news: news)
    }
    
    var body: some View {
        Button {
            
        } label: {
            HStack {
                ZStack {
                    HStack {
                        ZStack {
                            Image("Suit_Toktok")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80)
                                .padding(.bottom, 35)
                            
                            Image("TempAnnounceStage")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90)
                                .padding(.top, 50)
                            
                            Image("ES_TitleLogo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60)
                                .padding(.top, 50)
                            
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
                                Text(viewModel.news.articleTitle)
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
            .opacity([.moneyAndFinance, .exchangeRateAndBalanceOfPayment].contains(viewModel.news.type) && (!viewModel.isLogin || !viewModel.remoteUserStockPass) ? 0.5 : 1.0)
            .overlay {
                if [.moneyAndFinance, .exchangeRateAndBalanceOfPayment].contains(viewModel.news.type) && (!viewModel.isLogin || !viewModel.remoteUserStockPass) {
                    Image(systemName: "lock.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                        .foregroundStyle(.gray)
                }
            }
            .padding(.horizontal, 10)
            .environment(viewModel)
        }
    }
}

#Preview {
    NewsCoverView(news: News.DUMMY_NEWS)
        .environment(NavigationRouter())
}
