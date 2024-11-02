//
//  LottieSpeedRouter.swift
//  EconomyStock
//
//  Created by 권형일 on 10/11/24.
//

import Foundation

/**
 하나의 뷰를 재사용할 경우 개별적으로 다른 값을 넣을수가 없으므로,
 이렇게 로티 파일 이름별로 라우팅을 거쳐서 특정한 설정을 적용
 */
struct LottieRouter {
    static func speedRoute(fileName: String) -> CGFloat {
        switch fileName {
            
        case "PriceLevelCourseCover":
            0.7
            
        default:
            1.0
        }
    }
    
    // border 내부의 물체 크기
    static func scaleRoute(fileName: String) -> CGFloat {
        switch fileName {
            
        case "PriceLevelCourseCover":
            0.9
            
        default:
            1.0
        }
    }
}
