//
//  MainTab.swift
//  EconomyStock
//
//  Created by 권형일 on 10/4/24.
//

import Foundation

enum MainTab: String, CaseIterable {
    case house = "house"
    case textBookClosed = "text.book.closed"
    case newspaper = "newspaper"
    case person = "person"
    
    var title: String {
        switch self {
        case .house:
            "메인"
            
        case .textBookClosed:
            "개념"
            
        case .newspaper:
            "뉴스"
            
        case .person:
            "프로필"
        }
    }
}
