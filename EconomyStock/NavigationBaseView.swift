//
//  NavigationBaseView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/24/24.
//

import SwiftUI

struct NavigationBaseView: View {
    @State private var navigationRouter = NavigationRouter()
    @State private var mainTabCapsule = MainTabCapsule()
    
    // 강의 수강중 홈으로 나갔을 때, 수강중이던 특정 강의만 데이터 값들을 초기화 시키기 위함
    @State private var courseListViewModel = CourseListViewModel()
    
    var body: some View {
        NavigationStack(path: $navigationRouter.path) {
            AisleView()
                .navigationDestination(for: NavigationDestinationPath.self) { view in
                    navigationRouter.destinationNavigate(to: view)
                }
                .preferredColorScheme(.light)
        }
        .environment(navigationRouter)
        .environment(mainTabCapsule)
        .environment(courseListViewModel)
    }
}

#Preview {
    NavigationBaseView()
}
