//
//  StudyingCover.swift
//  EconomyStock
//
//  Created by 권형일 on 10/9/24.
//

import SwiftUI

struct StudyingCoverView: View {
    let title: String
    let titleSymbol: String
    let backgroundColor: Color
    
    var body: some View {
        VStack {
            Text(title)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(10)
    }
}

#Preview {
    StudyingCoverView(title: "물가", titleSymbol: "bitcoinsign", backgroundColor: .ESTitle)
}
