//
//  MyGeometryReader.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by 백승엽 on 2022/03/16.
//

import SwiftUI

struct MyGeometryReader: View {
    var body: some View {
        GeometryReader { geoReader in
            HStack(spacing: 0) {
                Text("1")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .frame(width: geoReader.size.width / 3)
                    .background(Color.red)
                    .foregroundColor(Color.white)
                Text("2")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .frame(width: geoReader.size.width / 4)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                Text("3")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .frame(width: geoReader.size.width / 3)
                    .background(Color.green)
                    .foregroundColor(Color.white)
//                Text("4")
//                    .font(.largeTitle)
//                    .fontWeight(.black)
//                    .frame(width: 100)
//                    .background(Color.purple)
//                    .foregroundColor(Color.white)
            } // HStack
            .background(Color.yellow)
            .frame(
                width : geoReader.size.width,
                height : geoReader.size.height,
                alignment : .center
            )
        } // GeometryReader
        .background(Color.black)
    }
}

struct MyGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        MyGeometryReader()
    }
}
