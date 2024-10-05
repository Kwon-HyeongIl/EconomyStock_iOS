//
//  SplashView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/1/24.
//

import SwiftUI

struct SplashView: View {
    @State private var isCharacterMovedUp = false
    @State private var isTitleLogoVisible = false

    var body: some View {
        ZStack {
            Color.ESTitle
            
            VStack {
                ZStack {
                    Image("ES_Chracter")
                        .resizable()
                        .scaledToFit()
                        .frame(width: isCharacterMovedUp ? 100 : 200)
                        .padding(.leading, 20)
                        .padding(.bottom, 30)
                        .offset(y: isCharacterMovedUp ? -50 : 0)
                        .animation(.easeOut(duration: 0.7), value: isCharacterMovedUp)
                    
                    Image("ES_TitleLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 240)
                        .opacity(isTitleLogoVisible ? 1 : 0)
                        .animation(.easeIn(duration: 0.7), value: isTitleLogoVisible)
                        .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 5)
                        .padding(.top, 40)
                }
                .padding(.bottom, 30)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    isCharacterMovedUp = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                        isTitleLogoVisible = true
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SplashView()
}
