//
//  LottieView.swift
//  EconomyStock
//
//  Created by 권형일 on 10/5/24.
//

import SwiftUI
import Lottie

struct LottieViewRouter: UIViewRepresentable {
    let fileName: String
    let loopMode: LottieLoopMode
    var toProgress: CGFloat

    init(fileName: String, loopMode: LottieLoopMode, toProgress: CGFloat = 1.0) {
        self.fileName = fileName
        self.loopMode = loopMode
        self.toProgress = toProgress
    }
    
    func makeUIView(context: Context) -> UIView {
        let containerView = UIView()
        let animationView = LottieAnimationView(name: fileName)
        
        animationView.loopMode = loopMode
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
