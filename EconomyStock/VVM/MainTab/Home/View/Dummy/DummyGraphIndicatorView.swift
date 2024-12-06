//
//  GraphIndicatorDummyView.swift
//  EconomyStock
//
//  Created by 권형일 on 12/6/24.
//

import SwiftUI
import Shimmer

struct DummyGraphIndicatorView: View {
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Text("DUMMYDUMMY")
                    .font(.system(size: 25).bold())
                    .fixedSize()
                
                Text("DUMMY")
                    .font(.system(size: 21).bold())
                    .padding(.leading, 13)
                    .padding(.trailing, 5)
                
                Text("DUMMYDUM")
                    .font(.system(size: 14))
                
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 200)
                .foregroundStyle(.black)
                .opacity(0.15)
        }
        .frame(height: 250)
        .frame(maxWidth: .infinity)
        .padding()
        .background(.gray.opacity(0.25))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .blur(radius: 1.0)
        .redacted(reason: .placeholder)
        .shimmering(bandSize: 0.4)
    }
}

#Preview {
    DummyGraphIndicatorView()
}

