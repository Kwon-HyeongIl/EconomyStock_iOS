//
//  SplashView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/1/24.
//

import SwiftUI

struct SplashView: View {

    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                Image("ES_TitleLogo_Blue")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
            }
            .padding(.bottom, 30)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SplashView()
}
