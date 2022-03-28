//
//  ContentView.swift
//  SplashScreen_tutorial
//
//  Created by 백승엽 on 2022/03/28.
//

import SwiftUI

struct ContentView: View {
    
    @State var isContentReady: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Text("Hello, world!")
                .padding()
            
            if !isContentReady {
                LottieView("Loading_anim")
                    .background(
                        Color.white
                        .edgesIgnoringSafeArea(.all)
                    )
                    .transition(.opacity)
//                mySplashScreenView.transition(.opacity)
            }
        } // ZStack
        .onAppear() {
            print("ContentView - onAppear() called")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
                print("ContentView - 1.25초 뒤")
                withAnimation{isContentReady.toggle()}
            }
        }
    }
}

//MARK: - 스플래시 스크린
extension ContentView {
    var mySplashScreenView: some View {
        Color.yellow
            .edgesIgnoringSafeArea(.all)
            .overlay(alignment: .center) {
                Text("스플래시 입니다!")
                    .font(.largeTitle)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
