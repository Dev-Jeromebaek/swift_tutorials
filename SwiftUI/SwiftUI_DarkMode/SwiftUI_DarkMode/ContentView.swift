//
//  ContentView.swift
//  SwiftUI_DarkMode
//
//  Created by 백승엽 on 2022/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @State fileprivate var shouldShowAlert: Bool = false
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        ZStack {
//            Color.yellow
            Theme.myBackgroundColor(forScheme: scheme)
            VStack {
                Spacer()
                Button {
                    print("버튼 클릭")
                    shouldShowAlert.toggle()
                } label: {
                    Text("로그인")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Theme.myButtonBackgroundColor(forScheme: scheme))
                        .cornerRadius(13)
                        .overlay(
                            RoundedRectangle(cornerRadius: 13)
                                .stroke(.white, lineWidth: 3)
                        )
                }
                .alert(isPresented: $shouldShowAlert) {
                    Alert(title: Text("안녕하세요"), message: Text("오늘도 화이팅!"), dismissButton: .default(Text("닫기")))
                }
                Spacer().frame(height: 100)
            } // VStack
        } // ZStack
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Theme {
    static func myBackgroundColor(forScheme scheme: ColorScheme) -> Color {
        let lightColor = Color.white
        let darkColor = Color.black
        
        switch scheme {
        case .light:
            return lightColor
        case .dark:
            return darkColor
        @unknown default:
            return lightColor
        }
    }
    
    static func myButtonBackgroundColor(forScheme scheme: ColorScheme) -> Color {
        let lightColor = Color.pink
        let darkColor = Color.purple
        
        switch scheme {
        case .light:
            return lightColor
        case .dark:
            return darkColor
        @unknown default:
            return lightColor
        }
    }
}

