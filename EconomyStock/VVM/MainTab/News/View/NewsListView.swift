//
//  NewsView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/4/24.
//

import SwiftUI

struct NewsListView: View {
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
                
            }
            .scrollIndicators(.never)
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    NewsListView()
}
