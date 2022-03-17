//
//  MyRotateButtonStyle.swift
//  SwiftUI_ButtonStyle
//
//  Created by 백승엽 on 2022/03/17.
//

import SwiftUI

struct MyRotateButtonStyle: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        // 라벨
        
        configuration.label
            .font(.system(size: 20))
            .foregroundColor(Color.white)
            .padding()
            .background(color)
            .cornerRadius(20)
            .rotationEffect(configuration.isPressed ? .degrees(90) : .degrees(0)
//                            , anchor: .bottom
            )
    }
    
    
}

struct MyRotateButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            print("click")
        }, label: {
            Text("호호")
        })
        .buttonStyle(MyRotateButtonStyle(color: Color.blue))
    }
}
