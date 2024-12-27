//
//  StockPassPurchaseView.swift
//  EconomyStock
//
//  Created by 권형일 on 12/27/24.
//

import SwiftUI

struct StockPassPurchaseView: View {
    @State private var imageOpacity = 0.6
    
    var body: some View {
        ZStack {
            LottieView(fileName: "CampingBackground", loopMode: .loop, speed: 0.3, width: 400, height: 720)
                .scaleEffect(1.3)
            
            Image("Basic_Toktok")
                .resizable()
                .scaledToFit()
                .frame(width: 120)
                .opacity(imageOpacity)
                .padding(.top, 300)
                .padding(.trailing, 220)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.71) {
                        withAnimation(Animation.easeInOut(duration: 0.945).repeatForever(autoreverses: true)) {
                            self.imageOpacity = 0.3
                        }
                    }
                }
            
            VStack {
                ZStack {
                    LottieView(fileName: "StageLightEffect", loopMode: .loop, width: 300, height: 300)
                    
                    Image("StockPass_Ticket")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350)
                }
                .padding(.top, 30)
                
                VStack {
                    Text("스톡패스")
                        .font(.system(size: 20).bold())
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex: "e2bf55"))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 4)
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 65)
            }
        }
    }
}

#Preview {
    StockPassPurchaseView()
}
