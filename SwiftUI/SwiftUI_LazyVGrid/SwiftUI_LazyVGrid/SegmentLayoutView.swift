//
//  SegmentLayoutView.swift
//  SwiftUI_LazyVGrid
//
//  Created by 백승엽 on 2022/03/21.
//

import SwiftUI

enum LayoutType: CaseIterable {
    case single, double, multiple
}

extension LayoutType {
    /// 레이아웃 타입에 대한 컬럼이 자동으로 설정되도록 만들어줌
    var columns: [GridItem] {
        switch self {
        case .single:
            return [
                // flexible 하나로 한줄로 표현
                GridItem(.flexible())
            ]
        case .double:
            return [
                // flexible 두개를 넣어서 한줄에 두개 아이템이 들어가게 함
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
        case .multiple:
            return [
                // adaptive를 통해 크기 닿는데 까지 아이템을 쑤셔 넣기
                GridItem(.adaptive(minimum: 100))
            ]
        }
    }
}

struct SegmentLayoutView: View {
    
    var dummyData = MyModel.dummyDataArray
    
    @State var selectedLayoutType: LayoutType = .single
    
    var body: some View {
        VStack {
            Picker(selection: $selectedLayoutType, label: Text("레이아웃 타입"), content: {
                ForEach(LayoutType.allCases, id: \.self) { layoutType in
                    switch layoutType {
                    case .single:
                        Image(systemName: "list.dash")
                    case .double:
                        Image(systemName: "square.grid.2x2.fill")
                    case .multiple:
                        Image(systemName: "circle.grid.3x3.fill")
                    }
                }
            })
            .frame(width: 250)
            .pickerStyle(SegmentedPickerStyle())
            // 내용물
            ScrollView {
                LazyVGrid(columns: selectedLayoutType.columns) {
                    ForEach(dummyData) { dataItem in
                        
                        switch selectedLayoutType {
                        case .single:
                            MyCard(icon: "book.fill", title: "책읽기", start: "1 PM", end: "3 PM", bgColor: Color.green)
                        case .double:
                            RoundedRectangle(cornerRadius: 25.0)
                                .foregroundColor(Color.orange)
                                .frame(height: 200)
                                .overlay(
                                    VStack(spacing: 2) {
                                        Circle()
                                            .frame(height: 100)
                                            .foregroundColor(.yellow)
                                        Spacer()
                                            .frame(height: 10)
                                        Text("\(dataItem.title)")
                                            .font(.system(size: 20))
                                            .fontWeight(.bold)
                                        Text("\(dataItem.content)")
                                    }
                                )
                        case .multiple:
                            Rectangle()
                                .foregroundColor(.blue)
                                .frame(height: 100)
                        }
                    }
                } // LazyVGrid
                .animation(Animation.easeInOut)
                .padding(.horizontal, 10)
            } // ScrollView
        }
    }
}

struct SegmentLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentLayoutView()
    }
}
