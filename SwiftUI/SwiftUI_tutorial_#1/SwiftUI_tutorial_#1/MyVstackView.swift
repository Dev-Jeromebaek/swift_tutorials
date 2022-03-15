//
//  MyVstackView.swift
//  SwiftUI_tutorial_#1
//
//  Created by 백승엽 on 2022/03/10.
//

import SwiftUI

struct MyVstackView: View {
    
    // 데이터를 연동시킨다
    @Binding
    var isActivated: Bool
    
    // 생성자
    // .constant(기본값)
    init(isActivated: Binding<Bool> = .constant(true)) {
        _isActivated = isActivated
    }
    
    var body: some View {
        VStack {
            Text("semibold")
                .font(.system(size: 15))
                .fontWeight(.semibold)
                .padding()
            Text("bold")
                .font(.system(size: 15))
                .fontWeight(.bold)
                .padding()
            Text("black")
                .font(.system(size: 15))
                .fontWeight(.black)
                .padding()
        } // VStack
        .background(self.isActivated ? Color.green : Color.red)
        .padding(self.isActivated ? 5 : 0)
    }
}

// 보여주는 용도
struct MyVstackView_Previews: PreviewProvider {
    static var previews: some View {
        MyVstackView()
    }
}
