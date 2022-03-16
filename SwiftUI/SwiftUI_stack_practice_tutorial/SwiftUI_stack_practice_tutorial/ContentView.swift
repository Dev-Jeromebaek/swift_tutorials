//
//  ContentView.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by 백승엽 on 2022/03/15.
//

import SwiftUI

struct ContentView: View {
    
    @State var isNavigationBarHidden: Bool = false
    
    var body: some View {
        
        
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        NavigationLink(destination: MyList(isNavigationBarHidden: self.$isNavigationBarHidden)) {
                            Image(systemName: "line.horizontal.3")
                                .font(.largeTitle)
                                .foregroundColor(Color.black)
                        }
                        Spacer()
                        NavigationLink(destination: MyProfileView(isNavigationBarHidden: self.$isNavigationBarHidden)) {
                            Image(systemName: "person.crop.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(20)
                    
                    Text("정대리 할 일 목록")
                        .font(.system(size: 40))
                        .fontWeight(.black)

                        .padding(.horizontal, 20)

                    
                    ScrollView {
                        VStack {
                            MyProjectCard()
                            MyBasicCard()
                            MyCard(icon: "tray.fill", title: "책상 정리하기", start: "10 AM", end: "11 AM", bgColor: Color.blue)
                            MyCard(icon: "tv.fill", title: "영상 다시보기", start: "8 AM", end: "9 AM", bgColor: Color.red)
                            MyCard(icon: "cart.fill", title: "마트 장보기", start: "10 AM", end: "11 AM", bgColor: Color.orange)
                            MyCard(icon: "gamecontroller.fill", title: "게임하기", start: "2 PM", end: "3 PM", bgColor: Color.blue)
                        }
                        .padding()
                    }
                } // VStack
                
                Circle()
                    .foregroundColor(Color.yellow)
                    .frame(width: 60, height: 60)
                    .overlay(Image(systemName: "plus")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                    )
                    .padding()
                    .shadow(radius: 20)
                
            } // ZStack
            .navigationBarTitle("back")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear() {
                self.isNavigationBarHidden = true
            }
        } // NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
