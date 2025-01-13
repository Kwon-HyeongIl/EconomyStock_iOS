//
//  BasicEconomyNewsView.swift
//  EconomyStock
//
//  Created by 권형일 on 1/12/25.
//

import SwiftUI

struct BasicEconomyNewsView: View {
    @Bindable var viewModel: NewsViewModel
    
    var body: some View {
        VStack {
            VStack {
                Text("톡톡신문")
                    .font(.system(size: 30).bold())
                    .foregroundStyle(.white)
                    .padding(.top, 20)
                
                HStack {
                    Spacer()
                    
                    Text("20XX년 XX월 XX일")
                        .font(.system(size: 10))
                        .foregroundStyle(.black.opacity(0.5))
                        .padding(.trailing)
                }
                
                Rectangle()
                    .frame(height: 3)
                    .padding(.horizontal)
                    .foregroundStyle(.gray)
                    
                Text("소비•투자 활황... 국민소득 5% 증가")
                    .font(.system(size: 20).bold())
                    .foregroundStyle(.white)
                    .padding(.top, 10)
                
                
                
                
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "A4A4A4"))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 3)
                    .foregroundStyle(Color(hex: "4d4d4d"))
            }
            .padding()
        }
        .modifier(NewsToolbarModifier(viewModel: viewModel))
    }
}

#Preview {
    BasicEconomyNewsView(viewModel: NewsViewModel(news: News.DUMMY_NEWS))
        .environment(NavigationRouter())
        .environment(NewsListCapsule())
}
