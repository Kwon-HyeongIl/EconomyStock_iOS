//
//  CourseToolbarModifier.swift
//  EconomyStock
//
//  Created by 권형일 on 10/11/24.
//

import SwiftUI

struct CourseToolbarModifier: ViewModifier {
    @Environment(NavigationRouter.self) var navigationRouter
    @Environment(CourseListViewCapsule.self) var courseListViewCapule
    @Bindable var viewModel: CourseViewModel
    
    @State private var alertExit = false
    @State private var loadingBarState = false
    
    let currentPage: Int
    let totalPage: Int
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("\(currentPage) / \(totalPage)")
                        .font(.system(size: 21))
                        .fontWeight(.bold)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        alertExit = true
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                            .foregroundStyle(Color.ESTitle)
                    }
                }
            }
            .alert("정말 나가시겠습니까?", isPresented: $alertExit) {
                Button {
                    withAnimation(.smooth(duration: 0.2)) {
                        loadingBarState = true
                    }
                    
                    // 로컬 currentUser의 parmanentProgressPage 값 바꾸고 (기존의 값보다 큰 경우에만), 로컬 basicEconomyLastPage 값 변경
                    switch viewModel.course.type {
                        
                    case .basicEconomy:
                        if AuthManager.shared.currentUser?.studyingCourse.basicEconomyParmanentProgressPage ?? 0 < currentPage {
                            AuthManager.shared.currentUser?.studyingCourse.basicEconomyParmanentProgressPage = currentPage
                            
                            // DB User의 parmanentProgressPage 값 바꾸기 (기존의 값보다 큰 경우에만)
                            Task {
                                await AuthManager.shared.updateCourseParmanentProgressPage(courseType: viewModel.course.type, parmanentProgressPage: currentPage)
                            }
                        }
                        
                        // CurrentUser의 lastPage 값 바꾸기
                        AuthManager.shared.currentUser?.studyingCourse.basicEconomyLastPage = currentPage
                        
                    case .priceLevel:
                        if AuthManager.shared.currentUser?.studyingCourse.priceLevelParmanentProgressPage ?? 0 < currentPage {
                            AuthManager.shared.currentUser?.studyingCourse.priceLevelParmanentProgressPage = currentPage
                            
                            Task {
                                await AuthManager.shared.updateCourseParmanentProgressPage(courseType: viewModel.course.type, parmanentProgressPage: currentPage)
                            }
                        }
                        
                        AuthManager.shared.currentUser?.studyingCourse.priceLevelLastPage = currentPage
                        
                    case .unEmployment:
                        if AuthManager.shared.currentUser?.studyingCourse.unEmploymentParmanentProgressPage ?? 0 < currentPage {
                            AuthManager.shared.currentUser?.studyingCourse.unEmploymentParmanentProgressPage = currentPage
                            
                            Task {
                                await AuthManager.shared.updateCourseParmanentProgressPage(courseType: viewModel.course.type, parmanentProgressPage: currentPage)
                            }
                        }
                        
                        AuthManager.shared.currentUser?.studyingCourse.unEmploymentLastPage = currentPage
                        
                    case .moneyAndFinance:
                        if AuthManager.shared.currentUser?.studyingCourse.moneyAndFinanceParmanentProgressPage ?? 0 < currentPage {
                            AuthManager.shared.currentUser?.studyingCourse.moneyAndFinanceParmanentProgressPage = currentPage
                            
                            Task {
                                await AuthManager.shared.updateCourseParmanentProgressPage(courseType: viewModel.course.type, parmanentProgressPage: currentPage)
                            }
                        }
                        
                        AuthManager.shared.currentUser?.studyingCourse.moneyAndFinanceLastPage = currentPage
                        
                    case .exchangeRateAndBalanceOfPayment:
                        if AuthManager.shared.currentUser?.studyingCourse.exchangeRateAndBalanceOfPaymentParmanentProgressPage ?? 0 < currentPage {
                            AuthManager.shared.currentUser?.studyingCourse.exchangeRateAndBalanceOfPaymentParmanentProgressPage = currentPage
                            
                            Task {
                                await AuthManager.shared.updateCourseParmanentProgressPage(courseType: viewModel.course.type, parmanentProgressPage: currentPage)
                            }
                        }
                        
                        AuthManager.shared.currentUser?.studyingCourse.exchangeRateAndBalanceOfPaymentLastPage = currentPage
                    }
                    
                    // CourseListViewModel의 updateAllCourses 메서드 호출 (중간 인터페이스로 연결)
                    courseListViewCapule.isUpdate.toggle()
                    
                    // DB User의 lastPage 값 바꾸기
                    Task {
                        await AuthManager.shared.updateCourseLastPage(courseType: viewModel.course.type, lastPage: currentPage)
                    }
        
                    navigationRouter.popToRoot()
                } label: {
                    Text("확인")
                }
            } message: {
                Text("현재까지 진행한 내용은 자동으로 저장됩니다.")
            }
            .overlay {
                if loadingBarState {
                    LottieView(fileName: "Loading", loopMode: .loop, width: 200, height: 200)
                        .padding(.bottom, 60)
                }
            }
    }
}
