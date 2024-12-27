//
//  StockPassPurchaseView.swift
//  EconomyStock
//
//  Created by 권형일 on 12/27/24.
//

import SwiftUI

struct StockPassPurchaseView: View {
    
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    ZStack {
                        Rectangle()
                            .frame(maxWidth: .infinity)
                            .frame(height: 380)
                            .foregroundStyle(Color.ESTitle)
                            .padding(.bottom, 20)
                            .shadow(color: .gray.opacity(0.8), radius: 8, x: 0, y: 10)
                        
                        LottieView(fileName: "StageLightEffect", loopMode: .loop, width: 300, height: 300)
                        
                        Image("StockPass_Ticket")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350)
                    }
                    
                    HStack {
                        Text("구매하면 받으시는 혜택")
                            .fontWeight(.semibold)
                            .padding(.leading)
                            .padding(.bottom, 2)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("●")
                            .font(.system(size: 10))
                            .padding(.leading)
                        
                        Text("현재 모든 강의 및 뉴스 수강 가능")
                        
                        Spacer()
                    }
                    .padding(.bottom, 2)
                    
                    HStack {
                        Text("●")
                            .font(.system(size: 10))
                            .padding(.leading)
                        
                        Text("앞으로 추가되는 모든 강의 및 뉴스 수강 가능")
                        
                        Spacer()
                    }
                    .padding(.bottom, 2)
                    
                    HStack {
                        Text("●")
                            .font(.system(size: 10))
                            .padding(.leading)
                        
                        Text("앱 내의 모든 광고 제거")
                        
                        Spacer()
                    }
                    .padding(.bottom, 2)
                    
                    HStack {
                        Text("●")
                            .font(.system(size: 10))
                            .padding(.leading)
                        
                        Text("한번 구매시 영구적으로 혜택")
                        
                        Spacer()
                    }
                    .padding(.bottom, 30)
                    
                    VStack {
                        HStack {
                            Text("유의사항")
                                .padding(.leading)
                            
                            Spacer()
                        }
                        .padding(.bottom, 2)
                        
                        HStack {
                            VStack {
                                Text("●")
                                    .font(.system(size: 8))
                                    .padding(.leading)
                                    .padding(.top, 2)
                                
                                Spacer()
                            }
                            
                            Text("구매 내역을 저장하기위해 반드시 로그인을 수행한 후 결제를 진행해야 합니다.")
                                .font(.system(size: 14))
                            
                            Spacer()
                        }
                        .padding(.bottom, 5)
                        
                        HStack {
                            VStack {
                                Text("●")
                                    .font(.system(size: 8))
                                    .padding(.leading)
                                    .padding(.top, 2)
                                
                                Spacer()
                            }
                            
                            Text("경제STOCK 출시 기념 스톡패스 할인은 별도의 고지 없이 종료될 수 있습니다.")
                                .font(.system(size: 14))
                            
                            Spacer()
                        }
                        
                        HStack {
                            VStack {
                                Text("●")
                                    .font(.system(size: 8))
                                    .padding(.leading)
                                    .padding(.top, 2)
                                
                                Spacer()
                            }
                            
                            Text("스톡패스는 1회만 구매할 수 있으며, 구매 기록이 로그인한 계정에 영구적으로 보관됩니다.")
                                .font(.system(size: 14))
                            
                            Spacer()
                        }
                    }
                    .foregroundStyle(.gray)
                }
            }
            
            VStack {
                Spacer()
                
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150, height: 50)
                    .foregroundStyle(Color.ESTitle)
                    .padding(.bottom, 50)
            }
        }
        .ignoresSafeArea(edges: .vertical)
    }
}

#Preview {
    StockPassPurchaseView()
}
