//
//  ProfileImageView.swift
//  SwiftUI_Alamofire
//
//  Created by 백승엽 on 2022/03/22.
//

import SwiftUI
import URLImage

struct ProfileImageView: View {
    
    let url: URL
    
    var body: some View {
        URLImage(url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: 50, height: 60)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.purple, lineWidth: 2))
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView(url: URL(string: "https://randomuser.me/api/portraits/men/11.jpg")!)
    }
}
