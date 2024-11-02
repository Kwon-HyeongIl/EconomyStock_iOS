//
//  CourseRightButtonModifier.swift
//  EconomyStock
//
//  Created by 권형일 on 11/2/24.
//

import SwiftUI

struct CourseMoveButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20))
            .scaledToFit()
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .frame(width: 80, height: 25)
            .padding()
            .background(Color.ESTitle)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
    }
}
