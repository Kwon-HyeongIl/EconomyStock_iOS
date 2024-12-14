//
//  TempViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 12/14/24.
//

import Foundation
import SwiftData

@Observable
class TempViewModel {
    var user: LocalUser?
    
    @MainActor
    init() {
        self.user = AuthManager.shared.localUser
    }
    
    @MainActor
    func updatePercentage(num: Double) {
        self.user?.totalStudyingPercentage = num
        
        do {
            try AuthManager.shared.modelContainer.mainContext.save()
            print("수정한 부분이 저장되었습니다.")
        } catch {
            print(error.localizedDescription)
        }
    }
}
