//
//  ContentView.swift
//  SwiftUI_Toast_Popup
//
//  Created by 백승엽 on 2022/03/17.
//
/// https://github.com/exyte/PopupView

import SwiftUI
import ExytePopupView

struct ContentView: View {
    
    @State var shouldShowBottomSolidMessage: Bool = false
    
    @State var shouldShowBottomToastMessage: Bool = false
    
    @State var shouldShowTopSolidMessage: Bool = false
    
    @State var shouldShowTopToastMessage: Bool = false
    
    @State var shouldShowPopup: Bool = false
    
    func createBottomSolidMessage() -> some View {
        HStack(spacing: 10) {
            Image(systemName: "book.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
            VStack(alignment: .leading, spacing: 0) {
                Text("안내 메시지")
                    .fontWeight(.black)
                    .foregroundColor(.white)
                Text("아래서 올라오는 토스트 메시지 입니다.")
                    .lineLimit(2) // 최대 허용 줄 수
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                Divider().opacity(0)
            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width)
        .padding(.bottom,
                 getSafeAreaBottom() == 0 ? 0 : 15)
        .background(Color.purple)
    }
    
    func createBottomToastMessage() -> some View {
        HStack(alignment: .top, spacing: 10) {
            Image("cat")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .offset(y: 10)
                .frame(width: 60, height: 60)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 0) {
                Text("고양이 고양이")
                    .fontWeight(.black)
                    .foregroundColor(.white)
                Text("아래서 올라오는 토스트 메시지 입니다. 설정은 floater로 20만큼 띄웠어요.")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                Divider().opacity(0)
            }
        }
        .padding(15)
        .frame(width: 300)
        .background(Color.green)
        .cornerRadius(20)
    }
    
    func createTopSolidMessage() -> some View {
        HStack(spacing: 10) {
            Image("turtlerock-short")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .frame(width: 60, height: 60)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 0) {
                Text("김아무개님의 메시지가 도착했습니다.")
                    .fontWeight(.black)
                    .foregroundColor(.white)
                Text("위에서 내려오는 토스트 메시지 입니다.")
                    .lineLimit(2) // 최대 허용 줄 수
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                Divider().opacity(0)
            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width)
        .padding(.top, getSafeAreaTop() == 0 ? 0 : 35)
        .background(Color.blue)
    }
    
    func createTopToastMessage() -> some View {
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: "paperplane.fill")
                .font(.system(size: 25))
                .padding(.leading, 5)
                .foregroundColor(.white)
            VStack(alignment: .leading, spacing: 2) {
                Text("김아무개님의 메시지")
                    .fontWeight(.black)
                    .foregroundColor(.white)
                Text("위에서 내려오는 토스트 메시지")
                    .font(.system(size: 14))
                    .lineLimit(1)
                    .foregroundColor(.white)
            }
            .padding(.trailing, 15)
        }
        .padding(10)
        .background(Color.orange)
        .cornerRadius(30)
        .padding(.top, getSafeAreaTop() == 0 ? 0 : 30)
        
    }
    
    func createPopup() -> some View {
        VStack(spacing: 10) {
            Image("turtlerock-short")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fit)
                .frame(width: 100, height: 100)
            Text("팝업 메시지 연습")
                .foregroundColor(.white)
                .fontWeight(.bold)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                .font(.system(size: 12))
                .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
                .multilineTextAlignment(.center)
            Spacer()
                .frame(height: 10)
            
            Button {
                self.shouldShowPopup = false
            } label: {
                Text("Close")
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .fontWeight(.bold)
            }
            .frame(width: 100, height: 40)
            .background(Color.white)
            .cornerRadius(20.0)
        } // VStack
        .padding()
        .frame(width: 300, height: 400)
        .background(Color(hexcode: "8227b0"))
        .cornerRadius(10.0)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 10.0)
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                Spacer()
                // MARK: Bottom Solid Message
                Button {
                    self.shouldShowBottomSolidMessage = true
                } label: {
                    Text("Bottom Solid Message")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(10)
                }
                
                Button {
                    self.shouldShowBottomToastMessage = true
                } label: {
                    Text("Bottom Toast Message")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                
                Button {
                    self.shouldShowTopSolidMessage = true
                } label: {
                    Text("Top Solid Message")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Button {
                    self.shouldShowTopToastMessage = true
                } label: {
                    Text("Top Toast Message")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                
                Button {
                    self.shouldShowPopup = true
                } label: {
                    Text("Popup")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(hexcode: "8227b0"))
                        .cornerRadius(10)
                }
                
                Spacer()
                
                
                
            } // VStack
        } // ZStack
        .edgesIgnoringSafeArea(.all)
        .popup(isPresented: $shouldShowBottomSolidMessage, type: .toast, position: .bottom, animation: .easeInOut, autohideIn: 2, closeOnTap: true, closeOnTapOutside: true) {
            self.createBottomSolidMessage()
        }
        .popup(isPresented: $shouldShowBottomToastMessage, type: .floater(verticalPadding: 20), position: .bottom, animation: .spring(), autohideIn: 2, closeOnTap: true, closeOnTapOutside: true) {
            self.createBottomToastMessage()
        }
        .popup(isPresented: $shouldShowTopSolidMessage, type: .toast, position: .top, animation: .easeInOut, autohideIn: 2, closeOnTap: true, closeOnTapOutside: true) {
            self.createTopSolidMessage()
        }
        .popup(isPresented: $shouldShowTopToastMessage, type: .floater(verticalPadding: 20), position: .top, animation: .spring(), autohideIn: 2, closeOnTap: true, closeOnTapOutside: true) {
            self.createTopToastMessage()
        }
        .popup(isPresented: $shouldShowPopup, type: .default, position: .bottom, animation: .spring(), autohideIn: 2, closeOnTap: true, closeOnTapOutside: true) {
            self.createPopup()
        }
    }
}

extension Color {
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
