//
//  MyBasicCard.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by 백승엽 on 2022/03/15.
//

import SwiftUI

struct MyBasicCard: View {
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "flag.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
            VStack(alignment: .leading, spacing: 0) {
//                Rectangle().frame(height: 0)
                Divider().opacity(0)
                Text("정대리 유툽 프로젝트")
                    .font(.system(size: 23))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
                    .frame(height: 5)
                Text("10 AM - 11 AM")
                    .foregroundColor(.white)
//                Spacer().frame(height: 20)
            }
        }
        .padding(20)
        .background(Color.purple)
        .cornerRadius(20)
    }
}

struct MyBasicCard_Previews: PreviewProvider {
    static var previews: some View {
        MyBasicCard()
    }
}
