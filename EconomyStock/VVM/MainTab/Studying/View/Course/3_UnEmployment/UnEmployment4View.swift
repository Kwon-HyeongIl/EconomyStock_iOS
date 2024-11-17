//
//  UnEmployment4View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/16/24.
//

import SwiftUI

struct UnEmployment4View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var nextButton = false
    @State private var beforeButton = false
    
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                ZStack {
                    ScrollView {
                        HStack {
                            Text("1.")
                                .font(.system(size: 35))
                                .fontWeight(.bold)
                                .foregroundStyle(Color.ESTitle)
                                .padding(.leading, 30)
                                .padding(.bottom, 3)
                            
                            Text("물가의 개념")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                            
                            Spacer()
                        }
                        .opacity(0.2)
                        .padding(.top)
                        
                        ZStack {
                            VStack {
                                if progress.count >= 1 {
                                    (Text("물가의 중요한 특징 중 하나는, 물가와 화폐 가치가 ")
                                     + Text("반비례")
                                        .foregroundStyle(Color.ESTitle)
                                        .fontWeight(.bold)
                                     + Text("한다는 사실이에요"))
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                                    .padding(.top)
                                    
                                }
                                
                                Spacer()
                            }
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 100, height: 200)
                        }
                        
                        Rectangle()
                            .fill(.clear)
                            .frame(width: 100, height: 85)
                            .id("bottom")
                    }
                    
                    if nextButton {
                        VStack {
                            Spacer()
                            
                            ZStack {
                                Button {
                                    let view = UIView(frame: .zero)
                                    UIImpactFeedbackGenerator(style: .light, view: view).impactOccurred()
                                    
                                    viewModel.currentPage += 1
                                    navigationRouter.navigate(.PriceLevel3View(viewModel))
                                } label: {
                                    LottieViewConverter(fileName: "CourseNextButton", loopMode: .playOnce, speed: 0.5, scale: 2.0, width: 100, height: 100)
                                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
                                }
                                
                                if beforeButton {
                                    HStack {
                                        Button {
                                            viewModel.currentPage -= 1
                                            navigationRouter.back()
                                        } label: {
                                            Image(systemName: "chevron.left")
                                                .font(.system(size: 25))
                                                .fontWeight(.semibold)
                                                .foregroundStyle(Color.ESTitle)
                                                .padding()
                                                .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding(.leading, 60)
                                    .padding(.trailing, 70)
                                }
                            }
                        }
                    }
                }
            }
            .modifier(CourseToolbarModifier(viewModel: viewModel, currentPage: viewModel.currentPage, totalPage: viewModel.course.totalPage))
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.smooth(duration: 1.0)) {
                    if progress.count < 3 {
                        progress.append(1)
                    }
                    
                    if progress.count == 2 {
                        withAnimation {
                            proxy.scrollTo("bottom", anchor: .bottom)
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                            withAnimation(.smooth(duration: 1.0)) {
                                nextButton = true
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    withAnimation(.smooth(duration: 1.0)) {
                                        beforeButton = true
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    UnEmployment4View(viewModel: CourseViewModel(course: Course.DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
