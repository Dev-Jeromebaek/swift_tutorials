//
//  ContentView.swift
//  Gesture_tutorial
//
//  Created by 백승엽 on 2022/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var singleTapped = false
    @State var doubleTapped = false
    @State var tripleTapped = false
    
    var singleTap: some Gesture {
        TapGesture()
            .onEnded { _ in
                print("한번 탭")
                singleTapped.toggle()
            }
    }
    
    var doubleTap: some Gesture {
        TapGesture(count: 2)
            .onEnded { _ in
                print("두번 탭")
                doubleTapped.toggle()
            }
    }
    
    var tripleTap: some Gesture {
        TapGesture(count: 3)
            .onEnded { _ in
                print("세번 탭")
                tripleTapped.toggle()
            }
    }
    
    var body: some View {
        VStack {
            Circle()
                .fill(singleTapped ? Color.blue : .gray)
                .frame(width: 100, height: 100, alignment: .center)
                .overlay(Text("Single Tab").circleTitle())
                .gesture(singleTap)
            Circle()
                .fill(doubleTapped ? Color.orange : .gray)
                .frame(width: 100, height: 100, alignment: .center)
                .overlay(Text("Double Tab").circleTitle())
                .gesture(doubleTap)
            Circle()
                .fill(tripleTapped ? Color.green : .gray)
                .frame(width: 100, height: 100, alignment: .center)
                .overlay(Text("Triple Tab").circleTitle())
                .gesture(tripleTap)
        }// VStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CircleTitle: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(size: 26))
            .foregroundColor(.white)
    }
}

extension View {
    func circleTitle() -> some View {
        modifier(CircleTitle())
    }
}
