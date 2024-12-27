//
//  StockPassPurchaseViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 12/27/24.
//

import Foundation

@Observable
class StockPassPurchaseViewModel {
    var isLogin: Bool {
        AuthManager.shared.isLogin
    }
    
    func purchase() async -> Bool {
        let result = await IAPManager.shared.purchase()
        
        if result {
            return await IAPManager.shared.updateStockPassState()
            
        } else {
            return false
        }
    }
}
