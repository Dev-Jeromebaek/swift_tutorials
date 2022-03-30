//
//  Indicator.swift
//  MVVM_pattern
//
//  Created by 백승엽 on 2022/03/30.
//

import SwiftUI

struct Indicator: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
