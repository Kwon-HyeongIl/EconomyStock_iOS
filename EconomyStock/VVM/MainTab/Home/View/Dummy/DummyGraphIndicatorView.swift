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
            HStack {
                Text("기준금리")
                    .font(.system(size: 23).bold())
                    .fixedSize()
                
                    Text("DUMMY")
                    .font(.system(size: 21).bold())
                    .padding(.leading, 13)
                    .padding(.trailing, 5)
                    .padding(.bottom, 2)
                
                    VStack {
                        Text("DUMMYDUMMY")
                            .font(.system(size: 14))
                        
                        Text("DUMMYDUMMMYDUMMY")
                            .font(.system(size: 8))
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                    }

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
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .blur(radius: 1.0)
        .redacted(reason: .placeholder)
        .shimmering(bandSize: 0.4)
    }
}

#Preview {
    DummyGraphIndicatorView()
}

