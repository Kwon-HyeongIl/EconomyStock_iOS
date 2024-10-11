//
//  LottieSpeedRouter.swift
//  EconomyStock
//
//  Created by 권형일 on 10/11/24.
//

import Foundation

struct LottieSpeedRouter {
    static func route(fileName: String) -> Double {
        switch fileName {
            
        case "PriceCourseCover":
            0.5
            
        default:
            1.0
        }
    }
}
