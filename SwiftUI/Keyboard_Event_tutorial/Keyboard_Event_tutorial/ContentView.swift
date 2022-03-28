//
//  ContentView.swift
//  Keyboard_Event_tutorial
//
//  Created by 백승엽 on 2022/03/28.
//

import SwiftUI

struct ContentView: View {
    @State var nameInput: String = ""
    @State var emailInput: String = ""
    @State var passwordInput: String = ""
    @State var passwordConfirmInput: String = ""
    
    @ObservedObject var keyboardMonitor: KeyboardMonitor = KeyboardMonitor()
    
    @State var keyboardStatus: KeyboardMonitor.Status = .hide
    
    var body: some View{
        ScrollView {
            VStack(alignment: .leading, spacing: 0  ) {
                Text("키보드 상태")
                    .font(.title2)
                /// Divicer 색상 없애기
                Divider()
                    .colorMultiply(.clear)
                    .padding(.vertical, 5)
//                Text(keyboardMonitor.updatedKeyboardStatusAction.description)
                Text(keyboardStatus.description)
                Text("키보드 높이: \(keyboardMonitor.keyboardHeight)")
            } // VStack
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(.yellow))
            .onReceive(self.keyboardMonitor.updatedKeyboardStatusAction) { updatedStatus in
                self.keyboardStatus = updatedStatus
            }
            
            
            VStack(alignment: .leading) {
                Text("이름")
                TextField("이름을 입력해주세요", text: $nameInput).keyboardType(.default).autocapitalization(.none)
            } // VStack
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(.yellow))
            
            VStack(alignment: .leading) {
                Text("이메일")
                TextField("이메일", text: $emailInput).keyboardType(.emailAddress).autocapitalization(.none)
            } // VStack
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(.yellow))

            VStack(alignment: .leading) {
                Text("비밀번호")
                SecureField("비밀번호", text: $passwordInput).keyboardType(.default)
                SecureField("비밀번호 확인", text: $passwordConfirmInput).keyboardType(.default)
            } // VStack
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).fill(.yellow))
            
            Rectangle().fill(Color.red).frame(maxHeight: 300)
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("주의사항")
                    Text("What is Lorem Ipsum?\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                        .font(.caption)
                } // VStack
            } // ScrollView
            .frame(height: keyboardStatus == .show ? 300 : 0)
            
            GeometryReader { geoProxy in
                Button {
                    print("회원가입 버튼 클릭")
                } label: {
                    Text("회원가입하기")
                        .foregroundColor(.black)
                        .font(.title2)
                        .frame(maxWidth: geoProxy.frame(in: .named("containerVStack")).width)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(.yellow))
            }
            .padding(.bottom, keyboardStatus == .show ? 80 : 0)
            
        }// VStack
        .background(Color.purple)
        .padding(.horizontal, 20)
        .coordinateSpace(name: "containerVStack")
        .navigationTitle("회원가입")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
