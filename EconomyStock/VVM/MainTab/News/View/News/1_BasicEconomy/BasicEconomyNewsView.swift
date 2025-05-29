//
//  BasicEconomyNewsView.swift
//  EconomyStock
//
//  Created by 권형일 on 1/12/25.
//

import SwiftUI
import PopupView

struct BasicEconomyNewsView: View {
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
                                
                                Text("소비•투자 활황... 국민소득 5% 증가")
                                    .font(.system(size: 20).bold())
                                    .foregroundStyle(.black)
                                    .padding(.top, 10)
                                    .padding(.bottom, 20)
                                
                                VStack(spacing: 25) {
                                    JustifiedText("최근 국내 경제가 소비와 투자 증가를 기반으로 견고한 성장세를 보이고 있으며, 이로 인해 국민 소득이 크게 증가했다.", maxWidth: geometryProxy.size.width - 45)
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
                                    
                                    JustifiedText("통계청과 한국은행이 발표한 자료에 따르면, 올해 3분기 국민총소득(GNI)은 전년 동기 대비 5.2% 증가했다. 이는 소비 회복과 기업 투자 확대가 맞물려 경제 활력이 되살아난 결과로 분석된다.", maxWidth: geometryProxy.size.width - 45)
                                        .overlay {
                                            if progress.count == 2 {
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
                                        .id("2")
                                    
                                    JustifiedText("가계 소비는 팬데믹 이후 안정적인 고용 상황과 정부의 경기 부양 정책에 힘입어 꾸준히 증가하고 있다. 3분기 민간소비는 전년 대비 4.8% 상승했으며, 특히 여행, 외식, 의류 등 서비스 부문에서 두드러진 증가세를 보였다.", maxWidth: geometryProxy.size.width - 45)
                                        .overlay {
                                            if progress.count == 3 {
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
                                        .id("3")
                                    
                                    JustifiedText("서울에 거주하는 톡톡씨는 “소득이 늘고 경제 상황에 대한 불안이 줄어들면서 가족과 함께 해외여행을 다녀왔다”며 “이제는 돈을 쓰는 데 있어 예전만큼 신중하지 않아도 될 것 같다”고 말했다.", maxWidth: geometryProxy.size.width - 45)
                                        .id("4")
                                    
                                    JustifiedText("한편, 기업들의 설비투자와 연구개발(R&D) 투자도 큰 폭으로 증가했다. 3분기 기업 설비투자는 전년 동기 대비 8.1% 증가하며 6년 만에 가장 높은 성장률을 기록했다. 특히 반도체, 자동차, 배터리 등 첨단 제조업 분야에서의 대규모 투자 확대가 국민소득 증가에 기여했다.", maxWidth: geometryProxy.size.width - 45)
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
                                        .id("5")
                                    
                                    JustifiedText("한국경제연구원 관계자는 “글로벌 수요 회복과 기업의 기술 경쟁력 강화 노력으로 투자 규모가 커졌다”며 “향후에도 지속적인 경제 성장 동력을 제공할 것”이라고 평가했다.", maxWidth: geometryProxy.size.width - 45)
                                        .id("6")
                                    
                                    JustifiedText("정부의 적극적인 정책 지원도 국민소득 증가를 뒷받침하고 있다. 정부는 소비 진작을 위해 재난지원금을 지급하고 저소득층 지원을 확대했다. 또한 중소기업을 위한 투자 세제 혜택과 같은 다양한 정책을 통해 내수와 투자 확대를 견인했다.", maxWidth: geometryProxy.size.width - 45)
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
                                        .id("7")
                                    
                                    JustifiedText("기획재정부는 “경제의 선순환 구조가 점차 자리 잡고 있다”며 “소비와 투자가 성장의 중심축으로 자리 잡는 것이 긍정적 신호”라고 밝혔다.", maxWidth: geometryProxy.size.width - 45)
                                        .id("8")
                                    
                                    JustifiedText("국민소득 증가로 인해 개인 소득이 상승하면서 저축률도 함께 높아지고 있다. 전문가들은 이러한 선순환 구조가 중장기적으로 국가 경제에 긍정적인 영향을 미칠 것으로 내다보고 있다.", maxWidth: geometryProxy.size.width - 45)
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
                                        .id("9")
                                    
                                    JustifiedText("하지만 일각에서는 소비와 투자 증가가 환율 변동, 원자재 가격 상승 등 외부 요인에 취약할 수 있다는 점을 경고하고 있다. 전문가들은 “지속 가능한 성장을 위해 소비와 투자의 질적 향상이 중요하다”며 “특히 투자 효율성과 내수 기반 강화를 위한 정책이 필요하다”고 강조했다.", maxWidth: geometryProxy.size.width - 45)
                                        .overlay {
                                            if progress.count == 7 {
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
                                        .id("10")
                                    
                                    JustifiedText("현재 경제가 소비와 투자 활황으로 인해 활력을 되찾고 있는 가운데, 이를 유지하고 확대하기 위해 정부와 기업의 지속적인 노력이 중요해지고 있다. 경제 성장의 동력을 유지하기 위해 장기적인 정책과 계획이 필요하며, 이를 통해 국가 경제의 지속 가능성을 확보하는 것이 관건이 될 것이다.", maxWidth: geometryProxy.size.width - 45)
                                        .overlay {
                                            if progress.count == 8 {
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
                                        .padding(.bottom)
                                        .id("11")
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
                                    
                                    (Text("소비와 투자 증가는 GDP의 구성 요소로, 경제 성장의 핵심 동력이에요. 소비 증가는 ")
                                     + Text("내수 진작")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("을, 투자 증가는 ")
                                     + Text("자본 축척과 생산성 향상")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("을 통해 장기적인 경제 성장을 지원해요.\n\n국민소득의 증가는 ")
                                     + Text("경제가 확장 국면")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("에 있다는 신호로 해석할 수 있어요.")
                                    )
                                    .font(.system(size: 16))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.semibold)
                                    .padding(.top, 10)
                                    .padding(.horizontal, 16)
                                    
                                    Spacer()
                                    
                                    Button {
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
                                .modifier(PannelModifier(height: 325))
                                .opacity(animationOpacity)
                                .onAppear {
                                    withAnimation {
                                        animationOpacity = 1.0
                                    }
                                }
                                
                            } else if progress.count == 2 {
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
                                                .padding(.bottom, 5)
                                                .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                        }
                                    }
                                    .foregroundStyle(Color.ESTitle)
                                    .fontWeight(.bold)
                                    .padding(.leading)
                                    
                                    Spacer()
                                    
                                    (Text("GNI는 국내 총생산(GDP)에 국외 순수취 요소소득을 더한 지표로, ")
                                     + Text("국민의 실질 소득 수준")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("을 나타내요.\n\n5.2% 증가는 경제 활동의 활력뿐만 아니라 국제 무역 및 해외 투자로부터의 소득 증가도 반영된 결과로 볼 수 있어요.")
                                    )
                                    .font(.system(size: 16))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.semibold)
                                    .padding(.top, 10)
                                    .padding(.horizontal, 10)
                                    
                                    Spacer()
                                    
                                    Button {
                                        withAnimation {
                                            scrollProxy.scrollTo("2", anchor: .top)
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
                                .modifier(PannelModifier(height: 305))
                                .opacity(animationOpacity)
                                .onAppear {
                                    withAnimation {
                                        animationOpacity = 1.0
                                    }
                                }
                                
                            } else if progress.count == 3 {
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
                                                    .padding(.bottom, 10)
                                                    .shadow(color: .gray.opacity(0.3), radius: 5, x: 5, y: 5)
                                            }
                                        }
                                        .foregroundStyle(.red)
                                        .fontWeight(.bold)
                                        .padding(.leading)
                                        
                                        Spacer()
                                        
                                        Text("서비스 부문의 소비 증가는 경제 성장률에 직접적인 영향을 미치며, 이는 GDP 구성 요소 중 정부 지출에 포함된다.")
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
                                        
                                        Text("서비스 부문의 소비 증가는 경제 성장률에 직접적인 영향을 미치지만, 이는 GDP의 민간소비 항목에 포함돼요.\n\n정부 지출은 별도의 GDP 구성 요소로, 공공서비스나 사회간접자본 투자와 관련된 지출을 의미해요. 따라서 틀린 문장이에요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 10)
                                            .padding(.horizontal, 10)
                                        
                                        Spacer()
                                        
                                        Button {
                                            withAnimation {
                                                scrollProxy.scrollTo("3", anchor: .top)
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
                                    .modifier(PannelModifier(height: 350))
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
                                        
                                        Text("서비스 부문의 소비 증가는 경제 성장률에 직접적인 영향을 미치지만, 이는 GDP의 민간소비 항목에 포함돼요.\n\n정부 지출은 별도의 GDP 구성 요소로, 공공서비스나 사회간접자본 투자와 관련된 지출을 의미해요. 따라서 틀린 문장이에요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 10)
                                            .padding(.horizontal, 10)
                                        
                                        Spacer()
                                        
                                        Button {
                                            withAnimation {
                                                scrollProxy.scrollTo("3", anchor: .top)
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
                                    .modifier(PannelModifier(height: 350))
                                    .opacity(animationOpacity)
                                    .onAppear {
                                        withAnimation {
                                            animationOpacity = 1.0
                                        }
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
                                        
                                        Text("설비투자의 증가는 단기적으로 생산성을 낮추지만, 장기적으로는 GDP의 공급 측면을 강화하는 데 기여한다.")
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
                                        
                                        Text("설비투자는 생산설비 확충을 목적으로 하므로 초기에는 비용이 발생해 단기 생산성에 부담이 될 수 있어요.\n\n하지만, 장기적으로는 생산 능력을 증대시키고 기술 혁신을 통해 GDP의 공급 측면을 강화해요. 따라서, 올바른 문장이에요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 10)
                                            .padding(.horizontal, 10)
                                        
                                        Spacer()
                                        
                                        Button {
                                            self.bottomHeight = 100
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
                                        
                                        Text("설비투자는 생산설비 확충을 목적으로 하므로 초기에는 비용이 발생해 단기 생산성에 부담이 될 수 있어요.\n\n하지만, 장기적으로는 생산 능력을 증대시키고 기술 혁신을 통해 GDP의 공급 측면을 강화해요. 따라서, 올바른 문장이에요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 10)
                                            .padding(.horizontal, 10)
                                        
                                        Spacer()
                                        
                                        Button {
                                            self.bottomHeight = 100
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
                                    
                                    (Text("재난지원금과 저소득층 지원은 ")
                                     + Text("소득 재분배 효과")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("를 통해 소비 성향이 높은 계층의 소비를 촉진하는 데 효과적이에요.\n\n이는 단기적으로 내수 활성화를 이끌고, 경기 하강을 방어하는 수단으로 작용해요.")
                                    )
                                    .font(.system(size: 16))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.semibold)
                                    .padding(.top, 10)
                                    .padding(.horizontal, 10)
                                    
                                    Spacer()
                                    
                                    Button {
                                        self.bottomHeight = 200
                                        withAnimation {
                                            scrollProxy.scrollTo("7", anchor: .top)
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
                                .modifier(PannelModifier(height: 295))
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
                                        
                                        Text("국민소득이 증가하면 소비 성향이 감소하는 경향이 있으며, 이는 저축률 증가로 이어질 가능성이 높다.")
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
                                        
                                        Text("국민소득이 증가하면 추가 소득 중 일부는 소비로 사용되지만, 한계소비성향이 감소하는 경향이 있어요. n즉, 소득이 높아질수록 저축에 할당되는 비율이 증가한다는 뜻이에요.\n\n이는 경제 이론에서 저축률 증가와 연관되는 일반적인 현상으로 분석된다. 따라서 올바른 문장이에요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 10)
                                            .padding(.horizontal, 10)
                                        
                                        Spacer()
                                        
                                        Button {
                                            self.bottomHeight = 260
                                            withAnimation {
                                                scrollProxy.scrollTo("11", anchor: .top)
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
                                        
                                        Text("국민소득이 증가하면 추가 소득 중 일부는 소비로 사용되지만, 한계소비성향이 감소하는 경향이 있어요. n즉, 소득이 높아질수록 저축에 할당되는 비율이 증가한다는 뜻이에요.\n\n이는 경제 이론에서 저축률 증가와 연관되는 일반적인 현상으로 분석된다. 따라서 올바른 문장이에요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 10)
                                            .padding(.horizontal, 10)
                                        
                                        Spacer()
                                        
                                        Button {
                                            self.bottomHeight = 260
                                            withAnimation {
                                                scrollProxy.scrollTo("11", anchor: .top)
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
                                    
                                    (Text("질적 성장은 단순한 경제 규모의 확대가 아닌, ")
                                     + Text("생산성 향상과 기술 발전을 동반하는 성장")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("을 의미하며, 고부가가치 산업으로의 전환과 효율적인 자원 배분이 핵심이 돼요.")
                                    )
                                    .font(.system(size: 16))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.semibold)
                                    .padding(.top, 10)
                                    .padding(.horizontal, 10)
                                    
                                    Spacer()
                                    
                                    Button {
                                        self.bottomHeight = 318
                                        withAnimation {
                                            scrollProxy.scrollTo("11", anchor: .top)
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
                                .modifier(PannelModifier(height: 250))
                                .opacity(animationOpacity)
                                .onAppear {
                                    withAnimation {
                                        animationOpacity = 1.0
                                    }
                                }
                                
                            } else if progress.count == 8 {
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
                                    
                                    (Text("소비와 투자는 경제의 단기 성장 동력으로 작용하지만, 장기적 경제 안정성과 지속 가능성을 위해 ")
                                     + Text("정책적 지원")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("과 ")
                                     + Text("구조적 개혁")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("이 필요해요.\n\n이는 외부 충격에 대한 경제의 회복 탄력성을 강화하는 데 기여한다고 볼 수 있어요.")
                                    )
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
                                .modifier(PannelModifier(height: 310))
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
                NewsCompletionView(type: .basicEconomy, currentPage: viewModel.currentPage, isPopupLoading: $isPopupLoading, loadingBarState: $loadingBarState)
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
    BasicEconomyNewsView(viewModel: NewsViewModel(news: News.DUMMY_NEWS))
        .environment(NavigationRouter())
        .environment(NewsListCapsule())
}
