//
//  ContentView.swift
//  SwiftUI_ViewModifier
//
//  Created by 백승엽 on 2022/03/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 50) {
            Text("Hello, world!")
                .modifier(MyRoundedText())
            
            Text("Hello, world!")
                .myRoundedTextStyle()
            Image(systemName: "pencil")
                .myRoundedTextStyle()
            Rectangle()
                .frame(width: 100, height: 100)
                .myRoundedTextStyle()
        }
        
    }
}

// 뷰를 꾸며주는 모디파이어
struct MyRoundedText: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .padding()
            .background(Color.yellow)
            .cornerRadius(20)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(lineWidth: 10)
                    .foregroundColor(.blue)
            )
    }
}

extension View {
    func myRoundedTextStyle() -> some View {
        modifier(MyRoundedText())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
