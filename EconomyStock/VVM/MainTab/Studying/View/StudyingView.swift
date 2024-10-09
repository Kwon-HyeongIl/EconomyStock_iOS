//
//  StudyView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/4/24.
//

import SwiftUI

struct StudyingView: View {
    @Environment(NavigationRouter.self) var navigationRouter: NavigationRouter
    @State private var viewModel = StudyingViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.studyingItems) { item in
                        StudyingCoverView(title: item.title, lottieFileName: item.lottieFileName, backgroundColor: item.backgroundColor, isFinished: item.isFinihed)
                            .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
                            .onTapGesture {
                                navigationRouter.navigate(item.destination)
                            }
                    }
                }
            }
        }
        .modifier(NavigationTitleModifier(title: "학습"))
    }
}

#Preview {
    StudyingView()
        .environment(NavigationRouter())
}
