//
//  NewsIntroView.swift
//  EconomyStock
//
//  Created by 권형일 on 12/31/24.
//

import SwiftUI

struct NewsIntroView: View {
    @Bindable var viewModel: NewsViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NewsIntroView(viewModel: NewsViewModel(news: News.DUMMY_NEWS))
}
