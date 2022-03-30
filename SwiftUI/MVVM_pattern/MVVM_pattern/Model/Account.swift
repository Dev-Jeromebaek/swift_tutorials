//
//  Account.swift
//  MVVM_pattern
//
//  Created by 백승엽 on 2022/03/30.
//

// Data Models...

import Foundation

struct Account: Identifiable, Decodable {
    var id: Int
    var login: String
    var avatar_url: String
    
}
