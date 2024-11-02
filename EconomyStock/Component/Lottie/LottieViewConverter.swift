//
//  LottieViewConverter.swift
//  EconomyStock
//
//  Created by 권형일 on 11/3/24.
//

import SwiftUI
import Lottie

struct LottieViewConverter: View {
    let fileName: String
    let loopMode: LottieLoopMode
    var toProgress: CGFloat = 1.0
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        VStack {
            LottieViewMain(fileName: fileName, loopMode: loopMode, toProgress: toProgress)
                .scaleEffect(LottieRouter.scaleRoute(fileName: fileName))
        }
        .frame(width: width, height: height) // border 사이즈
    }
}
