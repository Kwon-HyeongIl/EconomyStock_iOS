//
//  Course1View.swift
//  EconomyStock
//
//  Created by 권형일 on 10/9/24.
//

import SwiftUI

struct BasicEconomyCourseIntroductionView: View {
    @Environment(NavigationRouter.self) var navigationRouter: NavigationRouter
    @Environment(MainTabCapsule.self) var mainTabCapsule
    
    @State private var viewModel = BasicEconomyCourseViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                LottieViewConverter(fileName: "BasicEconomyCover", loopMode: .loop, width: 200, height: 200)
                
                ZStack {
                    Text("기초 경제")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .padding(.bottom)
                    
                    ProgressCircleView(progressRate: viewModel.progressRate)
                        .padding(.leading, 180)
                        .padding(.bottom)
                }
                
                Button {
                    navigationRouter.navigate(.Page1View)
                } label: {
                    Text("시작하기")
                        .modifier(ShortButtonModifier())
                        .padding(.bottom, 30)
                }
                
                VStack {
                    Text("내용 목차")
                }
                .modifier(TileModifier(height: 400))
            }
        }
        .modifier(NavigationBackModifier())
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    navigationRouter.popToRoot()
                    mainTabCapsule.selectedTab = .house
                } label: {
                    Image(systemName: "house")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28)
                        .foregroundStyle(Color.ESTitle)
                        .padding(.trailing, 5)
                }
            }
        }
        .scrollIndicators(.never)
        .environment(viewModel)
    }
}

#Preview {
    BasicEconomyCourseIntroductionView()
        .environment(NavigationRouter())
        .environment(MainTabCapsule())
}


