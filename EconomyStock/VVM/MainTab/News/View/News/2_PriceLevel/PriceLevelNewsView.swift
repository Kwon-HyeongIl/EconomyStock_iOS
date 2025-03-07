//
//  PriceLevelNewsView.swift
//  EconomyStock
//
//  Created by 권형일 on 2/5/25.
//

import SwiftUI
import PopupView

struct PriceLevelNewsView: View {
    @Bindable var viewModel: NewsViewModel
    
    @State private var progress: [Int] = []
    @State private var selected_O = false
    @State private var selected_X = false
    @State private var bottomHeight = 0.0
    
    @State private var animationOpacity = 0.0
    
    @State private var startPopup = false
    @State private var endPopup = false
    @State private var isPopupLoading = true
    
    @State private var loadingBarState = false
    
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
                                    .padding(.bottom, 20)
                                
                                VStack(spacing: 25) {
                                    JustifiedText("최근 국내 물가 상승률이 지속되면서 소비자와 기업 모두 큰 부담을 겪고 있다. 생활비 부담 증가는 국민의 실질 구매력 감소와 생활 수준 하락 우려를 낳고 있으며, 정부와 중앙은행은 물가 안정을 위해 다양한 대응 전략을 펼치고 있다.", maxWidth: geometryProxy.size.width - 45)
                                        .overlay {
                                            if progress.count == 1 {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundStyle(.yellow.opacity(0.3))
                                                    .padding(.horizontal, 8)
                                                    .scaleEffect(1.1)
                                                    .opacity(animationOpacity)
                                                    .onAppear {
                                                        withAnimation {
                                                            animationOpacity = 1.0
                                                        }
                                                    }
                                            }
                                        }
                                        .id("1")
                                    
                                    JustifiedText("국제 원자재 급등, 공급망 병목, 에너지 가격 상승 등 복합 요인이 인플레이션의 주 원인이다. 팬데믹 복구 혼란과 지정학 갈등으로 원유·천연가스 가격 불안정이 국내 물가에 영향을 미치며, 코로나19 이후 소비 패턴 변화와 수요 급증도 가격 상승 압력을 높이고 있다.", maxWidth: geometryProxy.size.width - 45)
                                        .overlay {
                                            if progress.count == 2 {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundStyle(.red.opacity(0.3))
                                                    .padding(.horizontal, 8)
                                                    .scaleEffect(1.1)
                                                    .opacity(animationOpacity)
                                                    .onAppear {
                                                        withAnimation {
                                                            animationOpacity = 1.0
                                                        }
                                                    }
                                            }
                                        }
                                        .id("2")
                                    
                                    JustifiedText("소비자 물가 지수는 전년 대비 6% 이상의 상승률을 기록하며 식료품, 에너지, 주거비 등 주요 품목의 가격 인상이 두드러진다. 이로 인해 특히 저소득층과 중산층 가구에 큰 부담이 발생해 사회적 불평등 심화 문제도 제기되고 있다.", maxWidth: geometryProxy.size.width - 45)
                                        .overlay {
                                            if progress.count == 3 {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundStyle(.yellow.opacity(0.3))
                                                    .padding(.horizontal, 8)
                                                    .scaleEffect(1.1)
                                                    .opacity(animationOpacity)
                                                    .onAppear {
                                                        withAnimation {
                                                            animationOpacity = 1.0
                                                        }
                                                    }
                                            }
                                        }
                                        .id("3")
                                    
                                    JustifiedText("기업들은 원자재와 운송비 상승으로 인한 비용 부담을 제품 가격에 전가하는 상황이다. 단기적으로는 마진 축소와 소비자 부담 증가가 우려되지만, 장기적으로는 기술 혁신과 생산성 향상을 통해 비용 구조 개선을 시도하고 있다.", maxWidth: geometryProxy.size.width - 45)
                                        .overlay {
                                            if progress.count == 4 {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundStyle(.red.opacity(0.3))
                                                    .padding(.horizontal, 8)
                                                    .scaleEffect(1.1)
                                                    .opacity(animationOpacity)
                                                    .onAppear {
                                                        withAnimation {
                                                            animationOpacity = 1.0
                                                        }
                                                    }
                                            }
                                        }
                                        .id("4")
                                    
                                    JustifiedText("정부는 필수 생활품 가격 안정을 위한 모니터링과 긴급 지원 대책을 마련하며 단기 대응에 주력하고 있다. 동시에 공급망 안정화와 에너지 자원 확보를 통한 중장기 대책도 추진 중이다. 중앙은행 역시 금리와 유동성 조절로 인플레이션 억제에 힘쓰고 있다.", maxWidth: geometryProxy.size.width - 45)
                                        .overlay {
                                            if progress.count == 5 {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundStyle(.yellow.opacity(0.3))
                                                    .padding(.horizontal, 8)
                                                    .scaleEffect(1.1)
                                                    .opacity(animationOpacity)
                                                    .onAppear {
                                                        withAnimation {
                                                            animationOpacity = 1.0
                                                        }
                                                    }
                                            }
                                        }
                                        .id("5")
                                    
                                    JustifiedText("경제 전문가들은 이번 물가 상승이 외부 요인과 내부 구조적 문제의 복합 결과임을 지적하며, 정부와 중앙은행의 신속한 정책 대응이 중장기적으로 안정된 가격 수준 회복에 기여할 것이라고 전망한다.", maxWidth: geometryProxy.size.width - 45)
                                        .overlay {
                                            if progress.count == 6 {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundStyle(.red.opacity(0.3))
                                                    .padding(.horizontal, 8)
                                                    .scaleEffect(1.1)
                                                    .opacity(animationOpacity)
                                                    .onAppear {
                                                        withAnimation {
                                                            animationOpacity = 1.0
                                                        }
                                                    }
                                            }
                                        }
                                        .id("6")
                                    
                                    JustifiedText("이처럼 물가 상승은 국민 생활과 경제 전반에 복합적 영향을 미치고 있으며, 정부, 중앙은행, 기업이 협력하여 구조적 문제를 해결한다면 안정된 경제 환경을 회복할 수 있을 것으로 보인다.", maxWidth: geometryProxy.size.width - 45)
                                        .padding(.bottom)
                                        .id("7")
                                }
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
                                    
                                    (Text("지속적인 물가 상승은 인플레이션 압력으로 작용해 소비자와 기업의 비용 부담을 증가시켜요. 이로 인해 국민의 실질 소득이 잠식되고, 소비가 위축되어")
                                     + Text("내수 경기 둔화")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("로 이어질 가능성이 있어요.\n\n정부와 중앙은행이 재정 및 통화 정책 등 다양한 대응 전략을 펼치는 것은 ")
                                     + Text("인플레이션 기대를 안정")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("시키고 ")
                                     + Text("경제 전반의 균형을 회복")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("하기 위한 시도로 볼 수 있습니다.")
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
                                        self.viewModel.currentPage += 1
                                    } label: {
                                        LottieView(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
                                            .padding(.top, 10)
                                            .padding(.bottom, 10)
                                            .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                    }
                                }
                                .modifier(PannelModifier(height: 350))
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
                                                self.viewModel.currentPage -= 1
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
                                        
                                        Text("공급망 병목 현상은 기업의 생산성과 재고 관리 효율성을 저해하여, 상품 공급의 지연과 부족으로 이어지며, 이로 인해 가격 상승 압력이 증가한다.")
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
                                        
                                        Text("공급망 병목 현상은 생산 및 유통 과정에서 제약을 발생시켜, 제품의 공급이 원활하지 못하게 만들어요.\n\n이로 인해 수요 대비 공급 부족 현상이 발생하면, 시장에서는 가격 상승 압력이 커지게 되어 인플레이션에 기여하는 결과를 낳아요.")
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
                                            self.viewModel.currentPage += 1
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
                                        
                                        Text("공급망 병목 현상은 생산 및 유통 과정에서 제약을 발생시켜, 제품의 공급이 원활하지 못하게 만들어요.\n\n이로 인해 수요 대비 공급 부족 현상이 발생하면, 시장에서는 가격 상승 압력이 커지게 되어 인플레이션에 기여하는 결과를 낳아요.")
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
                                            self.viewModel.currentPage += 1
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
                                            self.viewModel.currentPage -= 1
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
                                    
                                    (Text("소비자 물가 지수의 급격한 상승은 필수 생활품 가격 인상을 반영하며, 이는 ")
                                     + Text("국민의 실질 구매력을 급격히 감소")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("시켜요.\n\n특히, 소득 대비 지출 비중이 큰 저소득층과 중산층에게 더 큰 경제적 부담을 주어 ")
                                     + Text("소득 재분배와 사회적 불평등 문제를 심화")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("시킬 위험이 있어요.")
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
                                        self.viewModel.currentPage += 1
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
                                                self.viewModel.currentPage -= 1
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
                                        
                                        Text("기업들이 비용 상승을 소비자 가격에 전가하는 것은 단기적으로 기업 이윤을 보호하는 동시에 소비자 물가 지수를 하락시키는 효과를 가져온다.")
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
                                            Text("틀렸어요🥲")
                                                .font(.system(size: 18).bold())
                                                .foregroundStyle(.red)
                                            
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
                                        
                                        Text("비용 상승을 소비자 가격에 전가하면 기업은 단기적으로 이윤 압박을 피할 수 있으나, 소비자 가격 상승으로 인해 소비자 물가 지수는 오히려 상승해요.\n\n따라서 소비자 물가 지수 하락 효과는 발생하지 않아요.")
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
                                            self.viewModel.currentPage += 1
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
                                            Text("정답이에요😊")
                                                .font(.system(size: 18).bold())
                                                .foregroundStyle(.green)
                                            
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
                                        
                                        Text("비용 상승을 소비자 가격에 전가하면 기업은 단기적으로 이윤 압박을 피할 수 있으나, 소비자 가격 상승으로 인해 소비자 물가 지수는 오히려 상승해요.\n\n따라서 소비자 물가 지수 하락 효과는 발생하지 않아요.")
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
                                            self.viewModel.currentPage += 1
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
                                            self.viewModel.currentPage -= 1
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
                                    
                                    (Text("정부는 단기적으로 필수품 가격 억제로 소비자 부담을 줄이고, 중장기적으로 공급망 안정과 에너지 확보로 인플레이션 구조 문제를 해결해요.\n\n중앙은행의 금리 인상과 유동성 조절은 인플레이션 기대를 관리하며, 과열된 수요를 진정시켜 경제 전반의 안정성을 회복하려는 통화 정책의 핵심 수단이라고 볼 수 있어요.")
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
                                        self.viewModel.currentPage += 1
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
                                                self.viewModel.currentPage -= 1
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
                                        
                                        Text("정부와 중앙은행의 신속한 정책 대응은 중장기적으로 가격 안정에 기여할 뿐만 아니라, 단기적으로 물가 상승 압력을 완전히 제거하는 효과도 있다.")
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
                                            Text("틀렸어요🥲")
                                                .font(.system(size: 18).bold())
                                                .foregroundStyle(.red)
                                            
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
                                        
                                        Text("정부와 중앙은행의 정책 대응은 중장기적으로 가격 수준을 안정시키는 데 기여할 수 있으나, 단기적으로는 물가 상승 압력을 완전히 제거하기 어려워요.\n\n단기적 효과는 제한적이며, 즉각적인 인플레이션 완화는 기대하기 어렵다고 볼 수 있어요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 5)
                                            .padding(.horizontal, 10)
                                        
                                        Spacer()
                                        
                                        Button {
                                            let view = UIView(frame: .zero)
                                            UIImpactFeedbackGenerator(style: .light, view: view).impactOccurred()
                                            
                                            endPopup = true
                                        } label: {
                                            LottieView(fileName: "CourseCompleteButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
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
                                            Text("정답이에요😊")
                                                .font(.system(size: 18).bold())
                                                .foregroundStyle(.green)
                                            
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
                                        
                                        Text("정부와 중앙은행의 정책 대응은 중장기적으로 가격 수준을 안정시키는 데 기여할 수 있으나, 단기적으로는 물가 상승 압력을 완전히 제거하기 어려워요.\n\n단기적 효과는 제한적이며, 즉각적인 인플레이션 완화는 기대하기 어렵다고 볼 수 있어요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 5)
                                            .padding(.horizontal, 10)
                                        
                                        Spacer()
                                        
                                        Button {
                                            let view = UIView(frame: .zero)
                                            UIImpactFeedbackGenerator(style: .light, view: view).impactOccurred()
                                            
                                            endPopup = true
                                        } label: {
                                            LottieView(fileName: "CourseCompleteButton", loopMode: .playOnce, speed: 0.5, scale: 2.3, width: 80, height: 80)
                                                .padding(.top, 10)
                                                .padding(.bottom, 10)
                                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                        }
                                    }
                                    .modifier(PannelModifier(height: 270))
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
            }
            .modifier(NewsToolbarModifier(viewModel: viewModel, currentPage: viewModel.currentPage, totalPage: viewModel.news.totalPage))
            .onTapGesture {
                if progress.count == 0 {
                    self.progress.append(0)
                    self.viewModel.currentPage += 1
                }
            }
            .onAppear {
                if viewModel.news.lastPage == 0 {
                    startPopup = true
                    
                } else {
                    for _ in 0...viewModel.news.lastPage {
                        progress.append(0)
                    }
                }
            }
            .popup(isPresented: $startPopup) {
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
            .popup(isPresented: $endPopup) {
                NewsCompletionView(type: .priceLevel, currentPage: viewModel.currentPage, isPopupLoading: $isPopupLoading, loadingBarState: $loadingBarState)
                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            withAnimation {
                                self.isPopupLoading = false
                            }
                        }
                    }
            } customize: {
                $0
                    .animation(.spring(duration: 0.7))
                    .closeOnTapOutside(false)
                    .closeOnTap(false)
                    .backgroundColor(.gray.opacity(0.8))
            }
            .overlay {
                if loadingBarState {
                    LottieView(fileName: "Loading", loopMode: .loop, width: 200, height: 200)
                        .padding(.bottom, 60)
                }
            }
        }
    }
}

#Preview {
    PriceLevelNewsView(viewModel: NewsViewModel(news: News.DUMMY_NEWS))
        .environment(NavigationRouter())
        .environment(NewsListCapsule())
}
