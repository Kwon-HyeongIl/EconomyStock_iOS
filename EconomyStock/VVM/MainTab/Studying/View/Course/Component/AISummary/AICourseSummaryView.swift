//
//  AICourseSummaryView.swift
//  EconomyStock
//
//  Created by 권형일 on 12/10/24.
//

import SwiftUI

struct AICourseSummaryView: View {
    @Environment(NavigationRouter.self) var navRouter
    @State private var viewModel: AICourseSummaryViewModel
    
    @State private var defaultText = "AI 톡톡이가 이번 장의 내용을 요약하고있어요☺️"
    @State private var isAILoading = true
    @Binding var isCompletePopupAppear: Bool
    
    init(type: CourseType, isCompletePopupAppear: Binding<Bool>) {
        self.viewModel = AICourseSummaryViewModel(type: type)
        self._isCompletePopupAppear = isCompletePopupAppear
    }
    
    var body: some View {
        VStack {
            VStack {
                ZStack {
                    ScrollView {
                        VStack {
                            HStack(spacing: 0) {
                                ZStack {
                                    LottieView(fileName: "AIOrb", loopMode: .loop, speed: 1.4, width: 80, height: 80)
                                        .blur(radius: 1.5)
                                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                                    
                                    Image("Chatbot_Toktok")
                                        .resizable()
                                        .frame(width: 50, height: 45)
                                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 5, y: 5)
                                }
                                .padding(.top, 13)
                                
                                HStack {
                                    Text(defaultText)
                                        .font(.system(size: 16))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                        .padding()
                                }
                                .background(.regularMaterial)
                                .cornerRadius(20, corners: .allCorners)
                                .shadow(color: .gray.opacity(0.1), radius: 10, x: 5, y: 5)
                                .padding(.top)
                                .padding(.trailing)
                            }
                            
                            Text(viewModel.displayedText)
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                                .padding()
                                .padding(.bottom, 70)
                        }
                    }
                    .scrollIndicators(.never)
                    .overlay {
                        if isAILoading {
                            LottieView(fileName: "AISparkle", loopMode: .loop, width: 100, height: 100)
                        }
                    }
                    
                    VStack {
                        Spacer()
                        
                        if viewModel.isDisplayTextEnd {
                            HStack(spacing: 15) {
                                Button {
                                    navRouter.navigate(.ChatbotView(viewModel.chatbotEntranceType))
                                } label: {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 120, height: 25)
                                        .foregroundStyle(Color.aiGradient)
                                        .overlay {
                                            Text("더 질문해보기")
                                                .font(.system(size: 12))
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)
                                                .shadow(color: .gray.opacity(0.8), radius: 1, x: 1, y: 1)
                                        }
                                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
                                }
                                
                                Button {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        self.isCompletePopupAppear = true
                                    }
                                } label: {
                                    Circle()
                                        .frame(width: 45, height: 45)
                                        .foregroundStyle(Color.ESTitle)
                                        .overlay {
                                            Text("끝내기")
                                                .font(.system(size: 11))
                                                .foregroundStyle(.white)
                                                .fontWeight(.semibold)
                                        }
                                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
                                }
                            }
                            .padding(.bottom)
                        }
                    }
                }
            }
            .frame(width: 320, height: 520)
            .background(LottieView(fileName: "AIBackground", loopMode: .loop, scale: 1.15, width: 320, height: 520)
                .opacity(0.4))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .frame(width: 320, height: 520)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation(.smooth(duration: 1.0)) {
                    self.isAILoading = false
                    
                    viewModel.startStreamingText()
                }
            }
        }
        .onDisappear {
            viewModel.cancellable?.cancel()
        }
        .onChange(of: isAILoading) {
            withAnimation(.smooth(duration: 1.0)) {
                defaultText = "AI 톡톡이가 이번 장의 내용을 요약해봤어요☺️"
            }
        }
    }
}

#Preview {
    AICourseSummaryView(type: .basicEconomy, isCompletePopupAppear: .constant(false))
        .environment(NavigationRouter())
}
