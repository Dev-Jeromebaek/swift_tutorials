//
//  CardView.swift
//  MVVM_pattern
//
//  Created by 백승엽 on 2022/03/30.
//

import SwiftUI
import SDWebImageSwiftUI

struct CardView: View {
    
    var accountDetails: Account
    
    var body: some View {
        HStack(spacing: 15) {
            AnimatedImage(url: URL(string: self.accountDetails.avatar_url))
                .resizable()
                .frame(width: 55, height: 55)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 10) {
                Text(self.accountDetails.login)
                Text("\(self.accountDetails.id)")
                    .font(.caption)
            }// VStack
            Spacer(minLength: 0)
        }// HStack
        .padding(.horizontal)
        .padding(.top)
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}
