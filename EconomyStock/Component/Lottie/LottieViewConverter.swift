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
    var toProgress: CGFloat = 1.0 // 기본값 1.0
    var speed: CGFloat = 1.0 // 기본값 1.0
    var scale: CGFloat = 1.0 // 기본값 1.0
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        VStack {
            LottieViewMain(fileName: fileName, loopMode: loopMode, toProgress: toProgress, speed: speed)
                .scaleEffect(LottieRouter.scaleRoute(fileName: fileName, scale: scale))
        }
        .frame(width: width, height: height) // border 사이즈
    }
}
