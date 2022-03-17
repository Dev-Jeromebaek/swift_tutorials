//
//  MyButtonStyle.swift
//  SwiftUI_ButtonStyle
//
//  Created by 백승엽 on 2022/03/17.
//

import SwiftUI

enum ButtonType {
    case long
    case tab
//    case smaller
//    case rotate
//    case blur
}

struct MyButtonStyle: ButtonStyle {
    
    var color: Color
    var type: ButtonType
    
    func makeBody(configuration: Configuration) -> some View {
        // 라벨
        
        configuration.label
            .font(.system(size: 20))
            .foregroundColor(Color.white)
            .padding()
            .background(color)
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
            .onTapGesture {
                if (self.type == .tab) {
                    let haptic = UIImpactFeedbackGenerator(style: .light)
                    haptic.impactOccurred()
                }
            }
            .onLongPressGesture {
                if (self.type == .long) {
                    let haptic = UIImpactFeedbackGenerator(style: .heavy)
                    haptic.impactOccurred()
                }
            }
        
//        // 클릭 여부 확인
//        configuration.isPressed
//        // 버튼 지칭
//        configuration.self
    }
    
    
}

struct MyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: {
            print("click")
        }, label: {
            Text("호호")
        })
        .buttonStyle(MyButtonStyle(color: Color.blue, type: .tab))
    }
}
