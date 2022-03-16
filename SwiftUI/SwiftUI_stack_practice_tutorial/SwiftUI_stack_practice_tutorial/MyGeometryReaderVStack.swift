//
//  MyGeometryReaderVStack.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by 백승엽 on 2022/03/16.
//

import SwiftUI

enum Index {
    case one, two, three
}

struct MyGeometryReaderVStack: View {
    
    @State var index: Index = .one
    
    // MARK: 지오메트리 프록시를 매개변수로 가지고 CGPoint를 반환하는 클로저
    let centerPosition: (GeometryProxy) -> CGPoint = { proxy in
        return CGPoint(x: proxy.frame(in: .local).midX,
                       y: proxy.frame(in: .local).midY)
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                Button(action: {
                    print("1번 클릭")
                    withAnimation {
                        self.index = .one
                    }
                }) {
                    Text("1")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width: 100, height: proxy.size.height / 3)
                        .padding(.horizontal, self.index == .one ? 100 : 0)
                        .background(Color.red)
                        .foregroundColor(Color.white)
                }
                Button(action: {
                    print("2번 클릭")
                    withAnimation {
                        self.index = .two
                    }
                }) {
                    Text("2")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width: 100, height: proxy.size.height / 3)
                        .padding(.horizontal, self.index == .two ? 100 : 0)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                }
                Button(action: {
                    print("3번 클릭")
                    withAnimation {
                        self.index = .three
                    }
                }) {
                    Text("3")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width: 100, height: proxy.size.height / 3)
                        .padding(.horizontal, self.index == .three ? 100 : 0)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                }
            } // VStack
            // MARK: Geometry Stack 위치잡기 방법 3가지
            // MARK: 1번째
            //            .frame(
            //                width: proxy.size.width,
            //                height: proxy.size.height,
            //                alignment: .center
            //            )
            // MARK: 2번째
            //            .position(x: proxy.frame(in: .local).midX, y: proxy.frame(in: .local).midY)
            // MARK: 3번째
            .position(centerPosition(proxy))
        }// GeometryReader
        .background(Color.yellow)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MyGeometryReaderVStack_Previews: PreviewProvider {
    static var previews: some View {
        MyGeometryReaderVStack()
    }
}
