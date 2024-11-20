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
    
    @State private var alertAskLogin = false
    @State private var alertAskStartContinue = false
    @State private var alertAskStartBeginning = false
    @State private var alertFinishing = false
    
    var body: some View {
        GeometryReader { proxy in
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
                        // 로그인 안한 사용자일 경우 로그인 페이지로 이동
                        if AuthManager.shared.currentUser == nil {
                            
                        }
                            
                        switch viewModel.course.type {
                            
                        case .basicEconomy:
                            if viewModel.course.lastPage == 0 {
                                navigationRouter.navigate(.BasicEconomy1View(viewModel))
                                
                            } else if viewModel.course.lastPage == 11 {
                                alertFinishing = true
                                
                            } else {
                                alertAskStartContinue = true
                            }
                            
                        case .priceLevel:
                            if viewModel.course.lastPage == 0 {
                                navigationRouter.navigate(.PriceLevel1View(viewModel))
                                
                            } else if viewModel.course.lastPage == 10 {
                                alertFinishing = true
                                
                            } else {
                                alertAskStartContinue = true
                            }
                            
                        case .unEmployment:
                            if viewModel.course.lastPage == 0 {
                                navigationRouter.navigate(.UnEmployment1View(viewModel))
                                
                            } else if viewModel.course.lastPage == 7 {
                                alertFinishing = true
                                
                            } else {
                                alertAskStartContinue = true
                            }
                            
                        case .moneyAndFinance:
                            if viewModel.course.lastPage == 0 {
                                navigationRouter.navigate(.MoneyAndFinance1View(viewModel))
                                
                            } else if viewModel.course.lastPage == 23 {
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
                    .alert("로그인이 필요한 서비스입니다", isPresented: $alertFinishing) {
                        Button(role: .cancel) {
                            
                        } label: {
                            Text("취소")
                        }
                        
                        Button {
                            navigationRouter.navigate(.LoginView)
                        } label: {
                            Text("확인")
                        }
                    } message: {
                        Text("로그인 페이지로 이동하시겠습니까?")
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
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                                    
                                    navigationRouter.navigate(.BasicEconomy2View(viewModel))
                                    
                                case 3:
                                    viewModel.currentPage = 3
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                                    
                                    navigationRouter.navigate(.BasicEconomy3View(viewModel))
                                    
                                case 4:
                                    viewModel.currentPage = 4
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                                    
                                    navigationRouter.navigate(.BasicEconomy4View(viewModel))
                                    
                                case 5:
                                    viewModel.currentPage = 5
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy4View(viewModel))
                                    
                                    navigationRouter.navigate(.BasicEconomy5View(viewModel))
                                    
                                case 6:
                                    viewModel.currentPage = 6
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy4View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy5View(viewModel))
                                    
                                    navigationRouter.navigate(.BasicEconomy6View(viewModel))
                                    
                                case 7:
                                    viewModel.currentPage = 7
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy4View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy5View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy6View(viewModel))
                                    
                                    navigationRouter.navigate(.BasicEconomy7View(viewModel))
                                    
                                case 8:
                                    viewModel.currentPage = 8
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy4View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy5View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy6View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy7View(viewModel))
                                    
                                    navigationRouter.navigate(.BasicEconomy8View(viewModel))
                                    
                                case 9:
                                    viewModel.currentPage = 9
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy4View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy5View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy6View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy7View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy8View(viewModel))
                                    
                                    navigationRouter.navigate(.BasicEconomy9View(viewModel))
                                    
                                case 10:
                                    viewModel.currentPage = 10
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy4View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy5View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy6View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy7View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy8View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy9View(viewModel))
                                    
                                    navigationRouter.navigate(.BasicEconomy10View(viewModel))
                                    
                                case 11:
                                    viewModel.currentPage = 11
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy1View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy2View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy3View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy4View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy5View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy6View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy7View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy8View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy9View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.BasicEconomy10View(viewModel))
                                    
                                    navigationRouter.navigate(.BasicEconomy11View(viewModel))
                                    
                                default:
                                    navigationRouter.navigate(.BasicEconomy1View(viewModel))
                                }
                                
                            case .priceLevel:
                                switch viewModel.course.lastPage {
                                    
                                case 1:
                                    navigationRouter.navigate(.PriceLevel1View(viewModel))
                                    
                                case 2:
                                    viewModel.currentPage = 2
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                                    
                                    navigationRouter.navigate(.PriceLevel2View(viewModel))
                                    
                                case 3:
                                    viewModel.currentPage = 3
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                                    
                                    navigationRouter.navigate(.PriceLevel3View(viewModel))
                                    
                                case 4:
                                    viewModel.currentPage = 4
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel3View(viewModel))
                                    
                                    navigationRouter.navigate(.PriceLevel4View(viewModel))
                                    
                                case 5:
                                    viewModel.currentPage = 5
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel3View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel4View(viewModel))
                                    
                                    navigationRouter.navigate(.PriceLevel5View(viewModel))
                                    
                                case 6:
                                    viewModel.currentPage = 6
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel3View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel4View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel5View(viewModel))
                                    
                                    navigationRouter.navigate(.PriceLevel6View(viewModel))
                                    
                                case 7:
                                    viewModel.currentPage = 7
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel3View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel4View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel5View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel6View(viewModel))
                                    
                                    navigationRouter.navigate(.PriceLevel7View(viewModel))
                                    
                                case 8:
                                    viewModel.currentPage = 8
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel3View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel4View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel5View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel6View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel7View(viewModel))
                                    
                                    navigationRouter.navigate(.PriceLevel8View(viewModel))
                                    
                                case 9:
                                    viewModel.currentPage = 9
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel3View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel4View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel5View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel6View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel7View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel8View(viewModel))
                                    
                                    navigationRouter.navigate(.PriceLevel9View(viewModel))
                                    
                                case 10:
                                    viewModel.currentPage = 10
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel1View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel2View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel3View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel4View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel5View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel6View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel7View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel8View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.PriceLevel9View(viewModel))
                                    
                                    navigationRouter.navigate(.PriceLevel10View(viewModel))
                                    
                                default:
                                    navigationRouter.navigate(.PriceLevel1View(viewModel))
                                }
                                
                            case .unEmployment:
                                switch viewModel.course.lastPage {
                                    
                                case 1:
                                    navigationRouter.navigate(.UnEmployment1View(viewModel))
                                    
                                case 2:
                                    viewModel.currentPage = 2
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.UnEmployment1View(viewModel))
                                    
                                    navigationRouter.navigate(.UnEmployment2View(viewModel))
                                    
                                case 3:
                                    viewModel.currentPage = 3
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.UnEmployment1View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.UnEmployment2View(viewModel))
                                    
                                    navigationRouter.navigate(.UnEmployment3View(viewModel))
                                    
                                case 4:
                                    viewModel.currentPage = 4
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.UnEmployment1View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.UnEmployment2View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.UnEmployment3View(viewModel))
                                    
                                    navigationRouter.navigate(.UnEmployment4View(viewModel))
                                    
                                case 5:
                                    viewModel.currentPage = 5
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.UnEmployment1View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.UnEmployment2View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.UnEmployment3View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.UnEmployment4View(viewModel))
                                    
                                    navigationRouter.navigate(.UnEmployment5View(viewModel))
                                    
                                case 6:
                                    viewModel.currentPage = 6
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.UnEmployment1View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.UnEmployment2View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.UnEmployment3View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.UnEmployment4View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.UnEmployment5View(viewModel))
                                    
                                    navigationRouter.navigate(.UnEmployment6View(viewModel))
                                    
                                case 7:
                                    viewModel.currentPage = 7
                                    
                                    navigationRouter.path.append(NavigationDestinationPath.UnEmployment1View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.UnEmployment2View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.UnEmployment3View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.UnEmployment4View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.UnEmployment5View(viewModel))
                                    navigationRouter.path.append(NavigationDestinationPath.UnEmployment6View(viewModel))
                                    
                                    navigationRouter.navigate(.UnEmployment7View(viewModel))
                                    
                                default:
                                    navigationRouter.navigate(.UnEmployment1View(viewModel))
                                }
                                
                            case .moneyAndFinance:
                                switch viewModel.course.lastPage {
                                case 1:
                                    navigationRouter.navigate(.MoneyAndFinance1View(viewModel))
                                default:
                                    navigationRouter.navigate(.MoneyAndFinance1View(viewModel))
                                }
                            }
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
                                navigationRouter.navigate(.BasicEconomy1View(viewModel))
                            case .priceLevel:
                                navigationRouter.navigate(.PriceLevel1View(viewModel))
                            case .unEmployment:
                                navigationRouter.navigate(.UnEmployment1View(viewModel))
                            case .moneyAndFinance:
                                navigationRouter.navigate(.MoneyAndFinance1View(viewModel))
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
                                navigationRouter.navigate(.BasicEconomy1View(viewModel))
                            case .priceLevel:
                                navigationRouter.navigate(.PriceLevel1View(viewModel))
                            case .unEmployment:
                                navigationRouter.navigate(.UnEmployment1View(viewModel))
                            case .moneyAndFinance:
                                navigationRouter.navigate(.MoneyAndFinance1View(viewModel))
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
                            VStack(spacing: 20) {
                                Text("본격적인 경제 공부를 하기 전에, 이번시간에는 우리 경제에서 경제활동을 하는 주체는 누구인지, 그리고 GDP의 의미와 구성요소에 대해 알아볼게요.")
                                    .font(.system(size: 18))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 20)
                                    .padding(.top)
                                
                                Spacer()
                            }
                            
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
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: proxy.size.height / 2.1)
                    .background(.ultraThickMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal, 10)
                    .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
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
