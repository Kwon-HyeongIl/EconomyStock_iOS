//
//  BasicEconomy7View.swift
//  EconomyStock
//
//  Created by 권형일 on 11/8/24.
//

import SwiftUI

struct BasicEconomy7View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    @State private var nextButton = false
    @State private var beforeButton = false
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("2.")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.ESTitle)
                        .padding(.leading, 30)
                        .padding(.bottom, 3)
                    
                    Text("GDP (국내총생산)")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                .opacity(0.2)
                .padding(.top)
                
                Spacer()
                
                if nextButton {
                    ZStack {
                        Button {
                            viewModel.currentPage += 1
                            navigationRouter.navigate(.BasicEconomy3View(viewModel))
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
        .modifier(CourseToolbarModifier(viewModel: viewModel, currentPage: viewModel.currentPage, totalPage: viewModel.course.totalPage))
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.smooth(duration: 1.0)) {
                
            }
        }
    }
}

#Preview {
    BasicEconomy7View(viewModel: CourseViewModel(course: .DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
