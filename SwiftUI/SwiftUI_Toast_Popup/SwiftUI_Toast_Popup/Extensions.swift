//
//  Extensions.swift
//  SwiftUI_Toast_Popup
//
//  Created by 백승엽 on 2022/03/17.
//

import SwiftUI

extension Color {
    init(hexcode: String) {
        let scanner = Scanner(string: hexcode)
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let red = (rgbValue & 0xff0000) >> 16
        let green = (rgbValue & 0xff00) >> 8
        let blue = rgbValue & 0xff
        
        self.init(red: Double(red) / 0xff, green: Double(green) / 0xff, blue: Double(blue) / 0xff)
    }
}
