//
//  ESBackgroundView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/1/24.
//

import SwiftUI

struct ESBackgroundView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Color(red: 240/255, green: 232/255, blue: 223/255)
            .ignoresSafeArea(edges: .vertical)
            .opacity(0.8)
            
            content
        }
        .preferredColorScheme(.light)
    }
}

#Preview {
    ESBackgroundView {
        Text("DUMMY")
    }
}
