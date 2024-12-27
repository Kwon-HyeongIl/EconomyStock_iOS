//
//  StockPassPurchaseView.swift
//  EconomyStock
//
//  Created by 권형일 on 12/27/24.
//

import SwiftUI

struct StockPassPurchaseView: View {
    @Environment(NavigationRouter.self) var navRouter
    @State private var viewModel = StockPassPurchaseViewModel()
    
    @State private var alertLogin = false
    @State private var alertPurchaseFail = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    ZStack {
                        Rectangle()
                            .frame(maxWidth: .infinity)
                            .frame(height: 350)
                            .foregroundStyle(Color.ESTitle)
                            .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                            .padding(.bottom, 20)
                            .shadow(color: .gray.opacity(0.8), radius: 8, x: 0, y: 10)
                        
                        LottieView(fileName: "StageLightEffect", loopMode: .loop, width: 280, height: 280)
                        
                        Image("StockPass_Ticket")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350)
                        
                        VStack(spacing: 5) {
                            Text("스톡패스")
                                .font(.system(size: 30).bold())
                                .foregroundStyle(Color(hex: "e2bf55"))
                                .padding(.top, 220)
                            
                            VStack {
                                Text("3,800원")
                                    .font(.system(size: 14))
                                    .foregroundStyle(.gray)
                                    .strikethrough(true, color: .red)
                                
                                Text("1,900원")
                                    .font(.system(size: 22).bold())
                                    .foregroundStyle(.red)
                            }
                        }
                    }
                    
                    VStack {
                        HStack {
                            Text("구매하면 받으실 혜택")
                                .fontWeight(.semibold)
                                .padding(.leading)
                                .padding(.bottom, 2)
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text("●")
                                .font(.system(size: 9))
                                .padding(.leading)
                            
                            Text("현재 모든 강의 및 뉴스 수강 가능")
                            
                            Spacer()
                        }
                        .padding(.bottom, 2)
                        
                        HStack {
                            Text("●")
                                .font(.system(size: 9))
                                .padding(.leading)
                            
                            Text("앞으로 추가되는 모든 강의 및 뉴스 수강 가능")
                            
                            Spacer()
                        }
                        .padding(.bottom, 2)
                        
                        HStack {
                            Text("●")
                                .font(.system(size: 9))
                                .padding(.leading)
                            
                            Text("앱 내의 모든 광고 제거")
                            
                            Spacer()
                        }
                        .padding(.bottom, 2)
                        
                        HStack {
                            Text("●")
                                .font(.system(size: 9))
                                .padding(.leading)
                            
                            Text("한번 구매시 영구적으로 혜택")
                            
                            Spacer()
                        }
                    }
                    .padding(.vertical, 20)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 3)
                            .foregroundStyle(.yellow)
                    }
                    .padding(.horizontal)
                    .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
                    .padding(.bottom, 30)
                    
                    VStack {
                        HStack {
                            Text("유의사항")
                                .font(.system(size: 15))
                                .padding(.leading, 30)
                            
                            Spacer()
                        }
                        .padding(.bottom, 2)
                        
                        HStack {
                            VStack {
                                Text("●")
                                    .font(.system(size: 6))
                                    .padding(.leading, 30)
                                    .padding(.top, 2)
                                
                                Spacer()
                            }
                            
                            Text("구매 내역을 저장하기위해 반드시 로그인을 수행한 후 결제를 진행해야 합니다.")
                                .font(.system(size: 12))
                            
                            Spacer()
                        }
                        .padding(.bottom, 5)
                        
                        HStack {
                            VStack {
                                Text("●")
                                    .font(.system(size: 6))
                                    .padding(.leading, 30)
                                    .padding(.top, 2)
                                
                                Spacer()
                            }
                            
                            Text("경제STOCK 출시 기념 스톡패스 할인은 별도의 고지 없이 종료될 수 있습니다.")
                                .font(.system(size: 12))
                            
                            Spacer()
                        }
                        .padding(.bottom, 5)
                        
                        HStack {
                            VStack {
                                Text("●")
                                    .font(.system(size: 6))
                                    .padding(.leading, 30)
                                    .padding(.top, 2)
                                
                                Spacer()
                            }
                            
                            Text("스톡패스는 1회만 구매할 수 있으며, 구매 기록이 로그인한 계정에 영구적으로 보관됩니다.")
                                .font(.system(size: 12))
                            
                            Spacer()
                        }
                        .padding(.bottom, 100)
                    }
                    .foregroundStyle(.gray)
                }
            }
            .scrollIndicators(.never)
            
            VStack {
                Spacer()
                
                Button {
                    if !viewModel.isLogin {
                        self.alertLogin = true
                        return
                    }
                    
                    Task {
                        let result = await viewModel.purchase()
                        
                        if result {
                            // 결제 완료 창으로 이동
                        } else {
                            self.alertPurchaseFail = true
                        }
                    }
                } label: {
                    VStack {
                        ZStack {
                            VStack {
                                Text("3,800원")
                                    .font(.system(size: 10))
                                    .foregroundStyle(.gray)
                                    .strikethrough(true, color: .red)
                                
                                Text("1,900원")
                                    .font(.system(size: 17).bold())
                                    .foregroundStyle(.red)
                            }
                            
                            LottieView(fileName: "50PercentDiscount", loopMode: .loop, width: 20, height: 20)
                                .scaleEffect(3.5)
                                .padding(.leading, 100)
                        }
                    }
                    .frame(width: 180, height: 50)
                    .background(.white)
                    .cornerRadius(30, corners: .allCorners)
                    .overlay {
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 3)
                            .foregroundStyle(.yellow)
                    }
                    .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
                    .padding(.bottom, 30)
                }
                .alert("결제 실패", isPresented: $alertPurchaseFail) {
                    Button {
                        
                    } label: {
                        Text("확인")
                    }
                } message: {
                    Text("결제하는 과정에서 문제가 발생하였습니다.")
                }
                .alert("주의", isPresented: $alertPurchaseFail) {
                    Button {
                        navRouter.navigate(.LoginView)
                    } label: {
                        Text("확인")
                    }
                } message: {
                    Text("로그인이 필요한 서비스입니다.")
                }
            }
        }
        .ignoresSafeArea(edges: .vertical)
        .modifier(NavigationBackModifier())
    }
}

#Preview {
    StockPassPurchaseView()
        .environment(NavigationRouter())
}
