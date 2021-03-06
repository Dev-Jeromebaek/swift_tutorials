//
//  ContentView.swift
//  ScrollView_Offset_tutorial
//
//  Created by 백승엽 on 2022/03/29.
//

import SwiftUI
import Introspect

struct ContentView: View {
    
    //MARK: - Properties
    @State var dummyEmojies: [String] = []
    
    @StateObject var scrollViewHelper: ScrollViewHelper
    
    init() {
        self._scrollViewHelper = StateObject.init(wrappedValue: ScrollViewHelper(threshold: 200) )
    }
    
    //MARK: - body
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(dummyEmojies, id: \.self) { anEmoji in
                    Text(anEmoji)
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.yellow))
                        .padding([.bottom, .horizontal], 10)
                }
            }
            
            Rectangle().fill(Color.clear).frame(height: 100)
//                .background(GeometryReader{ geoProxy in
//                    Text("")
//                        .preference(key: ScrollViewOffsetPreferenceKey.self, value: geoProxy.frame(in: .global).minY)
//                })
//                .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { updatedOffset in
//                    print("ContentView - updatedOffset: ", updatedOffset)
//                    let isBottom = (updatedOffset + 100) < UIScreen.main.bounds.height
//                    print("ContentView - isBottom: ", isBottom)
//                }
                .isScrollViewBottom(threshold: 100) { isBottom in
                    print("ContentView - preferenceKey.isBottom", isBottom)
                }
            
        }// ScrollView
        .introspectScrollView(customize: { uiScrollView in
            uiScrollView.delegate = scrollViewHelper
        })
        .onReceive(self.scrollViewHelper.isBottom, perform: { isBottom in
            print("ContentView - scrollViewHelper.isBottom", isBottom)
        })
        .onAppear {
            self.dummyEmojies = getDummyEmojis()
        }
    }
}

//MARK: - Helpers
extension ContentView {
    
    /// 더미이모지 가져오기
    /// - Returns: 더미 이모지 목록
    fileprivate func getDummyEmojis() -> [String]{
        var emojis: [String] = []
        for index in 0x1F601...0x1F64F {
            //            let anEmoji = String(UnicodeScalar(index) ?? "-")
            let anEmoji = String(UnicodeScalar(index)!)
            emojis.append(anEmoji)
        }
        return emojis
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
