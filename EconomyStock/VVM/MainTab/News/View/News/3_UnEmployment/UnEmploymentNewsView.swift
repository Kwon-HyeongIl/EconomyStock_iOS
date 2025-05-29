//
//  UnEmploymentNewsView.swift
//  EconomyStock
//
//  Created by 권형일 on 2/12/25.
//

import SwiftUI
import PopupView

struct UnEmploymentNewsView: View {
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
                                
                                Text("실망노동자 증가... 실업률 통계에 잡히지 않는 '보이지 않는 위기'")
                                    .font(.system(size: 20).bold())
                                    .foregroundStyle(.black)
                                    .padding(.top, 10)
                                    .padding(.bottom, 20)
                                
                                VStack(spacing: 25) {
                                    JustifiedText("최근 공식 실업률은 낮은 수치를 보이지만, 정규직에 미치지 못하는 비정규직, 임시직, 프리랜서 등 불안정 고용에 종사하는 ‘실망노동자’가 꾸준히 늘어나고 있다. 이들은 공식 통계에 잡히지 않아 보이지 않는 위기를 야기하고 있다.", maxWidth: geometryProxy.size.width - 45)
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
                                    
                                    JustifiedText("정부 통계상 실업률은 약 3% 내외로 나타나지만, 불안정 고용에 머무는 노동자 수는 지속적으로 증가 중이다. 낮은 임금과 열악한 근로 조건 속에서 생계를 유지하는 이들은 정규직 전환 가능성이 낮아 미래에 대한 불안과 심리적 고통을 겪고 있다.", maxWidth: geometryProxy.size.width - 45)
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
                                    
                                    JustifiedText("노동 전문가들은 이를 ‘실업률 통계에 잡히지 않는 숨은 위기’라 부른다. 한 경제 연구소의 김 연구원은 단순한 실업률 수치만으로는 노동시장의 문제를 파악하기 어렵다며, 비정규직과 임시직 근로자의 열악한 환경 개선과 사회 안전망 확충이 시급하다고 강조한다.", maxWidth: geometryProxy.size.width - 45)
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
                                    
                                    JustifiedText("젊은 층과 중년 노동자들 사이에서 정규직 취업에 대한 기대가 점차 줄어들고 있다. 한 중소기업 비정규직 직원은 “비용 절감을 이유로 정규직 전환 대신 비정규직 고용이 지속되는 현실에 실망하며, 매일 불안한 미래를 마주하는 것이 큰 스트레스”라고 토로했다.", maxWidth: geometryProxy.size.width - 45)
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
                                    
                                    JustifiedText("정부는 고용 안정화와 실망노동자 문제 해소를 위해 다양한 정책을 펼치고 있으나, 현장의 목소리와 전문가 지적처럼 실질적 개선 효과는 미미하다. 노동시장 구조 개혁, 비정규직 전환 촉진, 사회 안전망 확충 등 근본적 해결책 마련이 시급하다.", maxWidth: geometryProxy.size.width - 45)
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
                                    
                                    JustifiedText("실망노동자 문제는 소비 패턴과 경제 성장에도 부정적 영향을 미친다. 불안정 고용과 낮은 임금은 가계 소비를 위축시켜 내수 시장의 활력을 저해하고, 사회적 불신 및 계층 간 갈등을 심화시킬 위험이 있다. 이를 해소하기 위해 포괄적이고 지속 가능한 노동시장 개혁이 필요하다.", maxWidth: geometryProxy.size.width - 45)
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
                                    
                                    JustifiedText("낮은 공식 실업률 뒤에 숨은 ‘실망노동자’ 문제는 단순한 통계 이상의 의미를 가진다. 수많은 노동자들의 삶과 미래를 위협하는 이 심각한 사회 문제에 대해 정부와 관련 기관은 실질적인 대책 마련에 나서야 한다.", maxWidth: geometryProxy.size.width - 45)
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
                                        .id("7")
                                    
                                    JustifiedText("더불어, 글로벌 경제 변화와 기술 발전에 따른 자동화 및 디지털 전환이 노동시장 구조에 추가적인 변동을 일으키고 있다. 정부와 기업은 미래 노동시장 변화에 선제적으로 대응할 새로운 정책과 교육 프로그램을 마련해, 실망노동자 문제의 장기적 악화를 방지해야 할 필요성이 대두되고 있다.", maxWidth: geometryProxy.size.width - 45)
                                        .padding(.bottom)
                                        .id("8")
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
                                    
                                    (Text("공식 실업률은 낮게 나타나지만, 통계에 반영되지 않는 불안정 고용의 증가로 인해 노동시장 내에서 ")
                                     + Text("잠재적 경제 불안정성이 심화")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("되고 있어요.\n\n이러한 '실망노동자' 현상은 고용의 질적 측면에서 문제를 드러내며, 장기적으로 ")
                                     + Text("소비 심리 위축 ")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("및 ")
                                     + Text("사회적 불평등 심화")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("로 이어질 위험이 있어요.")
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
                                .modifier(PannelModifier(height: 345))
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
                                        
                                        Text("정부 통계상 낮은 실업률 수치는 전체 노동시장이 안정적인 것을 의미하며, 불안정 고용 증가와는 무관하다.")
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
                                        
                                        Text("공식 실업률은 주로 정규직이나 구직 의사가 명확한 노동자를 대상으로 산정되므로, 불안정 고용(비정규직, 임시직, 프리랜서 등)은 통계에 제대로 반영되지 않아요.\n\n따라서 낮은 실업률 수치가 전체 노동시장의 안정성을 보장하지 않으며, 불안정 고용 증가는 별도의 중요한 경제적 이슈에요. 따라서 틀린 문장이에요.")
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
                                    .modifier(PannelModifier(height: 390))
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
                                        
                                        Text("공식 실업률은 주로 정규직이나 구직 의사가 명확한 노동자를 대상으로 산정되므로, 불안정 고용(비정규직, 임시직, 프리랜서 등)은 통계에 제대로 반영되지 않아요.\n\n따라서 낮은 실업률 수치가 전체 노동시장의 안정성을 보장하지 않으며, 불안정 고용 증가는 별도의 중요한 경제적 이슈에요. 따라서 올바른 문장이에요.")
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
                                    .modifier(PannelModifier(height: 390))
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
                                    
                                    (Text("전문가들은 단순한 실업률 지표로는 노동시장의 내재된 문제, 특히 비정규 및 임시직 근로자의 열악한 조건을 파악하기 어렵다고 지적하고 있어요.\n\n이는 구조적 개혁과 사회 안전망 강화의 필요성을 부각시키며, 통계에 나타나지 않는 숨은 위기가 ")
                                     + Text("장기적 경제 불안정을 야기")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("할 수 있음을 시사해요.")
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
                                .modifier(PannelModifier(height: 345))
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
                                        
                                        Text("젊은 층과 중년 노동자들의 정규직 취업 기대감 감소는 단기적 경기 변동에 따른 일시적인 현상으로 볼 수 있다.")
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
                                        
                                        Text("정규직 취업 기대감의 하락은 단순한 경기 변동이 아니라, 노동시장 구조의 근본적인 문제인 비정규 고용 확대 및 고용 안정성 부족을 반영하는 것이에요.\n\n이러한 이유로 인해 정규직 취업 기대감의 하락은 일시적인 현상으로 보기 어려우며, 따라서 틀린 문장이에요.")
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
                                        
                                        Text("정규직 취업 기대감의 하락은 단순한 경기 변동이 아니라, 노동시장 구조의 근본적인 문제인 비정규 고용 확대 및 고용 안정성 부족을 반영하는 것이에요.\n\n이러한 이유로 인해 정규직 취업 기대감의 하락은 일시적인 현상으로 보기 어려우며, 따라서 올바른 문장이에요.")
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
                                    .modifier(PannelModifier(height: 370))
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
                                    
                                    (Text("정부의 단기적 정책들은 문제의 표면적 현상을 완화하는 데 그치고 있으며, 근본적인 구조적 문제 해결에는 미흡한 것으로 보여요.\n\n")
                                     + Text("비정규직 전환 ")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("및 ")
                                     + Text("사회 안전망 확충")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("을 통한 포괄적 개혁 없이는 불안정 고용이 지속되어, 장기적 경제 안정성과 사회적 신뢰 회복에 부정적 영향을 미칠 가능성이 커요.")
                                    )
                                    .font(.system(size: 16))
                                    .multilineTextAlignment(.center)
                                    .fontWeight(.semibold)
                                    .padding(.top, 10)
                                    .padding(.horizontal, 10)
                                    
                                    Spacer()
                                    
                                    Button {
                                        self.bottomHeight = 258
                                        withAnimation {
                                            scrollProxy.scrollTo("5", anchor: .top)
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
                                        
                                        Text("불안정 고용과 낮은 임금으로 인한 가계 소비 감소는 내수 시장을 축소시키고, 결국 경제 성장에 부정적인 영향을 미친다.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 10)
                                            .padding(.horizontal, 10)
                                        
                                        Spacer()
                                        
                                        HStack {
                                            Button {
                                                self.bottomHeight = 358
                                                withAnimation {
                                                    scrollProxy.scrollTo("7", anchor: .top)
                                                }
                                                self.selected_O = true
                                                self.animationOpacity = 0.0
                                            } label: {
                                                LottieOButton()
                                            }
                                            
                                            Button {
                                                self.bottomHeight = 358
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
                                        
                                        Text("불안정 고용과 낮은 임금은 노동자들의 실질 소득을 감소시켜 가계 소비를 줄여요.\n\n소비 감소는 내수 시장의 활성화를 저해하며, 이로 인해 경제 성장 둔화와 사회적 갈등 심화로 이어질 수 있어요. 따라서 올바른 문장이에요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 10)
                                            .padding(.horizontal, 10)
                                        
                                        Spacer()
                                        
                                        Button {
                                            self.bottomHeight = 340
                                            withAnimation {
                                                scrollProxy.scrollTo("7", anchor: .top)
                                            }
                                            self.progress.append(0)
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
                                        
                                        Text("불안정 고용과 낮은 임금은 노동자들의 실질 소득을 감소시켜 가계 소비를 줄여요.\n\n소비 감소는 내수 시장의 활성화를 저해하며, 이로 인해 경제 성장 둔화와 사회적 갈등 심화로 이어질 수 있어요. 따라서 틀린 문장이에요.")
                                            .font(.system(size: 16))
                                            .multilineTextAlignment(.center)
                                            .fontWeight(.semibold)
                                            .padding(.top, 10)
                                            .padding(.horizontal, 10)
                                        
                                        Spacer()
                                        
                                        Button {
                                            self.bottomHeight = 340
                                            withAnimation {
                                                scrollProxy.scrollTo("7", anchor: .top)
                                            }
                                            self.progress.append(0)
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
                                    
                                    (Text("공식 실업률이라는 단편적인 지표가 보여주지 못하는 노동시장의 실질적 문제는 ")
                                     + Text("사회적 비용")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("과 ")
                                     + Text("경제적 불안정성")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("을 내포해요.\n\n정부와 기관이 근본적인 대책을 마련하지 않을 경우, 노동자들의 미래 불안과 소비 위축이 지속되어 ")
                                     + Text("장기적 경제 발전에 부정적인 영향")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("을 미쳐요.")
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
                                .modifier(PannelModifier(height: 335))
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
                NewsCompletionView(type: .unEmployment, currentPage: viewModel.currentPage, isPopupLoading: $isPopupLoading, loadingBarState: $loadingBarState)
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
    UnEmploymentNewsView(viewModel: NewsViewModel(news: News.DUMMY_NEWS))
        .environment(NavigationRouter())
        .environment(NewsListCapsule())
}
