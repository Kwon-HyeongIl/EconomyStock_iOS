//
//  SplashView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/1/24.
//

import SwiftUI

struct SplashView: View {
    @State private var isExpand = false
    @State private var isCharacterMovedUp = false
    @State private var isTitleLogoVisible = false

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.ESTitle)
                .frame(width: isExpand ? UIScreen.main.bounds.height * 2 : 100, height: isExpand ? UIScreen.main.bounds.height * 2 : 100)
                .scaleEffect(isExpand ? 1 : 0)
                .animation(.easeIn(duration: 1.5), value: isExpand)
                .onAppear {
                    isExpand = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        isCharacterMovedUp = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                            isTitleLogoVisible = true
                        }
                    }
                }
            
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
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SplashView()
}
