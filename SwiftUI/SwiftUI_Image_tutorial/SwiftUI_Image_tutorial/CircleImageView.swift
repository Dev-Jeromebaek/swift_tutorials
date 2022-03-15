//
//  CircleImageView.swift
//  Image_tutorial
//
//  Created by 백승엽 on 2022/03/14.
//

import SwiftUI

struct CircleImageView: View {
    var body: some View {
//        Image(systemName: "bolt.circle")
//            .font(.system(size: 200))
//            .foregroundColor(.yellow)
//            .shadow(color: .gray, radius: 2, x: 2, y: 10)
        Image("myImage")
            .resizable()
            .scaledToFill()
            .frame(width: 250, height: 250)
            .clipShape(Circle())
            .shadow(color: .gray, radius: 10, x: 0, y: 10)
            .overlay(
                Circle()
                    .foregroundColor(.black)
                    .opacity(0.7)
            )
            .overlay(
                Circle().stroke(Color.red, lineWidth: 10)
                    .padding()
            )
            .overlay(
                Circle().stroke(Color.yellow, lineWidth: 10)
                    .padding(30)
            )
            .overlay(
                Circle().stroke(Color.blue, lineWidth: 10)
            )
            .overlay(
                Text("호호")
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .fontWeight(.bold)
            )
//            .aspectRatio(contentMode: .fill)

//            .clipped()
//            .edgesIgnoringSafeArea(.all)
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView()
    }
}
