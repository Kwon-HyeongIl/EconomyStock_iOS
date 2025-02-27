//
//  CourseToolbarModifier.swift
//  EconomyStock
//
//  Created by 권형일 on 10/11/24.
//

import SwiftUI

struct CourseToolbarModifier: ViewModifier {
    @Environment(NavigationRouter.self) var navRouter
    @Environment(CourseListCapsule.self) var courseListViewCapule
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
                    HStack {
                        Button {
                            switch viewModel.course.type {
                                
                            case .basicEconomy:
                                navRouter.navigate(.ChatbotView(.basicEconomyCourse))
                            case .priceLevel:
                                navRouter.navigate(.ChatbotView(.priceLevelCourse))
                            case .unEmployment:
                                navRouter.navigate(.ChatbotView(.unEmploymentCourse))
                            case .moneyAndFinance:
                                navRouter.navigate(.ChatbotView(.moneyAndFinanceCourse))
                            case .exchangeRateAndBalanceOfPayment:
                                navRouter.navigate(.ChatbotView(.exchangeRateAndBalanceOfPaymentCourse))
                            }
                        } label: {
                            ZStack {
                                LottieView(fileName: "AIOrb", loopMode: .loop, speed: 1.4, width: 50, height: 50)
                                    .blur(radius: 1.5)
                                
                                Text("AI")
                                    .font(.system(size: 20, design: .rounded).bold())
                                    .foregroundStyle(.white)
                                    .shadow(color: .gray.opacity(0.8), radius: 1, x: 1, y: 1)
                            }
                        }
                        
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
            }
            .alert("정말 나가시겠습니까?", isPresented: $alertExit) {
                Button {
                    loadingBarState = true
                    
                    CourseManager.updateUserCoursePageRoute(type: viewModel.course.type, isEnd: false, currentPage: currentPage)
                    
                    // CourseListViewModel의 updateAllCourses 메서드 호출 (중간 인터페이스로 연결)
                    courseListViewCapule.isUpdateToggle.toggle()
        
                    navRouter.popToRoot()
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
