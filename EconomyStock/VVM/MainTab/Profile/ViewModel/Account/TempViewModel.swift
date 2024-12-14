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
        self.user = try! AuthManager.shared.modelContainer.mainContext.fetch(FetchDescriptor<LocalUser>()).first
    }
    
    @MainActor
    func updatePercentage(num: Double) {
        print("1")
//        let fetchUser = try! AuthManager.shared.modelContainer.mainContext.fetch(FetchDescriptor<LocalUser>()).first
        self.user?.totalStudyingPercentage = num
//        fetchUser?.username = text
        print("2")
        do {
            print("3")
            try AuthManager.shared.modelContainer.mainContext.save()
            print("수정한 부분이 저장되었습니다.")
        } catch {
            print(error.localizedDescription)
        }
    }
}
