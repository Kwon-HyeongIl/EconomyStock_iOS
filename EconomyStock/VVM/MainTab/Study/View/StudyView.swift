//
//  StudyView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/4/24.
//

import SwiftUI

struct StudyView: View {
    @Environment(NavigationRouter.self) var navigationRouter: NavigationRouter
    @State private var viewModel = StudyViewModel()
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 0) {
                    StudyingCoverView(title: "물가", titleSymbol: "bitcoinsign", backgroundColor: .yellow)
                        .aspectRatio(1, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    
                    StudyingCoverView(title: "물가", titleSymbol: "bitcoinsign", backgroundColor: .yellow)
                        .aspectRatio(1, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    
                    StudyingCoverView(title: "물가", titleSymbol: "bitcoinsign", backgroundColor: .yellow)
                        .aspectRatio(1, contentMode: .fill)
                    
                    StudyingCoverView(title: "물가", titleSymbol: "bitcoinsign", backgroundColor: .yellow)
                        .aspectRatio(1, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                }
            }
        }
        .modifier(NavigationTitleModifier(title: "학습"))
    }
}

#Preview {
    StudyView()
        .environment(NavigationRouter())
}
