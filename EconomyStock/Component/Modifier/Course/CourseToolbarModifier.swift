//
//  CourseToolbarModifier.swift
//  EconomyStock
//
//  Created by 권형일 on 10/11/24.
//

import SwiftUI

struct CourseToolbarModifier: ViewModifier {
    let currentPage: Int
    let totalPage: Int
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("\(currentPage) / \(totalPage)")
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28)
                        .foregroundStyle(Color.ESTitle)
                }
            }
    }
}
