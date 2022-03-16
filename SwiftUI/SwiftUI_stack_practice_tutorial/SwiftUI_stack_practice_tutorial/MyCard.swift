//
//  MyCard.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by 백승엽 on 2022/03/15.
//

import SwiftUI

struct MyCard: View {
    
    var icon: String
    var title: String
    var start: String
    var end: String
    var bgColor: Color
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: icon)
                .font(.system(size: 40))
                .foregroundColor(.white)
            VStack(alignment: .leading, spacing: 0) {
//                Rectangle().frame(height: 0)
                Divider().opacity(0)
                Text(title)
                    .font(.system(size: 23))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
                    .frame(height: 5)
                Text("\(start) - \(end)")
                    .foregroundColor(.white)
//                Spacer().frame(height: 20)
            }
        }
        .padding(20)
        .background(bgColor)
        .cornerRadius(20)
    }
}

struct MyCard_Previews: PreviewProvider {
    static var previews: some View {
        MyCard(icon: "book.fill", title: "책 읽기", start: "1 PM", end: "3 PM", bgColor: Color.green)
    }
}
