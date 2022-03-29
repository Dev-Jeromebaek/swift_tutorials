//
//  ContentView.swift
//  Video_Background_tutorial
//
//  Created by 백승엽 on 2022/03/29.
//

import SwiftUI

struct ContentView: View {
    
    var titleColor = Color(#colorLiteral(red: 0.9529411793, green: 0.7490079418, blue: 0.4642641653, alpha: 1))
    var subColor = Color(#colorLiteral(red: 0.9529411793, green: 0.9070376209, blue: 0.8028577488, alpha: 1))
    
    var body: some View {
        ZStack {
//            SomeFormView()
//                .background(VideoBackgroundView())
            VideoBackgroundView()
            VStack {
                Spacer()
                Spacer()
                VStack(spacing: 8) {
                    Text("MyDating")
                        .font(.system(size: 60))
                        .fontWeight(.black)
                        .foregroundColor(titleColor).opacity(0.8)
                    Rectangle()
                        .frame(width: 70, height: 4)
                    Text("당신의 소중한 인연을 만들어보세요")
                        .foregroundColor(subColor)
                        .fontWeight(.semibold)
                        .padding(.top, 8)
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
        }// ZStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
