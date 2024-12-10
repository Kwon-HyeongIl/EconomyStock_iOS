//
//  AICourseSummaryViewModel.swift
//  EconomyStock
//
//  Created by 권형일 on 12/10/24.
//

import SwiftUI
import Combine

@Observable
class AICourseSummaryViewModel {
    let type: CourseType
    var chatbotEntranceType: ChatbotEntranceType = .main
    
    var displayedText = ""
    var baseText = ""
    var isDisplayTextEnd = false
    
    var cancellable: AnyCancellable?
    
    init(type: CourseType) {
        self.type = type
        initBaseText()
    }
    
    private func initBaseText() {
        switch type {
            
        case .basicEconomy:
            self.baseText = "어느 작은 마을에는 사람의 발길이 닿지 않은 오래된 숲이 있었다. 숲은 세월의 흔적을 고스란히 간직한 채 마치 시간의 흐름에서 벗어난 듯한 모습을 하고 있었다. 높이 솟은 나무들은 하늘을 가릴 만큼 우거져 있었고, 그 아래에는 이름 모를 꽃들이 피어나 은은한 향기를 뿜어내고 있었다. 숲 깊숙이 들어가면 맑은 물소리가 들려왔는데, 이는 계곡에서 흘러내리는 물줄기가 바위를 타고 부딪히며 만들어낸 자연의 선율이었다.\n\n그 숲에는 오랜 전설이 하나 내려오고 있었다. 전설에 따르면 숲의 가장 깊은 곳, 아무도 닿을 수 없을 것 같은 어두운 숲 한가운데에는 소원을 이루어주는 오래된 나무가 있다고 했다. 나무는 하얗게 빛나는 잎사귀를 가지고 있으며, 사람의 마음 속 진실된 소원만을 들을 수 있다고 했다.\n\n그러나 그곳에 다다르기 위해서는 숲이 내는 수많은 시험을 통과해야 한다고 했다. 마을 사람들 중에는 그 전설을 믿는 이도 있었고, 단순히 신화로 여기는 이도 있었다. 하지만 한 소녀, 유리는 그 이야기를 처음 들었을 때부터 묘한 끌림을 느꼈다. 그녀는 다른 사람들과 다르게 나무를 만나야만 한다는 강한 확신을 가졌고, 그 이유는 그녀 스스로도 설명할 수 없었다. 그녀는 어릴 적부터 꿈속에서 하얀 나무와 함께 있는 자신을 자주 보았고, 나무는 항상 그녀에게 따뜻하고도 낮은 목소리로 무언가를 속삭이는 것 같았다."
            self.chatbotEntranceType = .basicEconomyCourse
            
        case .priceLevel:
            self.baseText = ""
            self.chatbotEntranceType = .priceLevelCourse
            
        case .unEmployment:
            self.baseText = ""
            self.chatbotEntranceType = .unEmploymentCourse
            
        case .moneyAndFinance:
            self.baseText = ""
            self.chatbotEntranceType = .moneyAndFinanceCourse
            
        case .exchangeRateAndBalanceOfPayment:
            self.baseText = ""
            self.chatbotEntranceType = .exchangeRateAndBalanceOfPaymentCourse
        }
    }
    
    func startStreamingText() {
        let sentences = self.baseText.components(separatedBy: ". ") // 문장을 기준으로 분리
        var index = 0

        self.cancellable = Timer.publish(every: 0.3, on: .main, in: .common) // 문장 단위로 간격 증가
            .autoconnect()
            .sink { _ in
                if index < sentences.count {
                    let sentence = sentences[index]
                    
                    DispatchQueue.main.async {
                        withAnimation(.smooth(duration: 1.0)) {
                            self.displayedText.append(sentence)
                            self.displayedText.append(". ")
                        }
                    }
                    
                    index += 1
                } else {
                    self.cancellable?.cancel()
                    
                    DispatchQueue.main.async {
                        withAnimation(.smooth(duration: 1.0)) {
                            self.isDisplayTextEnd = true
                        }
                    }
                }
            }
    }
}
