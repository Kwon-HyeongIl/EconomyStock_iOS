//
//  Color+AIGradient.swift
//  EconomyStock
//
//  Created by 권형일 on 12/8/24.
//

import SwiftUI

extension Color {
    static let aiGradient =
    LinearGradient(
        gradient: Gradient(stops: [
            Gradient.Stop(color: Color(hex: "FFFF88"), location: 0.0),
            Gradient.Stop(color: Color(hex: "E4AEFF"), location: 0.4),
            Gradient.Stop(color: Color(hex: "FFABAD"), location: 0.6),
            Gradient.Stop(color: Color(hex: "A4F3FF"), location: 1.0)
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
