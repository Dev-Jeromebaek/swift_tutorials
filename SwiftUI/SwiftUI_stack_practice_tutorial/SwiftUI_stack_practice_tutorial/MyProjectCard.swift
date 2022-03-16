//
//  MyProjectCard.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by 백승엽 on 2022/03/15.
//

import SwiftUI

struct MyProjectCard: View {
    
    @State var shouldShowAlert: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Rectangle().frame(height: 0)
            
            Text("정대리 유툽 프로젝트")
                .font(.system(size: 23))
                .fontWeight(.black)
                .padding(.bottom, 5)
            Text("10 AM - 11 AM")
                .foregroundColor(.secondary)
            Spacer().frame(height: 20)
            HStack {
                Image("1")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 5)
                            .foregroundColor(Color.blue)
                    )
                Image("2")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Image("3")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Spacer()
                Button(action: {
                    print("확인 버튼 클릭")
                    self.shouldShowAlert = true
                }) {
                    Text("확인")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 80)
                        .background(Color.blue)
                        .cornerRadius(20)
                }.alert(isPresented: $shouldShowAlert) {
                    Alert(title: Text("알림창"))
                }
            }
        }
        .padding(20)
        .background(Color.yellow)
        .cornerRadius(20)
    }
}

struct MyProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        MyProjectCard()
    }
}
