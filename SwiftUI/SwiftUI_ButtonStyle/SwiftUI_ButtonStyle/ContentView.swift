//
//  ContentView.swift
//  SwiftUI_ButtonStyle
//
//  Created by 백승엽 on 2022/03/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            Button {
                print("button clicked!")
            } label: {
                Text("탭")
                    .fontWeight(.bold)
                    
            }.buttonStyle(MyButtonStyle(color: Color.blue, type: .tab))
            
            Button(action: {
                print("button clicked!")
            }, label: {
                Text("롱클릭")
                    .fontWeight(.bold)
            }).buttonStyle(MyButtonStyle(color: Color.green, type: .long))
            
            Button {
                print("button clicked!")
            } label: {
                Text("회전 버튼")
                    .fontWeight(.bold)
            }.buttonStyle(MyRotateButtonStyle(color: Color.pink))

            Button {
                print("button clicked!")
            } label: {
                Text("축소 버튼")
                    .fontWeight(.bold)
            }.buttonStyle(MySmallerButtonStyle(color: Color.orange))
            
            Button {
                print("button clicked!")
            } label: {
                Text("블러 버튼")
                    .fontWeight(.bold)
            }.buttonStyle(MyBlurButtonStyle(color: Color.purple))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
