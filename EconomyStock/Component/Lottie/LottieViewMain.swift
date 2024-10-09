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
    var toProgress: CGFloat
    
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

struct LottieViewConverter: View {
    let fileName: String
    let loopMode: LottieLoopMode
    var toProgress: CGFloat = 1.0
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        VStack {
            LottieViewMain(fileName: fileName, loopMode: loopMode, toProgress: toProgress)
        }
        .frame(width: width, height: height)
    }
}
