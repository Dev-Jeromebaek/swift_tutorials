//
//  MyTabItemView.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by 백승엽 on 2022/03/16.
//

import SwiftUI

struct MyTabItemView: View {
    var title: String
    var bgColor: Color
    
    var body: some View {
        ZStack {
            bgColor
                .edgesIgnoringSafeArea(.top)
            Text(title)
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.white)
        } // ZStack
        .animation(.none)
    }
}

struct MyTabItemView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabItemView(title: "탭아이템뷰", bgColor: Color.orange)
    }
}
