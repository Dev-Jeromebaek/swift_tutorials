//
//  MySmallerButtonStyle.swift
//  SwiftUI_ButtonStyle
//
//  Created by 백승엽 on 2022/03/17.
//

import SwiftUI

struct MySmallerButtonStyle: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        // 라벨
        
        configuration.label
            .font(.system(size: 20))
            .foregroundColor(Color.white)
            .padding()
            .background(color)
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 0.7 : 1.0)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}

struct MySmallerButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            print("click")
        }, label: {
            Text("호호")
        })
        .buttonStyle(MySmallerButtonStyle(color: Color.blue))
    }
}
