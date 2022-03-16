//
//  MyTabView.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by 백승엽 on 2022/03/16.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        TabView {
            // 보여질 화면
            MyTabItemView(title: "1번", bgColor: Color.red)
                .tabItem {
                    Image(systemName: "airplane")
                    Text("1번")
                }
                .tag(0)
            MyTabItemView(title: "2번", bgColor: Color.orange)
                .tabItem {
                    Image(systemName: "flame.fill")
                    Text("2번")
                }
                .tag(1)
            
            MyTabItemView(title: "3번", bgColor: Color.blue)
                .tabItem {
                    Image(systemName: "doc.fill")
                    Text("3번")
                }
                .tag(2)
        }
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}

