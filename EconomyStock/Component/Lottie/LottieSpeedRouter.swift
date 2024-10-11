//
//  LottieSpeedRouter.swift
//  EconomyStock
//
//  Created by 권형일 on 10/11/24.
//

import Foundation

struct LottieSpeedRouter {
    static func route(fileName: String) -> CGFloat {
        switch fileName {
            
        case "PriceLevelCourseCover":
            0.5
            
        default:
            1.0
        }
    }
}
