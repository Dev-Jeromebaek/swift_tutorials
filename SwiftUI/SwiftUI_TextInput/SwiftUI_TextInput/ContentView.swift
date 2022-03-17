//
//  ContentView.swift
//  SwiftUI_TextInput
//
//  Created by 백승엽 on 2022/03/17.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                TextField("사용자 이름 입력", text: $username)
                    .autocapitalization(.none) // 글자 대문자 설정 off
                    .disableAutocorrection(true) // 맞춤법검사 설정 off
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // 내용 비우기 버튼
                Button {
                    self.username = ""
                } label: {
                    if self.username.count > 0 {
                        Image(systemName: "multiply.circle.fill")
                            .font(.system(size: 25))
                            .foregroundColor(.secondary)
                    }
                }
            } // HStack
            
            HStack {
                SecureField("비밀번호 입력", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button {
                    self.password = ""
                } label: {
                    if self.password.count > 0 {
                        Image(systemName: "multiply.circle.fill")
                            .font(.system(size: 25))
                            .foregroundColor(.secondary)
                    }
                }
            }
            
            Text("비밀번호 확인")
            Text(password)
        } // VStack
        .padding(.horizontal, 50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
