//
//  LottieRouter.swift
//  EconomyStock
//
//  Created by 권형일 on 11/20/24.
//

import Foundation

struct LottieRouter {
    static func speedRoute(fileName: String, speed: CGFloat) -> CGFloat {
        switch fileName {
            
        case "PriceLevelCourseCover":
            0.7
            
        case "UnEmploymentCourseCover":
            0.5
            
        default:
            speed
        }
    }
    
    // border 내부의 물체 크기
    static func scaleRoute(fileName: String, scale: CGFloat) -> CGFloat {
        switch fileName {
            
        case "PriceLevelCourseCover":
            0.9
            
        case "UnEmploymentCourseCover":
            0.65
            
        default:
            scale
        }
    }
}
