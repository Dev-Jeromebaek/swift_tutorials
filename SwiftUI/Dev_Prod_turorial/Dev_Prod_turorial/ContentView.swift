//
//  ContentView.swift
//  Dev_Prod_turorial
//
//  Created by 백승엽 on 2022/03/28.
//

import SwiftUI

struct ContentView: View {
    
    @State var welcomeTitle: String = ""
    
    var body: some View {
        Text(welcomeTitle)
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
            .onAppear {
                #if DEBUG
                welcomeTitle = "디버그 모드입니다."
                #else
                welcomeTitle = "운영 모드입니다."
                #endif
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
