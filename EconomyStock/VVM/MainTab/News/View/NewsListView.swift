//
//  NewsView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/4/24.
//

import SwiftUI

struct NewsListView: View {
    @Environment(LoginCapsule.self) var loginCapsule
    @Environment(NewsListCapsule.self) var newsListCapsule
    @State private var viewModel = NewsListViewModel()
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                
                HStack {
                    Text("뉴스")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .padding(.leading)
                    
                    Spacer()
                }
                .padding(.bottom, 5)
            }
            .frame(height: 100)
            
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(viewModel.newsList) { news in
                        NewsCoverView(news: news)
                            .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
                            .padding(.bottom, news.type == CourseAndNewsType.exchangeRateAndBalanceOfPayment ? 70 : 0)
                    }
                }
            }
            .scrollIndicators(.never)
        }
        .ignoresSafeArea(edges: .top)
        .onChange(of: newsListCapsule.isUpdateToggle) {
            viewModel.updateAllCourses()
        }
        .onChange(of: loginCapsule.isLoginToggle) {
            viewModel.updateAllCourses()
        }
        .onAppear {
            if viewModel.isFirstLoad {
                viewModel.updateAllCourses()
                viewModel.isFirstLoad = false
            }
        }
    }
}

#Preview {
    NewsListView()
        .environment(NavigationRouter())
        .environment(LoginCapsule())
        .environment(NewsListCapsule())
}
