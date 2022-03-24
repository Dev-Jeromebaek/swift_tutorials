//
//  State_Binding_EnvironmentObject_tutorialApp.swift
//  State_Binding_EnvironmentObject_tutorial
//
//  Created by 백승엽 on 2022/03/24.
//

import SwiftUI

@main
struct State_Binding_EnvironmentObject_tutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(MyViewModel())
        }
    }
}
