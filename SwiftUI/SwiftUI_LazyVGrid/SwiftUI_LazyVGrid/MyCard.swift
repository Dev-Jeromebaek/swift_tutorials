//
//  MyCard.swift
//  SwiftUI_LazyVGrid
//
//  Created by 백승엽 on 2022/03/21.
//

import SwiftUI

struct MyCard: View {
    var icon : String
    var title : String
    var start : String
    var end : String
    var bgColor : Color
    
    var body: some View{
        HStack(spacing: 20){
            Image(systemName: icon)
                .font(.system(size: 40))
                .foregroundColor(Color.white)
            VStack(alignment: .leading, spacing: 0){
                Divider().opacity(0)
                
                Text(title)
                    .fontWeight(.bold)
                    .font(.system(size: 23))
                    .foregroundColor(Color.white)
                Spacer().frame(height: 5)
                Text("\(start) - \(end)")
                    .foregroundColor(Color.white)
            }
        }
        .padding(20)
        .background(bgColor)
        .cornerRadius(20)
    }
}

struct MyCard_Previews: PreviewProvider {
    static var previews: some View {
        MyCard(icon: "book.fill", title: "책읽기", start: "1 PM", end: "3 PM", bgColor: Color.green)
    }
}
