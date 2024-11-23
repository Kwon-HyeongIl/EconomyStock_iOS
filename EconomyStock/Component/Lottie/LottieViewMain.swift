//
//  LottieViewMain.swift
//  EconomyStock
//
//  Created by 권형일 on 11/20/24.
//

import SwiftUI
import Lottie

/**
 DotLottie(.lottie) 기반 Lottie 애니메이션 사용
 */
struct LottieViewMain: UIViewRepresentable {
    let url: URL
    let fileName: String
    let loopMode: LottieLoopMode
    let fromProgress: CGFloat
    let toProgress: CGFloat
    let speed: CGFloat
    
    func makeUIView(context: Context) -> some UIView {
        UIView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        let animationView = LottieAnimationView()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        uiView.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: uiView.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: uiView.heightAnchor)])
        
        DotLottieFile.loadedFrom(url: url) { result in
            switch result {
                
            case .success(let success):
                // 애니메이션 세팅
                animationView.loadAnimation(from: success)
                animationView.loopMode = loopMode
                animationView.animationSpeed = LottieRouter.speedRoute(fileName: fileName, speed: speed)
                animationView.play(fromProgress: fromProgress, toProgress: toProgress)
                
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
