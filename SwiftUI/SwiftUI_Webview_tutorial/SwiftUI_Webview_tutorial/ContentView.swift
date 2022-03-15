//
//  ContentView.swift
//  SwiftUI_Webview_tutorial
//
//  Created by 백승엽 on 2022/03/11.
//
// MARK: - Webview : Project -> Info -> Target
//   -> App Transport Security Settings 추가
//   -> App Transport Security Settings 하위에 Allow Arbitrary Loads 추가 후 설정값을 YES로 변경
// - WebKit

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            HStack {
                NavigationLink(
                    destination: MyWebView(urlToLoad: "https://www.naver.com")
                    .edgesIgnoringSafeArea(.all)) {
                        Text("Naver")
                            .fontWeight(.semibold)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(Color.white)
                            .cornerRadius(5)
                }
                NavigationLink(
                    destination: MyWebView(urlToLoad: "https://www.daum.net")
                    .edgesIgnoringSafeArea(.all)) {
                        Text("Daum")
                            .fontWeight(.semibold)
                            .padding()
                            .background(Color.yellow)
                            .foregroundColor(Color.blue)
                            .cornerRadius(5)
                }
                NavigationLink(
                    destination: MyWebView(urlToLoad: "https://www.google.com")
                    .edgesIgnoringSafeArea(.all)) {
                        Text("Google")
                            .fontWeight(.semibold)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(Color.red)
                            .cornerRadius(5)
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
