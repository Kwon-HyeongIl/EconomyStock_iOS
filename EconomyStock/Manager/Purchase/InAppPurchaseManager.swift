//
//  InAppPurchaseManager.swift
//  EconomyStock
//
//  Created by 권형일 on 12/26/24.
//

import SwiftUI
import StoreKit

@MainActor
@Observable
class InAppPurchaseManager {
    private let productID = "KHI.stockpass.product"

    /// 실제 StoreKit2 Product
    var myProduct: Product? = nil
    
    /// 구매 여부
    var isPurchased: Bool = false
    
    /// 초기화 시점 또는 필요 시점에 상품 정보를 가져옵니다.
    init() {
        Task {
            await requestProduct()      // 상품 로드
            await updatePurchasedState() // 이미 구매한 상태인지 확인
        }
    }
    
    /// 단일 상품 가져오기
    func requestProduct() async {
        do {
            // 등록해둔 productID에 해당하는 Product를 요청
            let products = try await Product.products(for: [productID])
            
            // 실제 등록해둔 상품이 있어야 하며, 여기서는 1개만 있다고 가정
            guard let product = products.first else {
                print("상품을 찾을 수 없습니다.")
                return
            }
            
            self.myProduct = product
            
        } catch {
            print("상품 정보를 불러오는 도중 에러: \(error.localizedDescription)")
        }
    }
    
    /// 이미 구매했는지(Entitlement 보유 중인지) 확인
    func updatePurchasedState() async {
        for await result in Transaction.currentEntitlements {
            if case .verified(let transaction) = result {
                if transaction.productID == productID {
                    isPurchased = true
                    return
                }
            }
        }
        
        isPurchased = false
    }
    
    func purchase() async {
        guard let product = myProduct else { return }
        do {
            let result = try await product.purchase()
            
            switch result {
                
            case .success(let verification):
                if let transaction = checkVerified(verification) {
                    await updatePurchasedState()

                    await transaction.finish()
                }
                
            case .userCancelled:
                print("사용자가 구매를 취소했습니다.")
                
            case .pending:
                print("거래가 보류(Pending) 상태입니다.")
                
            @unknown default:
                break
            }
            
        } catch {
            print("구매 도중 에러 발생: \(error.localizedDescription)")
        }
    }
    
    

    /// 트랜잭션 검증 함수
    private func checkVerified<T>(_ result: VerificationResult<T>) -> T? {
        switch result {
        case .unverified:
            // 서명이 유효하지 않은 경우 (취소 처리)
            return nil
        case .verified(let safe):
            return safe
        }
    }
    
    func restore() async {
        do {
            try await AppStore.sync()
            await updatePurchasedState()
        } catch {
            print("Restore(동기화) 도중 에러: \(error)")
        }
    }
}
