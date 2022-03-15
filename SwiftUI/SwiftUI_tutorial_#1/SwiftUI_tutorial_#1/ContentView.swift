//
//  ContentView.swift
//  SwiftUI_tutorial_#1
//
//  Created by 백승엽 on 2022/03/10.
//
// - @State, @Binding
// - NavigationView, NavigationLink
// - VStack, HStack, Text

import SwiftUI

struct ContentView: View {
    
    // @State 값의 변화를 감지 -> 뷰에 적용
    @State
    private var isActivated: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    // $는 Binding변수임을 나타냄
                    MyVstackView(isActivated: $isActivated)
                    MyVstackView(isActivated: $isActivated)
                    MyVstackView(isActivated: $isActivated)
                } // HStack
                .padding(isActivated ? 50.0 : 10.0)
                //
                .background(isActivated ? Color.yellow : Color.black)
                // 탭 제스처 추가 (클릭)
                .onTapGesture {
                    // 애니메이션과 함께
                    withAnimation {
                        // toggle() true 이면 false 로 false 이면 true
                        self.isActivated.toggle()
                    }
                } // HStack more
                
                // 네비게이션 버튼(링크)
                NavigationLink(destination: MyTextView(isActivated: $isActivated)) {
                    Text("Navigation Button")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .padding()
                        .background(Color.orange)
                        .background()
                        .cornerRadius(30)
                }.padding(.top, 50)
            }
        } // NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
