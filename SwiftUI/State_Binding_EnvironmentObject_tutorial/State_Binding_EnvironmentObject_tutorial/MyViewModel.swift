//
//  MyViewModel.swift
//  State_Binding_EnvironmentObject_tutorial
//
//  Created by 백승엽 on 2022/03/24.
//

import Foundation
import Combine

class MyViewModel: ObservableObject {
    
    @Published var appTitle: String = "SiwftUI 3.0"
}
