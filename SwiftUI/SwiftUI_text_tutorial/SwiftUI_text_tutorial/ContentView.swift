//
//  ContentView.swift
//  SwiftUI_text_tutorial
//
//  Created by 백승엽 on 2022/03/11.
//

import SwiftUI

struct ContentView: View {
    
    static let dateFormat: DateFormatter = {
       let formatter = DateFormatter()
//        formatter.dateFormat = "YYYY-MM-dd"
        formatter.dateStyle = .long
        return formatter
    }()
    
    var trueOrFalse : Bool = false
    
    var number : Int = 123
    
    var today = Date()
    
    var body: some View {
        VStack {
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s")
                .tracking(2) // 자간
                .font(.system(.body, design: .rounded))
                .fontWeight(.medium)
                .multilineTextAlignment(.center) // 문자열 정렬
                .lineLimit(nil) // 최대 줄 수 설정
                .lineSpacing(10) // 글자 행간
                .truncationMode(.middle) // 넘어가는 글짜 처리 (마지막줄에 대한 처리)
                .shadow(color: Color.red, radius: 1.5, x: 3, y: 3) // 글씨 그림자
            
                .padding(.all, 20)
                .background(Color.yellow)
                .cornerRadius(10)
            
                .padding()
                .background(Color.green)
                .cornerRadius(20)
            
                .padding()
            Text("안녕하세요!!")
                .background(Color.gray)
                .foregroundColor(Color.white)
                .padding()
            
            Text("오늘의 날짜입니다 : \(today, formatter: ContentView.dateFormat)")
                .padding()
            
            Text("참 혹은 거짓 : \(String(trueOrFalse))")
                .padding()
            
            Text("숫자입니다 : \(number)")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
