//
//  ContentView.swift
//  SwiftUI_Image_tutorial
//
//  Created by 백승엽 on 2022/03/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                Image("myImage")
                    .frame(height: 10)
                    .offset(y: -1550)
                
                CircleImageView()
                
                HStack {
                    NavigationLink(destination: MyWebView(url: "https://github.com/Dev-Jeromebaek")
                                    .edgesIgnoringSafeArea(.all)
                    ) {
                        Text("Github")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(20)
                    }
                    NavigationLink(destination: MyWebView(url: "https://www.kakaocorp.com/page/service/service/KakaoTalk?lang=ko")
                                    .edgesIgnoringSafeArea(.all)
                    ) {
                        Text("Kakaotalk")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(20)
                    }
                } // HStack
                .padding(50)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
