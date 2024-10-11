//
//  LottieSpeedRouter.swift
//  EconomyStock
//
//  Created by 권형일 on 10/11/24.
//

import Foundation

struct LottieRouter {
    static func speedRoute(fileName: String) -> CGFloat {
        switch fileName {
            
        case "PriceLevelCourseCover":
            0.7
            
        default:
            1.0
        }
    }
    
    static func scaleRoute(fileName: String) -> CGFloat {
        switch fileName {
            
        case "PriceLevelCourseCover":
            0.9
            
        default:
            1.0
        }
    }
}
