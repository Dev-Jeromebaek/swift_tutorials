//
//  ContentView.swift
//  SwiftUI_Redux
//
//  Created by 백승엽 on 2022/03/21.
//

import SwiftUI

struct ContentView: View {
    
    // sotre 생성
    let store = AppStore(state: AppState.init(currentDice: "⚀"), reducer: appReducer(_:_:))
    
    var body: some View {
        // 서브뷰에 옵저버블 오브젝트를 연결
        DiceView().environmentObject(store)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
