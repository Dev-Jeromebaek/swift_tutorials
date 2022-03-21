//
//  AppState.swift
//  SwiftUI_Redux
//
//  Created by 백승엽 on 2022/03/21.
//

import SwiftUI

/// 앱의 상태, 즉 데이터 -
struct AppState {
    var currentDice: String = ""{
        didSet {
            print("currentDice: \(currentDice)", #fileID, #function)
        }
    }
    
}
