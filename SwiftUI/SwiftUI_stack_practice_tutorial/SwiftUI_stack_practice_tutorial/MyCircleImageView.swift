//
//  MyCircleImageView.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by 백승엽 on 2022/03/15.
//

import SwiftUI

struct MyCircleImageView: View {
    
    var imageString: String
    
    var body: some View {
        Image(imageString)
            .resizable()
            .scaledToFit()
            .frame(width: 250, height: 250)
//            .padding(.trailing, 10)
            .clipShape(Circle())
            .shadow(color: .gray, radius: 10, x: 0, y: 10)
            .overlay(
                Circle().strokeBorder(Color.yellow, lineWidth: 10)
            )
    }
}

struct MyCircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        MyCircleImageView(imageString: "profile_image")
    }
}
