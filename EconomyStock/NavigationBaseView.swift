//
//  NavigationBaseView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/24/24.
//

import SwiftUI

struct NavigationBaseView: View {
    @State private var navRouter = NavigationRouter()
    @State private var mainTabCapsule = MainTabCapsule()
    @State private var courseListCapsule = CourseListCapsule()
    @State private var newsListCapsule = NewsListCapsule()
    @State private var loginCapsule = LoginCapsule()
    
    var body: some View {
        NavigationStack(path: $navRouter.path) {
            AisleView()
                .navigationDestination(for: NavigationDestinationPath.self) { view in
                    navRouter.destinationNavigate(to: view)
                }
                .preferredColorScheme(.light)
        }
        .environment(navRouter)
        .environment(mainTabCapsule)
        .environment(courseListCapsule)
        .environment(newsListCapsule)
        .environment(loginCapsule)
    }
}

#Preview {
    NavigationBaseView()
}
