//
//  ScrollViewOffsetPreferenceKey.swift
//  ScrollView_Offset_tutorial
//
//  Created by 백승엽 on 2022/03/29.
//

import Foundation
import SwiftUI

/// 스크롤뷰 옵셋 프레퍼런스키
struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    // PreferenceKey ? 자식뷰에서 부모뷰한테 이벤트를 전달할 수 있음
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
    
    
}


extension View {
    
    /// 스크롤뷰 바텀 여부
    /// - Parameters:
    ///   - threshold: 여유 수치
    ///   - action: 바텀 여부 액션
    /// - Returns: 
    func isScrollViewBottom(threshold: CGFloat = 0, action: @escaping (_ isBottom: Bool) -> ()) -> some View {
        self
            .background(GeometryReader{ geoProxy in
            Text("")
                .preference(key: ScrollViewOffsetPreferenceKey.self, value: geoProxy.frame(in: .global).minY)
        })
        .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { updatedOffset in
//            print("ContentView - updatedOffset: ", updatedOffset)
            let isBottom = (updatedOffset - threshold) < UIScreen.main.bounds.height
//            print("ContentView - isBottom: ", isBottom)
            action(isBottom)
        }
    }
}
