//
//  ProfileViewModel+Account.swift
//  EconomyStock
//
//  Created by 권형일 on 12/7/24.
//

import Foundation

extension ProfileViewModel {
    var formattedStartDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: remoteUser?.startDate ?? Date())
    }
    
    var loginType: LoginType {
        if remoteUser?.appleHashedUid != nil {
            return .apple
        } else if remoteUser?.googleHashedUid != nil {
            return .google
        } else if remoteUser?.kakaoHashedUid != nil {
            return .kakao
        } else {
            return .basic
        }
    }
}
