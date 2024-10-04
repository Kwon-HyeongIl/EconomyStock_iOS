//
//  RoundCorner.swift
//  EconomyStock
//
//  Created by 권형일 on 10/4/24.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundCorner(radius: radius, corners: corners))
    }
}
