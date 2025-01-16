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
    @State private var selected_O = false
    @State private var selected_X = false
    
    var body: some View {
        ScrollViewReader { scrollProxy in
            VStack {
                GeometryReader { geometryProxy in
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
                                        .frame(height: geometryProxy.size.width > 380 ? 50 : 70)
                                        .padding(.horizontal, 10)
                                        .overlay {
                                            if progress.count == 1 {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundStyle(.yellow.opacity(0.3))
                                                    .padding(.horizontal, 7)
                                            }
                                        }
                                }
                                
                                if progress.count >= 2 {
                                    JustifiedText("통계청과 한국은행이 발표한 자료에 따르면, 올해 3분기 국민총소득(GNI)은 전년 동기 대비 5.2% 증가했다. 이는 소비 회복과 기업 투자 확대가 맞물려 경제 활력이 되살아난 결과로 분석된다.")
                                        .frame(height: 88)
                                        .padding(.horizontal, 10)
                                        .overlay {
                                            if progress.count == 2 {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundStyle(.yellow.opacity(0.3))
                                                    .padding(.horizontal, 7)
                                            }
                                        }
                                }
                                
                                if progress.count >= 3 {
                                    JustifiedText("가계 소비는 팬데믹 이후 안정적인 고용 상황과 정부의 경기 부양 정책에 힘입어 꾸준히 증가하고 있다. 3분기 민간소비는 전년 대비 4.8% 상승했으며, 특히 여행, 외식, 의류 등 서비스 부문에서 두드러진 증가세를 보였다.")
                                        .frame(height: geometryProxy.size.width > 380 ? 91 : 106)
                                        .padding(.horizontal, 10)
                                        .overlay {
                                            if progress.count == 3 {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundStyle(.red.opacity(0.3))
                                                    .padding(.horizontal, 7)
                                            }
                                        }
                                }
                                
                                if progress.count >= 4 {
                                    JustifiedText("서울에 거주하는 톡톡씨는 “소득이 늘고 경제 상황에 대한 불안이 줄어들면서 가족과 함께 해외여행을 다녀왔다”며 “이제는 돈을 쓰는 데 있어 예전만큼 신중하지 않아도 될 것 같다”고 말했다.")
                                        .frame(height: 88)
                                        .padding(.horizontal, 10)
                                }
                                
                                if progress.count >= 5 {
                                    JustifiedText("한편, 기업들의 설비투자와 연구개발(R&D) 투자도 큰 폭으로 증가했다. 3분기 기업 설비투자는 전년 동기 대비 8.1% 증가하며 6년 만에 가장 높은 성장률을 기록했다. 특히 반도체, 자동차, 배터리 등 첨단 제조업 분야에서의 대규모 투자 확대가 국민소득 증가에 기여했다.")
                                        .frame(height: geometryProxy.size.width > 380 ? 109 : 125)
                                        .padding(.horizontal, 10)
                                }
                                
                                if progress.count >= 6 {
                                    JustifiedText("한국경제연구원 관계자는 “글로벌 수요 회복과 기업의 기술 경쟁력 강화 노력으로 투자 규모가 커졌다”며 “향후에도 지속적인 경제 성장 동력을 제공할 것”이라고 평가했다.")
                                        .frame(height: geometryProxy.size.width > 380 ? 73 : 88)
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
                                        .frame(height: geometryProxy.size.width > 380 ? 109 : 125)
                                        .padding(.horizontal, 10)
                                }
                                
                                if progress.count >= 11 {
                                    JustifiedText("현재 경제가 소비와 투자 활황으로 인해 활력을 되찾고 있는 가운데, 이를 유지하고 확대하기 위해 정부와 기업의 지속적인 노력이 중요해지고 있다. 경제 성장의 동력을 유지하기 위해 장기적인 정책과 계획이 필요하며, 이를 통해 국가 경제의 지속 가능성을 확보하는 것이 관건이 될 것이다.")
                                        .frame(height: geometryProxy.size.width > 380 ? 109 : 125)
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
                                    HStack {
                                        Image(systemName: "pencil.circle")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 16)
                                        
                                        Text("분석")
                                            .font(.system(size: 16))
                                        
                                        Spacer()
                                    }
                                    .foregroundStyle(Color.ESTitle)
                                    .fontWeight(.bold)
                                    .padding(.leading)
                                    
                                    (Text("소비와 투자 증가는 GDP의 구성 요소로, 경제 성장의 핵심 동력이에요. 소비 증가는 ")
                                     + Text("내수 진작")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("을, 투자 증가는 ")
                                     + Text("자본 축척과 생산성 향상")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("을 통해 장기적인 경제 성장을 지원합니다. 국민소득의 증가는 ")
                                     + Text("경제가 확장 국면")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("에 있다는 신호로 해석할 수 있어요.")
                                    )
                                    .font(.system(size: 16))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.semibold)
                                    .padding(.top, 5)
                                    .padding(.horizontal, 10)
                                    
                                    Button {
                                        withAnimation(.smooth(duration: 0.5)) {
                                            self.progress.append(0)
                                        }
                                    } label: {
                                        LottieView(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
                                            .padding(.top, 10)
                                            .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                    }
                                }
                                .modifier(PannelModifier())
                            } else if progress.count == 2 {
                                VStack {
                                    HStack {
                                        Image(systemName: "pencil.circle")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 16)
                                        
                                        Text("분석")
                                            .font(.system(size: 16))
                                        
                                        Spacer()
                                    }
                                    .foregroundStyle(Color.ESTitle)
                                    .fontWeight(.bold)
                                    .padding(.leading)
                                    
                                    (Text("GNI는 국내 총생산(GDP)에 국외 순수취 요소소득을 더한 지표로, ")
                                     + Text("국민의 실질 소득 수준")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("을 나타내요. 5.2% 증가는 경제 활동의 활력뿐만 아니라 국제 무역 및 해외 투자로부터의 소득 증가도 반영된 결과로 볼 수 있어요.")
                                    )
                                    .font(.system(size: 16))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.semibold)
                                    .padding(.top, 5)
                                    .padding(.horizontal, 10)
                                    
                                    Button {
                                        withAnimation(.smooth(duration: 0.5)) {
                                            self.progress.append(0)
                                        }
                                    } label: {
                                        LottieView(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
                                            .padding(.top, 10)
                                            .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                    }
                                }
                                .modifier(PannelModifier())
                            } else if progress.count == 3 {
                                if !selected_O && !selected_X {
                                    VStack {
                                        HStack {
                                            Image(systemName: "questionmark.circle")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 16)
                                            
                                            Text("문제")
                                                .font(.system(size: 16))
                                            
                                            Spacer()
                                        }
                                        .foregroundStyle(.red)
                                        .fontWeight(.bold)
                                        .padding(.leading)
                                        
                                        Text("서비스 부문의 소비 증가는 경제 성장률에 직접적인 영향을 미치며, 이는 GDP 구성 요소 중 정부 지출에 포함된다.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 5)
                                            .padding(.horizontal, 10)
                                        
                                        HStack {
                                            Button {
                                                withAnimation(.smooth(duration: 1.0)) {
                                                    self.selected_O = true
                                                }
                                            } label: {
                                                LottieView(fileName: "CourseCompleteButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
                                                    .padding(.top, 10)
                                                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                                    .overlay {
                                                        Circle()
                                                            .frame(width: 52, height: 52)
                                                            .foregroundStyle(Color.ESTitle)
                                                            .overlay {
                                                                Text("O")
                                                                    .font(.system(size: 30, design: .rounded).bold())
                                                                    .foregroundStyle(.white)
                                                            }
                                                            .padding(.top, 10)
                                                    }
                                            }
                                            
                                            Button {
                                                withAnimation(.smooth(duration: 1.0)) {
                                                    self.selected_X = true
                                                }
                                            } label: {
                                                LottieView(fileName: "CourseCompleteButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
                                                    .padding(.top, 10)
                                                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                                    .overlay {
                                                        Circle()
                                                            .frame(width: 52, height: 52)
                                                            .foregroundStyle(Color.ESTitle)
                                                            .overlay {
                                                                Text("X")
                                                                    .font(.system(size: 25, design: .rounded).bold())
                                                                    .foregroundStyle(.white)
                                                            }
                                                            .padding(.top, 10)
                                                    }
                                            }
                                        }
                                    }
                                    .modifier(PannelModifier())
                                    
                                } else if selected_O {
                                    VStack {
                                        Text("틀렸어요🥲")
                                            .font(.system(size: 18).bold())
                                            .foregroundStyle(.red)
                                        
                                        Text("서비스 부문의 소비 증가는 경제 성장률에 직접적인 영향을 미치지만, 이는 GDP의 민간소비 항목에 포함돼요. 정부 지출은 별도의 GDP 구성 요소로, 공공서비스나 사회간접자본 투자와 관련된 지출을 의미해요. 따라서 틀린 문장이에요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 5)
                                            .padding(.horizontal, 10)
                                        
                                        Button {
                                            withAnimation(.smooth(duration: 0.5)) {
                                                self.progress.append(0)
                                                self.selected_O = false
                                                self.touchPermission = true
                                            }
                                        } label: {
                                            LottieView(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
                                                .padding(.top, 10)
                                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                        }
                                    }
                                    .modifier(PannelModifier())
                                    
                                } else if selected_X {
                                    VStack {
                                        Text("정답이에요😊")
                                            .font(.system(size: 18).bold())
                                            .foregroundStyle(.green)
                                        
                                        Text("서비스 부문의 소비 증가는 경제 성장률에 직접적인 영향을 미치지만, 이는 GDP의 민간소비 항목에 포함돼요. 정부 지출은 별도의 GDP 구성 요소로, 공공서비스나 사회간접자본 투자와 관련된 지출을 의미해요. 따라서 틀린 문장이에요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 5)
                                            .padding(.horizontal, 10)
                                        
                                        Button {
                                            withAnimation(.smooth(duration: 0.5)) {
                                                self.progress.append(0)
                                                self.selected_X = false
                                                self.touchPermission = true
                                            }
                                        } label: {
                                            LottieView(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
                                                .padding(.top, 10)
                                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                        }
                                    }
                                    .modifier(PannelModifier())
                                }
                            } else if progress.count == 5 {
                                if !selected_O && !selected_X {
                                    VStack {
                                        HStack {
                                            Image(systemName: "questionmark.circle")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 16)
                                            
                                            Text("문제")
                                                .font(.system(size: 16))
                                            
                                            Spacer()
                                        }
                                        .foregroundStyle(.red)
                                        .fontWeight(.bold)
                                        .padding(.leading)
                                        
                                        Text("설비투자의 증가는 단기적으로 생산성을 낮추지만, 장기적으로는 GDP의 공급 측면을 강화하는 데 기여한다.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 5)
                                            .padding(.horizontal, 10)
                                        
                                        HStack {
                                            Button {
                                                withAnimation(.smooth(duration: 1.0)) {
                                                    self.selected_O = true
                                                }
                                            } label: {
                                                LottieView(fileName: "CourseCompleteButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
                                                    .padding(.top, 10)
                                                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                                    .overlay {
                                                        Circle()
                                                            .frame(width: 52, height: 52)
                                                            .foregroundStyle(Color.ESTitle)
                                                            .overlay {
                                                                Text("O")
                                                                    .font(.system(size: 30, design: .rounded).bold())
                                                                    .foregroundStyle(.white)
                                                            }
                                                            .padding(.top, 10)
                                                    }
                                            }
                                            
                                            Button {
                                                withAnimation(.smooth(duration: 1.0)) {
                                                    self.selected_X = true
                                                }
                                            } label: {
                                                LottieView(fileName: "CourseCompleteButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
                                                    .padding(.top, 10)
                                                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                                    .overlay {
                                                        Circle()
                                                            .frame(width: 52, height: 52)
                                                            .foregroundStyle(Color.ESTitle)
                                                            .overlay {
                                                                Text("X")
                                                                    .font(.system(size: 25, design: .rounded).bold())
                                                                    .foregroundStyle(.white)
                                                            }
                                                            .padding(.top, 10)
                                                    }
                                            }
                                        }
                                    }
                                    .modifier(PannelModifier())
                                    
                                } else if selected_O {
                                    VStack {
                                        Text("정답이에요😊")
                                            .font(.system(size: 18).bold())
                                            .foregroundStyle(.green)
                                        
                                        Text("설비투자는 생산설비 확충을 목적으로 하므로 초기에는 비용이 발생해 단기 생산성에 부담이 될 수 있어요. 하지만, 장기적으로는 생산 능력을 증대시키고 기술 혁신을 통해 GDP의 공급 측면을 강화해요. 따라서, 올바른 문장이에요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 5)
                                            .padding(.horizontal, 10)
                                        
                                        Button {
                                            withAnimation(.smooth(duration: 0.5)) {
                                                self.progress.append(0)
                                                self.selected_O = false
                                                self.touchPermission = true
                                            }
                                        } label: {
                                            LottieView(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
                                                .padding(.top, 10)
                                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                        }
                                    }
                                    .modifier(PannelModifier())
                                    
                                } else if selected_X {
                                    VStack {
                                        Text("틀렸어요🥲")
                                            .font(.system(size: 18).bold())
                                            .foregroundStyle(.red)
                                        
                                        Text("설비투자는 생산설비 확충을 목적으로 하므로 초기에는 비용이 발생해 단기 생산성에 부담이 될 수 있어요. 하지만, 장기적으로는 생산 능력을 증대시키고 기술 혁신을 통해 GDP의 공급 측면을 강화해요. 따라서, 올바른 문장이에요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 5)
                                            .padding(.horizontal, 10)
                                        
                                        Button {
                                            withAnimation(.smooth(duration: 0.5)) {
                                                self.progress.append(0)
                                                self.selected_X = false
                                                self.touchPermission = true
                                            }
                                        } label: {
                                            LottieView(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
                                                .padding(.top, 10)
                                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                        }
                                    }
                                    .modifier(PannelModifier())
                                }
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 250)
                        }
                        .id("bottom")
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
                        scrollProxy.scrollTo("bottom", anchor: .top)
                    }
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
