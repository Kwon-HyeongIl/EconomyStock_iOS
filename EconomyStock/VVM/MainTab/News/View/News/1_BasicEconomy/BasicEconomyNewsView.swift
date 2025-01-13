//
//  BasicEconomyNewsView.swift
//  EconomyStock
//
//  Created by 권형일 on 1/12/25.
//

import SwiftUI

struct BasicEconomyNewsView: View {
    @Bindable var viewModel: NewsViewModel
    
    @State private var progress: [Int] = []
    @State private var touchPermission = true
    
    var body: some View {
        VStack {
            GeometryReader { proxy in
                ScrollView {
                    VStack {
                        ZStack {
                            VStack {
                                Text("톡톡신문")
                                    .font(.system(size: 32).bold())
                                    .foregroundStyle(.black)
                                    .padding(.top, 20)
                                
                                
                                HStack {
                                    Spacer()
                                    
                                    Text("20XX년 XX월 XX일")
                                        .font(.system(size: 10))
                                        .foregroundStyle(.black.opacity(0.5))
                                        .padding(.trailing)
                                }
                                
                                Rectangle()
                                    .frame(height: 3)
                                    .padding(.horizontal)
                                    .foregroundStyle(.gray)
                            }
                            
                            HStack {
                                Image("NewsLogo_White")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50)
                                    .padding(.leading)
                                
                                Spacer()
                            }
                        }
                        
                        Text("소비•투자 활황... 국민소득 5% 증가")
                            .font(.system(size: 20).bold())
                            .foregroundStyle(.black)
                            .padding(.top, 10)
                        
                        if progress.count == 0 {
                            Image(systemName: "eject")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25)
                                .foregroundStyle(.gray)
                                .rotationEffect(.degrees(180))
                                .padding(.vertical)
                        }
                        
                        VStack(spacing: 15) {
                            if progress.count >= 1 {
                                JustifiedText("최근 국내 경제가 소비와 투자 증가를 기반으로 견고한 성장세를 보이고 있으며, 이로 인해 국민 소득이 크게 증가했다.")
                                    .frame(height: proxy.size.width > 380 ? 50 : 70)
                                    .padding(.horizontal, 10)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundStyle(.yellow.opacity(0.3))
                                            .padding(.horizontal, 5)
                                        
                                    }
                            }
                            
                            if progress.count >= 2 {
                                JustifiedText("통계청과 한국은행이 발표한 자료에 따르면, 올해 3분기 국민총소득(GNI)은 전년 동기 대비 5.2% 증가했다. 이는 소비 회복과 기업 투자 확대가 맞물려 경제 활력이 되살아난 결과로 분석된다.")
                                    .frame(height: 88)
                                    .padding(.horizontal, 10)
                            }
                            
                            if progress.count >= 3 {
                                JustifiedText("가계 소비는 팬데믹 이후 안정적인 고용 상황과 정부의 경기 부양 정책에 힘입어 꾸준히 증가하고 있다. 3분기 민간소비는 전년 대비 4.8% 상승했으며, 특히 여행, 외식, 의류 등 서비스 부문에서 두드러진 증가세를 보였다.")
                                    .frame(height: proxy.size.width > 380 ? 91 : 106)
                                    .padding(.horizontal, 10)
                            }
                            
                            if progress.count >= 4 {
                                JustifiedText("서울에 거주하는 톡톡씨는 “소득이 늘고 경제 상황에 대한 불안이 줄어들면서 가족과 함께 해외여행을 다녀왔다”며 “이제는 돈을 쓰는 데 있어 예전만큼 신중하지 않아도 될 것 같다”고 말했다.")
                                    .frame(height: 88)
                                    .padding(.horizontal, 10)
                            }
                            
                            if progress.count >= 5 {
                                JustifiedText("한편, 기업들의 설비투자와 연구개발(R&D) 투자도 큰 폭으로 증가했다. 3분기 기업 설비투자는 전년 동기 대비 8.1% 증가하며 6년 만에 가장 높은 성장률을 기록했다. 특히 반도체, 자동차, 배터리 등 첨단 제조업 분야에서의 대규모 투자 확대가 국민소득 증가에 기여했다.")
                                    .frame(height: proxy.size.width > 380 ? 109 : 125)
                                    .padding(.horizontal, 10)
                            }
                            
                            if progress.count >= 6 {
                                JustifiedText("한국경제연구원 관계자는 “글로벌 수요 회복과 기업의 기술 경쟁력 강화 노력으로 투자 규모가 커졌다”며 “향후에도 지속적인 경제 성장 동력을 제공할 것”이라고 평가했다.")
                                    .frame(height: proxy.size.width > 380 ? 73 : 88)
                                    .padding(.horizontal, 10)
                            }
                            
                            if progress.count >= 7 {
                                JustifiedText("정부의 적극적인 정책 지원도 국민소득 증가를 뒷받침하고 있다. 정부는 소비 진작을 위해 재난지원금을 지급하고 저소득층 지원을 확대했다. 또한 중소기업을 위한 투자 세제 혜택과 같은 다양한 정책을 통해 내수와 투자 확대를 견인했다. ")
                                    .frame(height: 106)
                                    .padding(.horizontal, 10)
                            }
                            
                            if progress.count >= 8 {
                                JustifiedText("기획재정부는 “경제의 선순환 구조가 점차 자리 잡고 있다”며 “소비와 투자가 성장의 중심축으로 자리 잡는 것이 긍정적 신호”라고 밝혔다.")
                                    .frame(height: 70)
                                    .padding(.horizontal, 10)
                            }
                            
                            if progress.count >= 9 {
                                JustifiedText("국민소득 증가로 인해 개인 소득이 상승하면서 저축률도 함께 높아지고 있다. 전문가들은 이러한 선순환 구조가 중장기적으로 국가 경제에 긍정적인 영향을 미칠 것으로 내다보고 있다.")
                                    .frame(height: 88)
                                    .padding(.horizontal, 10)
                            }
                            
                            if progress.count >= 10 {
                                JustifiedText("하지만 일각에서는 소비와 투자 증가가 환율 변동, 원자재 가격 상승 등 외부 요인에 취약할 수 있다는 점을 경고하고 있다. 전문가들은 “지속 가능한 성장을 위해 소비와 투자의 질적 향상이 중요하다”며 “특히 투자 효율성과 내수 기반 강화를 위한 정책이 필요하다”고 강조했다.")
                                    .frame(height: proxy.size.width > 380 ? 109 : 125)
                                    .padding(.horizontal, 10)
                            }
                            
                            if progress.count >= 11 {
                                JustifiedText("현재 경제가 소비와 투자 활황으로 인해 활력을 되찾고 있는 가운데, 이를 유지하고 확대하기 위해 정부와 기업의 지속적인 노력이 중요해지고 있다. 경제 성장의 동력을 유지하기 위해 장기적인 정책과 계획이 필요하며, 이를 통해 국가 경제의 지속 가능성을 확보하는 것이 관건이 될 것이다.")
                                    .frame(height: proxy.size.width > 380 ? 109 : 125)
                                    .padding(.horizontal, 10)
                            }
                        }
                        
                        
                        Rectangle()
                            .fill(.clear)
                            .frame(width: 100, height: 20)
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(hex: "A4A4A4"))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 3)
                            .foregroundStyle(Color(hex: "4d4d4d"))
                    }
                    .padding()
                    
                    ZStack {
                        if progress.count == 1 {
                            VStack {
                                
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 250)
                            .background(.ultraThickMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(.horizontal)
                            .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
                        }
                        
                        Rectangle()
                            .fill(.clear)
                            .frame(width: 100, height: 250)
                            .border(.black)
                    }
                }
                .scrollIndicators(.never)
            }
        }
        .modifier(NewsToolbarModifier(viewModel: viewModel))
        .onTapGesture {
            withAnimation(.smooth(duration: 1.0)) {
                if touchPermission {
                    self.progress.append(0)
                    self.touchPermission = false
                }
            }
        }
    }
}

#Preview {
    BasicEconomyNewsView(viewModel: NewsViewModel(news: News.DUMMY_NEWS))
        .environment(NavigationRouter())
        .environment(NewsListCapsule())
}
