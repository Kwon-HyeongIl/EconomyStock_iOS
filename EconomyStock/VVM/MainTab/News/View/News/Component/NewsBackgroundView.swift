//
//  NewsBackgroundView.swift
//  EconomyStock
//
//  Created by 권형일 on 12/31/24.
//

import SwiftUI

struct NewsBackgroundView: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .frame(width: 50, height: 30)
                    .foregroundStyle(.black.opacity(0.2))
                
                VStack {
                    Text("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT")
                    
                    Text("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT")
                    
                    Text("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT")
                    
                    Text("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT")
                }
                .font(.system(size: 6))
                .foregroundStyle(.black.opacity(0.5))
            }
            
            HStack {
                VStack {
                    Text("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT")
                    
                    Text("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT")
                    
                    Text("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT")
                    
                    Text("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT")
                }
                .font(.system(size: 6))
                .foregroundStyle(.black.opacity(0.5))
                
                Rectangle()
                    .frame(width: 50, height: 30)
                    .foregroundStyle(.black.opacity(0.2))
            }
        }
        .redacted(reason: .placeholder)
        .frame(width: 200, height: 90)
        .background(Color(hex: "A4A4A4"))
    }
}

#Preview {
    NewsBackgroundView()
}
