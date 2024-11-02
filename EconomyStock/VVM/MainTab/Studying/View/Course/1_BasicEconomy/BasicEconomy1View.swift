//
//  BasicEconomyPage1.swift
//  EconomyStock
//
//  Created by 권형일 on 10/10/24.
//

import SwiftUI

struct BasicEconomy1View: View {
    @Environment(NavigationRouter.self) var navigationRouter
    @Bindable var viewModel: CourseViewModel
    
    @State private var progress: [Int] = []
    
    var body: some View {
        VStack {
            HStack {
                Text("경제주체")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .padding(.leading)
                
                Spacer()
            }
            
            if progress.count >= 1 {
                VStack {
                    Text("우리나라에서 경제의 주체는 \n가계, 기업, 정부, 해외부문으로 나뉘어요")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                }
                .padding(.top, 20)
            }
            
            Spacer()
            
            Button {
                viewModel.currentPage += 1
                navigationRouter.navigate(.BasicEconomy2View(viewModel))
            } label: {
                Image(systemName: "chevron.right")
                    .modifier(CourseMoveButtonModifier())
            }
        }
        .modifier(CourseToolbarModifier(viewModel: viewModel, currentPage: viewModel.currentPage, totalPage: viewModel.course.totalPage))
        .onTapGesture {
            print("클릭")
            withAnimation(.smooth(duration: 0.4)) {
                progress.append(1)
            }
        }
    }
}

#Preview {
    BasicEconomy1View(viewModel: CourseViewModel(course: .DUMMY_COURSE))
        .environment(NavigationRouter())
        .environment(CourseListViewCapsule())
}
