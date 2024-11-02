//
//  LottieView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/5/24.
//

import SwiftUI
import Lottie

struct LottieViewMain: UIViewRepresentable {
    let fileName: String
    let loopMode: LottieLoopMode
    let toProgress: CGFloat
    let speed: CGFloat
    
    func makeUIView(context: Context) -> UIView {
        let containerView = UIView()
        let animationView = LottieAnimationView(name: fileName)
        
        animationView.loopMode = loopMode
        animationView.animationSpeed = LottieRouter.speedRoute(fileName: fileName, speed: speed)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        ])
        
        animationView.play(fromProgress: 0, toProgress: toProgress)
        
        return containerView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}
