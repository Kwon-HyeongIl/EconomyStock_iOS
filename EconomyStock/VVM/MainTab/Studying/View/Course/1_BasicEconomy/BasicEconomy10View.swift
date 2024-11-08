//
//  BasicEconomy10View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/7/24.
//

import SwiftUI

struct BasicEconomy10View: View {
    var body: some View {
        if true {
            HStack {
                Text("국민소득 3면 등가의 법칙")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .padding(.top, 30)
                    .padding(.leading, 30)
                
                Spacer()
            }
            
            ZStack {
                VStack {
                    VStack(spacing: 0) {
                        LottieViewConverter(fileName: "BasicEconomy2_Distribution", loopMode: .playOnce, width: 110, height: 110)
                        
                        Text("분배")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.ESTitle)
                    }
                    
                    HStack {
                        VStack(spacing: 0) {
                            LottieViewConverter(fileName: "BasicEconomy2_Factory", loopMode: .playOnce, width: 110, height: 110)
                                .padding(.leading, 30)
                            
                            Text("생산")
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.ESTitle)
                        }
                        
                        Spacer()
                        
                        VStack(spacing: 0) {
                            LottieViewConverter(fileName: "BasicEconomy2_Payment", loopMode: .playOnce, toProgress: 0.745, width: 110, height: 110)
                                .padding(.trailing, 30)
                            
                            Text("지출")
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.ESTitle)
                        }
                    }
                    .padding(.top, 40)
                }
                
                if true { // rotate
                    VStack {
                        HStack(spacing: 60) {
                            Image(systemName: "equal")
                                .frame(width: 30, height: 30)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.ESTitle)
                                .rotationEffect(.degrees(-45))
                                .scaleEffect(2.0)
                            
                            Image(systemName: "equal")
                                .frame(width: 30, height: 30)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.ESTitle)
                                .rotationEffect(.degrees(45))
                                .scaleEffect(2.0)
                        }
                        .padding(.top, 100)
                        
                        Image(systemName: "equal")
                            .frame(width: 30, height: 30)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.ESTitle)
                            .padding(.top, 20)
                            .scaleEffect(2.0)
                    }
                }
            }
            .padding(.top, 20)
        }
    }
}

#Preview {
    BasicEconomy10View()
}
