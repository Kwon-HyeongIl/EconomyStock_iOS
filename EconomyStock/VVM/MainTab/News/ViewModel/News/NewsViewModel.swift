//
//  NewsViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 12/31/24.
//

import Foundation

@Observable
class NewsViewModel: Hashable, Equatable {
    let news: News
    
    var currentPage = 1
    
    var isLogin: Bool {
        AuthManager.shared.isLogin
    }
    
    var remoteUserStockPass: Bool {
        AuthManager.shared.remoteUser?.isStockPass ?? false
    }
    
    init(news: News) {
        self.news = news
    }
    
    static func == (lhs: NewsViewModel, rhs: NewsViewModel) -> Bool {
        lhs.news.id == rhs.news.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(news.id)
    }
}
