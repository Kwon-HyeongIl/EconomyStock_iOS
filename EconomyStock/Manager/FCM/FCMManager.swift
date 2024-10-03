//
//  FCMManager.swift
//  EconomyStock
//
//  Created by 권형일 on 10/2/24.
//

import Foundation

@Observable
class FCMManager {
    static let shared = FCMManager()
    
    var myDeviceToken: String?
    var googleAccessToken: String?
}
