//
//  MoneyAndFinanceNewsView.swift
//  EconomyStock
//
//  Created by 권형일 on 2/14/25.
//

import SwiftUI
import PopupView

struct MoneyAndFinanceNewsView: View {
    @Bindable var viewModel: NewsViewModel
    
    @State private var progress: [Int] = []
    @State private var selected_O = false
    @State private var selected_X = false
    @State private var bottomHeight = 0.0
    
    @State private var animationOpacity = 0.0
    
    @State private var alertInfo = false
    
    @State private var startPopup = false
    @State private var endPopup = false
    @State private var isPopupLoading = true
    
    @State private var loadingBarState = false
    
    init(viewModel: NewsViewModel) {
        self.viewModel = viewModel
        
        for _ in 0...viewModel.news.lastPage {
            progress.append(0)
        }
    }
    
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
                                    
                                    HStack {
                                        Spacer()
                                        
                                        Button {
                                            self.alertInfo = true
                                        } label: {
                                            Image(systemName: "info.circle")
                                                .scaledToFit()
                                                .frame(width: 15, height: 15)
                                                .foregroundStyle(.gray.opacity(0.8))
                                                .padding(.trailing, 10)
                                                .padding(.bottom, 45)
                                        }
                                        .alert("정보", isPresented: $alertInfo) {
                                            Button {
                                                
                                            } label: {
                                                Text("확인")
                                            }
                                        } message: {
                                            Text("경제스톡 내의 뉴스는 가상으로 작성된 뉴스입니다.")
                                        }
                                    }
                                }
                                
                                Text("한국은행, 화폐공급 확대... 경기 부양 속 물가 우려")
                                    .font(.system(size: 20).bold())
                                    .foregroundStyle(.black)
                                    .padding(.top, 10)
                                    .padding(.bottom, 20)
                                
                                VStack(spacing: 25) {
                                    JustifiedText("최근 한국은행은 경기 부양을 위해 적극적으로 화폐공급을 확대하며, 금리 인하와 채권 매입 프로그램을 통해 시중에 유동성을 공급하고 있다. 이번 조치는 기업 투자와 소비 활성화를 목표로 하고 있으나, 과도한 자금 공급이 장기적으로 물가 상승 압력을 불러올 우려가 있다.", maxWidth: geometryProxy.size.width - 45)
                                        .overlay {
                                            if progress.count == 1 {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundStyle(.yellow.opacity(0.18))
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
                              
                                    JustifiedText("공식 자료에 따르면, 중앙은행은 신용 공급 확대를 통해 내수 진작에 나서고 있다. 한 관계자는 “경기 부양은 물론 소비와 설비투자 활성화를 기대하지만, 동시에 인플레이션 관리에도 주의를 기울여야 한다”고 설명했다.", maxWidth: geometryProxy.size.width - 45)
                                        .overlay {
                                            if progress.count == 2 {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundStyle(.red.opacity(0.15))
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
                                    
                                    JustifiedText("금융 전문가들은 단기 경기 회복 효과는 긍정적이지만, 유동성 과잉이 인플레이션으로 전환될 위험이 있다고 경고한다. “정책의 균형을 맞추기 위한 지속적인 모니터링이 필수적”이라는 의견이 나온다.", maxWidth: geometryProxy.size.width - 45)
                                        .overlay {
                                            if progress.count == 3 {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundStyle(.yellow.opacity(0.18))
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
                                    
                                    JustifiedText("기업들은 낮은 금리의 혜택을 받아 투자 확대에 나서고 있으나, 소비자들은 향후 물가 상승으로 인한 생활비 부담 증가를 우려하고 있다. 일부 소비자 대표는 “금융 지원이 단기적으로는 도움이 되겠지만, 장기적으로 물가에 반영될 것”이라며 우려를 표명했다.", maxWidth: geometryProxy.size.width - 45)
                                        .overlay {
                                            if progress.count == 4 {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundStyle(.red.opacity(0.15))
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
                                    
                                    JustifiedText("또한, 글로벌 경제 변화와 외부 충격 역시 국내 경제에 영향을 미치고 있어, 중앙은행의 정책 결정은 국제 여건과의 연계성을 고려해야 한다. 이러한 요인들은 화폐공급 확대의 효과를 더욱 복잡하게 만든다.", maxWidth: geometryProxy.size.width - 45)
                                        .overlay {
                                            if progress.count == 5 {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundStyle(.yellow.opacity(0.18))
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
                                    
                                    JustifiedText("정부와 한국은행은 단기 경기 부양과 장기 물가 안정을 동시에 달성하기 위해 면밀한 정책 조정과 평가를 지속할 계획이다. 향후 유연한 대응이 한국 경제의 안정적 성장에 중요한 역할을 할 것으로 전망된다.", maxWidth: geometryProxy.size.width - 45)
                                        .overlay {
                                            if progress.count == 6 {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .foregroundStyle(.red.opacity(0.15))
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
                                    
                                    JustifiedText("아울러, 이번 정책이 금융시장과 소비자 신뢰에 미치는 영향을 주기적으로 점검하여, 필요시 신속한 조정 조치를 취할 준비가 되어있음을 관계자들은 강조한다. 이는 단기적 경제 부양과 함께 장기적 경제 안정을 위한 체계적인 관리 시스템 구축의 일환으로 해석된다.", maxWidth: geometryProxy.size.width - 45)
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
                                    
                                    (Text("한국은행의 확장적 통화정책은 단기적으로 ")
                                     + Text("경제 활성화를 유도")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("하고 ")
                                     + Text("기업 및 소비자 신용을 개선")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("하는 효과를 기대할 수 있어요.\n\n그러나 지나친 유동성 공급은 장기적으로 인플레이션 압력을 높여 ")
                                     + Text("화폐 가치 하락")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("과 ")
                                     + Text("생활비 상승 ")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("등 부정적 여파를 초래해요.")
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
                                .modifier(PannelModifier(height: 310))
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
                                        
                                        Text("신용 공급 확대 정책은 내수를 촉진하고 동시에 경제 주체들의 저축률을 상승시켜 소비가 추가로 증가하게 만든다.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 10)
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
                                    .modifier(PannelModifier(height: 250))
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
                                            VStack {
                                                Image(systemName: "xmark.seal")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 35)
                                                    .fontWeight(.semibold)
                                                    .foregroundStyle(.red)
                                                    .padding(.top, 10)
                                                
                                                Text("틀렸어요")
                                                    .font(.system(size: 20).bold())
                                            }
                                            
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
                                                        .padding(.bottom, 45)
                                                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                                }
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        Text("신용 공급 확대는 소비와 투자 활성화에 기여하지만, 일반적으로 저축률을 증가시키는 효과와는 무관하거나 반대 방향으로 작용할 수 있어요.\n\n유동성 증가로 인해 이자율이 낮아지면 저축 유인이 약해지고, 오히려 소비가 늘어날 가능성이 높아요. 따라서 틀린 문장이에요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 10)
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
                                    .modifier(PannelModifier(height: 370))
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
                                            VStack {
                                                Image(systemName: "checkmark.seal")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 35)
                                                    .fontWeight(.semibold)
                                                    .foregroundStyle(.green)
                                                    .padding(.top, 10)
                                                
                                                Text("정답이에요!")
                                                    .font(.system(size: 20).bold())
                                            }
                                            
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
                                                        .padding(.bottom, 45)
                                                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                                }
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        Text("신용 공급 확대는 소비와 투자 활성화에 기여하지만, 일반적으로 저축률을 증가시키는 효과와는 무관하거나 반대 방향으로 작용할 수 있어요.\n\n유동성 증가로 인해 이자율이 낮아지면 저축 유인이 약해지고, 오히려 소비가 늘어날 가능성이 높아요. 따라서 올바른 문장이에요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 10)
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
                                    .modifier(PannelModifier(height: 370))
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
                                    
                                    (Text("전문가들은 단기적 유동성 확대가 경기 회복에 기여할 수 있음을 인정하면서도, 과도한 자금 공급이 인플레이션으로 전환될 가능성을 경고하고 있어요.\n\n이로 인해 중앙은행은 정책 실행 후 지속적으로 경제 지표를 모니터링하여 필요시 ")
                                     + Text("신속히 조정하는 유연성을 확보")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("해야 해요.")
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
                                .modifier(PannelModifier(height: 330))
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
                                        
                                        Text("낮은 금리와 풍부한 유동성은 기업에 설비 투자 기회를 제공하지만, 소비자 입장에서는 인플레이션에 대한 부담이 가중될 수 있다.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 10)
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
                                            VStack {
                                                Image(systemName: "checkmark.seal")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 35)
                                                    .fontWeight(.semibold)
                                                    .foregroundStyle(.green)
                                                    .padding(.top, 10)
                                                
                                                Text("정답이에요!")
                                                    .font(.system(size: 20).bold())
                                            }
                                            
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
                                                        .padding(.bottom, 45)
                                                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                                }
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        Text("확장적 통화정책은 기업들에 유리한 투자 환경을 조성해요. 그러나 유동성 확대가 물가 상승으로 이어지면 소비자들은 실질 소득 감소로 인해 생활비 부담을 겪게 될 수 있어요.\n\n이로 인해 경제 주체 간 이익이 상반된 결과가 나타날 수 있으며, 따라서 올바른 문장이에요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 10)
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
                                    .modifier(PannelModifier(height: 355))
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
                                            VStack {
                                                Image(systemName: "xmark.seal")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 35)
                                                    .fontWeight(.semibold)
                                                    .foregroundStyle(.red)
                                                    .padding(.top, 10)
                                                
                                                Text("틀렸어요")
                                                    .font(.system(size: 20).bold())
                                            }
                                            
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
                                                        .padding(.bottom, 45)
                                                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                                }
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        Text("확장적 통화정책은 기업들에 유리한 투자 환경을 조성해요. 그러나 유동성 확대가 물가 상승으로 이어지면 소비자들은 실질 소득 감소로 인해 생활비 부담을 겪게 될 수 있어요.\n\n이로 인해 경제 주체 간 이익이 상반된 결과가 나타날 수 있으며, 따라서 틀린 문장이에요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 10)
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
                                    .modifier(PannelModifier(height: 355))
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
                                    
                                    (Text("국제 경제 환경과 외부 충격은 국내 금융정책의 효과에 복합적으로 작용해요.\n\n글로벌 시장의 변동성, 무역 긴장 및 외부 금융 요인들은 국내 유동성 확대 정책의 효과와 부작용을 예측하기 어렵게 하며, 중앙은행이 국제 여건을 반영한 ")
                                     + Text("다층적 분석")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("과 ")
                                     + Text("조정 메커니즘")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("을 도입해야 함을 시사해요.")
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
                                .modifier(PannelModifier(height: 330))
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
                                        
                                        Text("단기적인 경기 부양과 장기적인 물가 안정을 한 가지 정책 수단만으로 동시에 달성하는 것은 사실상 어렵다.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 10)
                                            .padding(.horizontal, 10)
                                        
                                        Spacer()
                                        
                                        HStack {
                                            Button {
                                                self.bottomHeight = 380
                                                withAnimation {
                                                    scrollProxy.scrollTo("7", anchor: .top)
                                                }
                                                self.selected_O = true
                                                self.animationOpacity = 0.0
                                            } label: {
                                                LottieOButton()
                                            }
                                            
                                            Button {
                                                self.bottomHeight = 380
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
                                    .modifier(PannelModifier(height: 255))
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
                                            VStack {
                                                Image(systemName: "checkmark.seal")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 35)
                                                    .fontWeight(.semibold)
                                                    .foregroundStyle(.green)
                                                    .padding(.top, 10)
                                                
                                                Text("정답이에요!")
                                                    .font(.system(size: 20).bold())
                                            }
                                            
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
                                                        .padding(.bottom, 45)
                                                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                                }
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        Text("단기 경기 부양을 위해 유동성을 확대하거나 금리를 낮추면 인플레이션 압력이 커질 가능성이 있으며, 반대로 물가 안정을 중시하면 경기 진작 효과가 제한될 수 있어요.\n\n따라서 재정·통화 정책을 비롯한 여러 수단을 함께 조정해야 두 목표를 균형 있게 달성할 수 있어요. 따라서 올바른 문장이에요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 10)
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
                                    .modifier(PannelModifier(height: 375))
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
                                            VStack {
                                                Image(systemName: "xmark.seal")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 35)
                                                    .fontWeight(.semibold)
                                                    .foregroundStyle(.red)
                                                    .padding(.top, 10)
                                                
                                                Text("틀렸어요")
                                                    .font(.system(size: 20).bold())
                                            }
                                            
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
                                                        .padding(.bottom, 45)
                                                        .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                                }
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        Text("단기 경기 부양을 위해 유동성을 확대하거나 금리를 낮추면 인플레이션 압력이 커질 가능성이 있으며, 반대로 물가 안정을 중시하면 경기 진작 효과가 제한될 수 있어요.\n\n따라서 재정·통화 정책을 비롯한 여러 수단을 함께 조정해야 두 목표를 균형 있게 달성할 수 있어요. 따라서 틀린 문장이에요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 10)
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
                                    .modifier(PannelModifier(height: 375))
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
                    + Text("\'터치\'")
                        .foregroundStyle(Color.ESTitle)
                    + Text("해 주세요"))
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
                NewsCompletionView(type: .moneyAndFinance, currentPage: viewModel.currentPage, isPopupLoading: $isPopupLoading, loadingBarState: $loadingBarState)
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
    MoneyAndFinanceNewsView(viewModel: NewsViewModel(news: News.DUMMY_NEWS))
        .environment(NavigationRouter())
        .environment(NewsListCapsule())
}
