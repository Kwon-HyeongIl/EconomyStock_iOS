//
//  ExchangeRateAndBalanceOfPaymentNewsView.swift
//  EconomyStock
//
//  Created by 권형일 on 2/14/25.
//

import SwiftUI
import PopupView

struct ExchangeRateAndBalanceOfPaymentNewsView: View {
    @Bindable var viewModel: NewsViewModel
    
    @State private var progress: [Int] = []
    @State private var selected_O = false
    @State private var selected_X = false
    @State private var bottomHeight = 0.0
    
    @State private var animationOpacity = 0.0
    
    @State private var popup = false
    
    var body: some View {
        ScrollViewReader { scrollProxy in
            VStack {
                GeometryReader { geometryProxy in
                    ZStack {
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
                                
                                Text("고공행진 인플레이션, 서민 경제 직격탄")
                                    .font(.system(size: 20).bold())
                                    .foregroundStyle(.black)
                                    .padding(.top, 10)
                                
                                
                                JustifiedText("최근 환율이 급등하면서 국내외 금융시장에 대한 우려가 커지고 있다. 급격한 환율 상승은 수출 기업에 일시적으로 이익을 줄 수 있지만, 동시에 수입 물가 상승과 원자재 가격 부담을 키워 전체 경제에 부정적인 파급 효과를 불러일으킬 수 있다는 지적이 나오고 있다.")
                                    .frame(height: 109)
                                    .padding(.horizontal, 10)
                                    .overlay {
                                        if progress.count == 1 {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.yellow.opacity(0.3))
                                                .padding(.horizontal, 7)
                                                .opacity(animationOpacity)
                                                .onAppear {
                                                    withAnimation {
                                                        animationOpacity = 1.0
                                                    }
                                                }
                                        }
                                    }
                                    .id("1")
                                
                                JustifiedText("이와 동시에, 한국은행이 경기 부양을 목적으로 금리 인하를 단행하면서 환율 불안이 더욱 심화되고 있다는 분석이 제기된다. 한 금융 연구소의 김 연구원은 “금리 인하는 내수 진작에 도움이 되지만, 외국인 투자자들의 자본 이탈과 환율 상승을 부추길 수 있어 면밀한 정책 운용이 중요하다”고 설명했다.")
                                    .frame(height: 109)
                                    .padding(.horizontal, 10)
                                    .overlay {
                                        if progress.count == 2 {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.red.opacity(0.3))
                                                .padding(.horizontal, 7)
                                                .opacity(animationOpacity)
                                                .onAppear {
                                                    withAnimation {
                                                        animationOpacity = 1.0
                                                    }
                                                }
                                        }
                                    }
                                    .id("2")
                                
                                JustifiedText("정부 관계자들은 이번 조치가 경기 부양을 위한 불가피한 선택이었다고 강조한다. “수출 부진과 내수 둔화를 동시에 해결하기 위해서는 금리 인하가 효과적인 수단이다. 그러나 환율 불안정성이 커질 위험이 있기 때문에, 외환시장 모니터링과 안정화 방안을 병행할 계획”이라는 입장을 밝혔다.")
                                    .frame(height: 109)
                                    .padding(.horizontal, 10)
                                    .overlay {
                                        if progress.count == 3 {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.yellow.opacity(0.3))
                                                .padding(.horizontal, 7)
                                                .opacity(animationOpacity)
                                                .onAppear {
                                                    withAnimation {
                                                        animationOpacity = 1.0
                                                    }
                                                }
                                        }
                                    }
                                    .id("3")
                                
                                JustifiedText("문제는 환율 폭등이 국제수지의 불균형을 심화시킬 우려가 크다는 점이다. 수입 가격 상승으로 무역수지가 악화될 경우, 경상수지가 적자로 전환될 위험도 배제할 수 없다. 외환 전문가들은 “환율이 지나치게 변동할 때는 수출 경쟁력 확보보다 물가 상승, 자본 유출 등 부작용이 훨씬 클 수 있다”고 지적한다.")
                                    .frame(height: 109)
                                    .padding(.horizontal, 10)
                                    .overlay {
                                        if progress.count == 4 {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.red.opacity(0.3))
                                                .padding(.horizontal, 7)
                                                .opacity(animationOpacity)
                                                .onAppear {
                                                    withAnimation {
                                                        animationOpacity = 1.0
                                                    }
                                                }
                                        }
                                    }
                                    .id("4")
                                
                                JustifiedText("시장 참여자들은 금리 인하가 소비와 투자 확대를 통해 내수 경제를 살리는 긍정적 효과가 있을 것으로 기대하면서도, 환율 폭등으로 인한 불확실성에 대해서는 여전히 우려를 표하고 있다. 한 중소기업 수출 담당자는 “수출 단가가 올라 이익이 늘어날 것 같지만, 해외 시장에서 가격 경쟁력을 잃을 수도 있어 상황을 지켜봐야 한다”고 전했다.")
                                    .frame(height: 127)
                                    .padding(.horizontal, 10)
                                    .overlay {
                                        if progress.count == 5 {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.yellow.opacity(0.3))
                                                .padding(.horizontal, 7)
                                                .opacity(animationOpacity)
                                                .onAppear {
                                                    withAnimation {
                                                        animationOpacity = 1.0
                                                    }
                                                }
                                        }
                                    }
                                    .id("5")
                                
                                JustifiedText("정부와 한국은행은 환율 변동성을 완화하기 위해 다양한 정책적 수단을 검토 중이라고 밝혔다. 외화 보유고 확충, 외환시장 개입, 무역금융 지원 확대 등 대책이 거론되고 있지만, 전문가들은 “조급한 시장 개입보다는 거시경제 안정화와 환율 흐름에 대한 중장기적 모니터링이 우선”이라고 강조한다.")
                                    .frame(height: 109)
                                    .padding(.horizontal, 10)
                                    .overlay {
                                        if progress.count == 6 {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.red.opacity(0.3))
                                                .padding(.horizontal, 7)
                                                .opacity(animationOpacity)
                                                .onAppear {
                                                    withAnimation {
                                                        animationOpacity = 1.0
                                                    }
                                                }
                                        }
                                    }
                                    .id("6")
                                
                                JustifiedText("이번 환율 폭등과 금리 인하가 동시에 진행되는 현상은 국내외 경기와 국제수지에 복합적인 영향을 미치고 있다. 정부와 한국은행은 상황을 예의주시하며, 경제 주체들의 신뢰를 지켜나가기 위한 신속하고 유연한 대응 전략을 마련해야 한다는 목소리가 커지고 있다.")
                                    .frame(height: 109)
                                    .padding(.horizontal, 10)
                                    .overlay {
                                        if progress.count == 7 {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.yellow.opacity(0.3))
                                                .padding(.horizontal, 7)
                                                .opacity(animationOpacity)
                                                .onAppear {
                                                    withAnimation {
                                                        animationOpacity = 1.0
                                                    }
                                                }
                                        }
                                    }
                                    .padding(.bottom, 10)
                                    .id("7")
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color(hex: "A4A4A4"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 3)
                                    .foregroundStyle(Color(hex: "4d4d4d"))
                            }
                            .padding(10)
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(height: bottomHeight)
                        }
                        .scrollIndicators(.never)
                        
                        VStack {
                            Spacer()
                            
                            if progress.count == 1 {
                                VStack {
                                    Spacer()
                                    
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
                                    
                                    Spacer()
                                    
                                    (Text("환율 급등은 수출 기업의 가격 경쟁력을 일시적으로 높여 이익 개선에 도움이 될 수 있지만, 수입 원자재 의존도가 큰 산업이나 소비재 가격에는 상승 압력을 가해 ")
                                     + Text("인플레이션 위험")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("을 높여요.\n\n이는 ")
                                     + Text("무역조건에 불균형.")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("을 가져오고, ")
                                     + Text("전반적인 경제 불확실성을 증폭")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("시킬 수 있어요")
                                    )
                                    .font(.system(size: 16))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.semibold)
                                    .padding(.top, 10)
                                    .padding(.horizontal, 10)
                                    
                                    Spacer()
                                    
                                    Button {
                                        withAnimation {
                                            scrollProxy.scrollTo("1", anchor: .top)
                                        }
                                        self.progress.append(0)
                                        self.animationOpacity = 0.0
                                    } label: {
                                        LottieView(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
                                            .padding(.top, 10)
                                            .padding(.bottom, 10)
                                            .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                    }
                                }
                                .modifier(PannelModifier(height: 330))
                                .opacity(animationOpacity)
                                .onAppear {
                                    withAnimation {
                                        animationOpacity = 1.0
                                    }
                                }
                                
                            } else if progress.count == 2 {
                                if !selected_O && !selected_X {
                                    VStack {
                                        Spacer()
                                        
                                        HStack {
                                            Image(systemName: "questionmark.circle")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 16)
                                            
                                            Text("문제")
                                                .font(.system(size: 16))
                                            
                                            Spacer()
                                            
                                            Button {
                                                self.progress.removeFirst()
                                            } label: {
                                                Image(systemName: "arrow.uturn.left")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .foregroundStyle(Color.ESTitle)
                                                    .fontWeight(.medium)
                                                    .frame(width: 15)
                                                    .padding(.trailing, 20)
                                                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                            }
                                        }
                                        .foregroundStyle(.red)
                                        .fontWeight(.bold)
                                        .padding(.leading)
                                        
                                        Spacer()
                                        
                                        Text("중앙은행의 금리 인하는 내수 활성화를 도모하지만, 해외 자본 유출과 환율 상승을 촉진해 시장 불안을 가중시킬 수 있다.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 5)
                                            .padding(.horizontal, 10)
                                        
                                        Spacer()
                                        
                                        HStack {
                                            Button {
                                                self.selected_O = true
                                                self.animationOpacity = 0.0
                                            } label: {
                                                LottieOButton()
                                            }
                                            
                                            Button {
                                                self.selected_X = true
                                                self.animationOpacity = 0.0
                                            } label: {
                                                LottieXButton()
                                            }
                                        }
                                        .padding(.bottom, 10)
                                    }
                                    .modifier(PannelModifier(height: 260))
                                    .opacity(animationOpacity)
                                    .onAppear {
                                        withAnimation {
                                            animationOpacity = 1.0
                                        }
                                    }
                                    
                                } else if selected_O {
                                    VStack {
                                        Spacer()
                                        
                                        ZStack {
                                            Text("정답이에요😊")
                                                .font(.system(size: 18).bold())
                                                .foregroundStyle(.green)
                                            
                                            HStack {
                                                Spacer()
                                                
                                                Button {
                                                    self.selected_O = false
                                                } label: {
                                                    Image(systemName: "arrow.uturn.left")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .foregroundStyle(Color.ESTitle)
                                                        .fontWeight(.medium)
                                                        .frame(width: 15)
                                                        .padding(.trailing, 20)
                                                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                                }
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        Text("금리 인하는 국내 경제에 유동성을 공급해 투자를 활성화하지만, 국내금리가 낮아지면 외국인 자본이 이탈하고 환율이 상승하는 부작용이 발생할 수 있어요.\n\n이는 환율 변동성을 높여 시장 불안을 가중시켜요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 5)
                                            .padding(.horizontal, 10)
                                        
                                        Spacer()
                                        
                                        Button {
                                            self.bottomHeight = 250
                                            withAnimation {
                                                scrollProxy.scrollTo("2", anchor: .top)
                                            }
                                            self.progress.append(0)
                                            self.selected_O = false
                                            self.animationOpacity = 0.0
                                        } label: {
                                            LottieView(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
                                                .padding(.top, 10)
                                                .padding(.bottom, 10)
                                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                        }
                                    }
                                    .modifier(PannelModifier(height: 320))
                                    .opacity(animationOpacity)
                                    .onAppear {
                                        withAnimation {
                                            animationOpacity = 1.0
                                        }
                                    }
                                    
                                } else if selected_X {
                                    VStack {
                                        Spacer()
                                        
                                        ZStack {
                                            Text("틀렸어요🥲")
                                                .font(.system(size: 18).bold())
                                                .foregroundStyle(.red)
                                            
                                            HStack {
                                                Spacer()
                                                
                                                Button {
                                                    self.selected_X = false
                                                } label: {
                                                    Image(systemName: "arrow.uturn.left")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .foregroundStyle(Color.ESTitle)
                                                        .fontWeight(.medium)
                                                        .frame(width: 15)
                                                        .padding(.trailing, 20)
                                                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                                }
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        Text("금리 인하는 국내 경제에 유동성을 공급해 투자를 활성화하지만, 국내금리가 낮아지면 외국인 자본이 이탈하고 환율이 상승하는 부작용이 발생할 수 있어요.\n\n이는 환율 변동성을 높여 시장 불안을 가중시켜요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 5)
                                            .padding(.horizontal, 10)
                                        
                                        Spacer()
                                        
                                        Button {
                                            self.bottomHeight = 250
                                            withAnimation {
                                                scrollProxy.scrollTo("2", anchor: .top)
                                            }
                                            self.progress.append(0)
                                            self.selected_X = false
                                            self.animationOpacity = 0.0
                                        } label: {
                                            LottieView(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
                                                .padding(.top, 10)
                                                .padding(.bottom, 10)
                                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                        }
                                    }
                                    .modifier(PannelModifier(height: 320))
                                    .opacity(animationOpacity)
                                    .onAppear {
                                        withAnimation {
                                            animationOpacity = 1.0
                                        }
                                    }
                                }
                                
                            } else if progress.count == 3 {
                                VStack {
                                    Spacer()
                                    
                                    HStack {
                                        Image(systemName: "pencil.circle")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 16)
                                        
                                        Text("분석")
                                            .font(.system(size: 16))
                                        
                                        Spacer()
                                        
                                        Button {
                                            self.progress.removeFirst()
                                        } label: {
                                            Image(systemName: "arrow.uturn.left")
                                                .resizable()
                                                .scaledToFit()
                                                .foregroundStyle(Color.ESTitle)
                                                .fontWeight(.medium)
                                                .frame(width: 15)
                                                .padding(.trailing, 20)
                                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                        }
                                    }
                                    .foregroundStyle(Color.ESTitle)
                                    .fontWeight(.bold)
                                    .padding(.leading)
                                    
                                    Spacer()
                                    
                                    (Text("정부가 금리 인하를 경기 부양의 도구로 강조하는 것은 전통적인 확장적 통화정책 논리를 반영해요.\n\n그러나 환율이 급등할 경우 수입 물가 상승과 자본 유출 가능성이 커지므로, ")
                                     + Text("외환시장 안정화 대책이 병행")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("되어야 해요.\n\n이는 ")
                                     + Text("단기적 경기 부양")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("과 ")
                                     + Text("중·장기적 환율 안정")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("을 동시에 추구하는 정책적 균형을 요구해요.")
                                    )
                                    .font(.system(size: 16))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.semibold)
                                    .padding(.top, 10)
                                    .padding(.horizontal, 10)
                                    
                                    Spacer()
                                    
                                    Button {
                                        self.bottomHeight = 160
                                        withAnimation {
                                            scrollProxy.scrollTo("4", anchor: .top)
                                        }
                                        self.progress.append(0)
                                        self.animationOpacity = 0.0
                                    } label: {
                                        LottieView(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
                                            .padding(.top, 10)
                                            .padding(.bottom, 10)
                                            .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                    }
                                }
                                .modifier(PannelModifier(height: 370))
                                .opacity(animationOpacity)
                                .onAppear {
                                    withAnimation {
                                        animationOpacity = 1.0
                                    }
                                }
                            } else if progress.count == 4 {
                                if !selected_O && !selected_X {
                                    VStack {
                                        Spacer()
                                        
                                        HStack {
                                            Image(systemName: "questionmark.circle")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 16)
                                            
                                            Text("문제")
                                                .font(.system(size: 16))
                                            
                                            Spacer()
                                            
                                            Button {
                                                self.progress.removeFirst()
                                            } label: {
                                                Image(systemName: "arrow.uturn.left")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .foregroundStyle(Color.ESTitle)
                                                    .fontWeight(.medium)
                                                    .frame(width: 15)
                                                    .padding(.trailing, 20)
                                                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                            }
                                        }
                                        .foregroundStyle(.red)
                                        .fontWeight(.bold)
                                        .padding(.leading)
                                        
                                        Spacer()
                                        
                                        Text("환율 폭등이 일어나면, 수입 물가 급등으로 국내 생산 비용이 올라가 무역수지 불균형이 더 심각해질 가능성이 있다.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 5)
                                            .padding(.horizontal, 10)
                                        
                                        Spacer()
                                        
                                        HStack {
                                            Button {
                                                self.selected_O = true
                                                self.animationOpacity = 0.0
                                            } label: {
                                                LottieOButton()
                                            }
                                            
                                            Button {
                                                self.selected_X = true
                                                self.animationOpacity = 0.0
                                            } label: {
                                                LottieXButton()
                                            }
                                        }
                                        .padding(.bottom, 10)
                                    }
                                    .modifier(PannelModifier(height: 260))
                                    .opacity(animationOpacity)
                                    .onAppear {
                                        withAnimation {
                                            animationOpacity = 1.0
                                        }
                                    }
                                    
                                } else if selected_O {
                                    VStack {
                                        Spacer()
                                        
                                        ZStack {
                                            Text("정답이에요😊")
                                                .font(.system(size: 18).bold())
                                                .foregroundStyle(.green)
                                            
                                            HStack {
                                                Spacer()
                                                
                                                Button {
                                                    self.selected_O = false
                                                } label: {
                                                    Image(systemName: "arrow.uturn.left")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .foregroundStyle(Color.ESTitle)
                                                        .fontWeight(.medium)
                                                        .frame(width: 15)
                                                        .padding(.trailing, 20)
                                                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                                }
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        Text("환율이 급등하면 원자재, 에너지 등 수입품 가격이 상승하여 국내 기업들의 생산 비용 부담이 커져요.\n\n이는 국제 경쟁력을 약화시켜 수출보다 수입 증가율이 더 높아질 수 있으며, 결국 무역수지 불균형을 심화시킬 위험이 있어요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 5)
                                            .padding(.horizontal, 10)
                                        
                                        Spacer()
                                        
                                        Button {
                                            self.bottomHeight = 250
                                            withAnimation {
                                                scrollProxy.scrollTo("5", anchor: .top)
                                            }
                                            self.progress.append(0)
                                            self.selected_O = false
                                            self.animationOpacity = 0.0
                                        } label: {
                                            LottieView(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
                                                .padding(.top, 10)
                                                .padding(.bottom, 10)
                                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                        }
                                    }
                                    .modifier(PannelModifier(height: 300))
                                    .opacity(animationOpacity)
                                    .onAppear {
                                        withAnimation {
                                            animationOpacity = 1.0
                                        }
                                    }
                                    
                                } else if selected_X {
                                    VStack {
                                        Spacer()
                                        
                                        ZStack {
                                            Text("틀렸어요🥲")
                                                .font(.system(size: 18).bold())
                                                .foregroundStyle(.red)
                                            
                                            HStack {
                                                Spacer()
                                                
                                                Button {
                                                    self.selected_X = false
                                                } label: {
                                                    Image(systemName: "arrow.uturn.left")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .foregroundStyle(Color.ESTitle)
                                                        .fontWeight(.medium)
                                                        .frame(width: 15)
                                                        .padding(.trailing, 20)
                                                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                                }
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        Text("환율이 급등하면 원자재, 에너지 등 수입품 가격이 상승하여 국내 기업들의 생산 비용 부담이 커져요.\n\n이는 국제 경쟁력을 약화시켜 수출보다 수입 증가율이 더 높아질 수 있으며, 결국 무역수지 불균형을 심화시킬 위험이 있어요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 5)
                                            .padding(.horizontal, 10)
                                        
                                        Spacer()
                                        
                                        Button {
                                            self.bottomHeight = 250
                                            withAnimation {
                                                scrollProxy.scrollTo("5", anchor: .top)
                                            }
                                            self.progress.append(0)
                                            self.selected_X = false
                                            self.animationOpacity = 0.0
                                        } label: {
                                            LottieView(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
                                                .padding(.top, 10)
                                                .padding(.bottom, 10)
                                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                        }
                                    }
                                    .modifier(PannelModifier(height: 300))
                                    .opacity(animationOpacity)
                                    .onAppear {
                                        withAnimation {
                                            animationOpacity = 1.0
                                        }
                                    }
                                }
                                
                            } else if progress.count == 5 {
                                VStack {
                                    Spacer()
                                    
                                    HStack {
                                        Image(systemName: "pencil.circle")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 16)
                                        
                                        Text("분석")
                                            .font(.system(size: 16))
                                        
                                        Spacer()
                                        
                                        Button {
                                            self.progress.removeFirst()
                                        } label: {
                                            Image(systemName: "arrow.uturn.left")
                                                .resizable()
                                                .scaledToFit()
                                                .foregroundStyle(Color.ESTitle)
                                                .fontWeight(.medium)
                                                .frame(width: 15)
                                                .padding(.trailing, 20)
                                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                        }
                                    }
                                    .foregroundStyle(Color.ESTitle)
                                    .fontWeight(.bold)
                                    .padding(.leading)
                                    
                                    Spacer()
                                    
                                    (Text("금리 인하의 장점은 가계와 기업의 이자 부담을 덜어줘 소비와 투자를 촉진하는 데 있지만, 동시에 환율 급등은 수입 비용 상승·자본 이탈·금융시장 변동성 확대를 초래해 ")
                                     + Text("경제주체의 심리적 부담")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("을 키워요.\n\n이는 ")
                                     + Text("정책의 득과 실이 동시에 나타나는 복합적 상황")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("을 보여줘요.")
                                    )
                                    .font(.system(size: 16))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.semibold)
                                    .padding(.top, 10)
                                    .padding(.horizontal, 10)
                                    
                                    Spacer()
                                    
                                    Button {
                                        self.bottomHeight = 265
                                        withAnimation {
                                            scrollProxy.scrollTo("4", anchor: .top)
                                        }
                                        self.progress.append(0)
                                        self.animationOpacity = 0.0
                                    } label: {
                                        LottieView(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
                                            .padding(.top, 10)
                                            .padding(.bottom, 10)
                                            .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                    }
                                }
                                .modifier(PannelModifier(height: 340))
                                .opacity(animationOpacity)
                                .onAppear {
                                    withAnimation {
                                        animationOpacity = 1.0
                                    }
                                }
                                
                            } else if progress.count == 6 {
                                if !selected_O && !selected_X {
                                    VStack {
                                        Spacer()
                                        
                                        HStack {
                                            Image(systemName: "questionmark.circle")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 16)
                                            
                                            Text("문제")
                                                .font(.system(size: 16))
                                            
                                            Spacer()
                                            
                                            Button {
                                                self.progress.removeFirst()
                                            } label: {
                                                Image(systemName: "arrow.uturn.left")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .foregroundStyle(Color.ESTitle)
                                                    .fontWeight(.medium)
                                                    .frame(width: 15)
                                                    .padding(.trailing, 20)
                                                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                            }
                                        }
                                        .foregroundStyle(.red)
                                        .fontWeight(.bold)
                                        .padding(.leading)
                                        
                                        Spacer()
                                        
                                        Text("정부와 한국은행이 환율 안정화 정책을 시행할 때, 무분별한 외환시장 개입은 중장기적으로 경제 안정성에 부정적인 영향을 줄 수 있다.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 5)
                                            .padding(.horizontal, 10)
                                        
                                        Spacer()
                                        
                                        HStack {
                                            Button {
                                                self.bottomHeight = 325
                                                withAnimation {
                                                    scrollProxy.scrollTo("7", anchor: .top)
                                                }
                                                self.selected_O = true
                                                self.animationOpacity = 0.0
                                            } label: {
                                                LottieOButton()
                                            }
                                            
                                            Button {
                                                self.bottomHeight = 325
                                                withAnimation {
                                                    scrollProxy.scrollTo("7", anchor: .top)
                                                }
                                                self.selected_X = true
                                                self.animationOpacity = 0.0
                                            } label: {
                                                LottieXButton()
                                            }
                                        }
                                        .padding(.bottom, 10)
                                    }
                                    .modifier(PannelModifier(height: 260))
                                    .opacity(animationOpacity)
                                    .onAppear {
                                        withAnimation {
                                            animationOpacity = 1.0
                                        }
                                    }
                                    
                                } else if selected_O {
                                    VStack {
                                        Spacer()
                                        
                                        ZStack {
                                            Text("정답이에요😊")
                                                .font(.system(size: 18).bold())
                                                .foregroundStyle(.green)
                                            
                                            HStack {
                                                Spacer()
                                                
                                                Button {
                                                    self.selected_O = false
                                                } label: {
                                                    Image(systemName: "arrow.uturn.left")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .foregroundStyle(Color.ESTitle)
                                                        .fontWeight(.medium)
                                                        .frame(width: 15)
                                                        .padding(.trailing, 20)
                                                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                                }
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        Text("과도한 환율 개입은 외환보유액 고갈, 통화 정책 왜곡, 대외 신뢰도 하락 등 부작용을 유발할 수 있어요.\n\n따라서 환율 변동성 억제책은 거시경제 안정을 위해 신중하고 제한적으로 이루어져야 해요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 5)
                                            .padding(.horizontal, 10)
                                        
                                        Spacer()
                                        
                                        Button {
                                            self.bottomHeight = 345
                                            withAnimation {
                                                scrollProxy.scrollTo("7", anchor: .top)
                                            }
                                            self.progress.append(0)
                                        } label: {
                                            LottieView(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
                                                .padding(.top, 10)
                                                .padding(.bottom, 10)
                                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                        }
                                    }
                                    .modifier(PannelModifier(height: 320))
                                    .opacity(animationOpacity)
                                    .onAppear {
                                        withAnimation {
                                            animationOpacity = 1.0
                                        }
                                    }
                                    
                                } else if selected_X {
                                    VStack {
                                        Spacer()
                                        
                                        ZStack {
                                            Text("틀렸어요🥲")
                                                .font(.system(size: 18).bold())
                                                .foregroundStyle(.red)
                                            
                                            HStack {
                                                Spacer()
                                                
                                                Button {
                                                    self.selected_X = false
                                                } label: {
                                                    Image(systemName: "arrow.uturn.left")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .foregroundStyle(Color.ESTitle)
                                                        .fontWeight(.medium)
                                                        .frame(width: 15)
                                                        .padding(.trailing, 20)
                                                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                                }
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        Text("과도한 환율 개입은 외환보유액 고갈, 통화 정책 왜곡, 대외 신뢰도 하락 등 부작용을 유발할 수 있어요.\n\n따라서 환율 변동성 억제책은 거시경제 안정을 위해 신중하고 제한적으로 이루어져야 해요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 5)
                                            .padding(.horizontal, 10)
                                        
                                        Spacer()
                                        
                                        Button {
                                            self.bottomHeight = 345
                                            withAnimation {
                                                scrollProxy.scrollTo("7", anchor: .top)
                                            }
                                            self.progress.append(0)
                                        } label: {
                                            LottieView(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
                                                .padding(.top, 10)
                                                .padding(.bottom, 10)
                                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                        }
                                    }
                                    .modifier(PannelModifier(height: 320))
                                    .opacity(animationOpacity)
                                    .onAppear {
                                        withAnimation {
                                            animationOpacity = 1.0
                                        }
                                    }
                                }
                            } else if progress.count == 7 {
                                VStack {
                                    Spacer()
                                    
                                    HStack {
                                        Image(systemName: "pencil.circle")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 16)
                                        
                                        Text("분석")
                                            .font(.system(size: 16))
                                        
                                        Spacer()
                                        
                                        Button {
                                            self.progress.removeFirst()
                                        } label: {
                                            Image(systemName: "arrow.uturn.left")
                                                .resizable()
                                                .scaledToFit()
                                                .foregroundStyle(Color.ESTitle)
                                                .fontWeight(.medium)
                                                .frame(width: 15)
                                                .padding(.trailing, 20)
                                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                        }
                                    }
                                    .foregroundStyle(Color.ESTitle)
                                    .fontWeight(.bold)
                                    .padding(.leading)
                                    
                                    Spacer()
                                    
                                    (Text("환율 폭등과 금리 인하가 겹치면 국내외 ")
                                     + Text("자본 흐름, 무역수지, 물가 수준 ")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("등에 다면적 영향을 미쳐요.\n\n정책 당국은 내부적으로 ")
                                     + Text("거시경제 지표를 면밀히 추적")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("하고, 대외적으로 ")
                                     + Text("투자자와 소비자의 신뢰를 유지하기 위한 적시 대응")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("이 중요해요.")
                                    )
                                    .font(.system(size: 16))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.semibold)
                                    .padding(.top, 10)
                                    .padding(.horizontal, 10)
                                    
                                    Spacer()
                                    
                                    Button {
                                        self.bottomHeight = 160
                                        withAnimation {
                                            scrollProxy.scrollTo("4", anchor: .top)
                                        }
                                        self.progress.append(0)
                                        self.animationOpacity = 0.0
                                    } label: {
                                        LottieView(fileName: "CourseCompleteButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
                                            .padding(.top, 10)
                                            .padding(.bottom, 10)
                                            .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                    }
                                }
                                .modifier(PannelModifier(height: 370))
                                .opacity(animationOpacity)
                                .onAppear {
                                    withAnimation {
                                        animationOpacity = 1.0
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .modifier(NewsToolbarModifier(viewModel: viewModel))
            .onTapGesture {
                if progress.count == 0 {
                    self.progress.append(0)
                }
            }
            .onAppear {
                popup = true
            }
            .popup(isPresented: $popup) {
                HStack {
                    (Text("진행하시려면 화면을 ")
                    + Text("터치 ")
                        .foregroundStyle(Color.ESTitle)
                    + Text("해주세요"))
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                }
                .frame(width: 300, height: 80)
                .background(.ultraThickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
                .padding(.bottom, 50)
            } customize: {
                $0
                    .type(.toast)
                    .closeOnTap(true)
                    .closeOnTapOutside(true)
            }
        }
    }
}

#Preview {
    ExchangeRateAndBalanceOfPaymentNewsView(viewModel: NewsViewModel(news: News.DUMMY_NEWS))
        .environment(NavigationRouter())
        .environment(NewsListCapsule())
}
