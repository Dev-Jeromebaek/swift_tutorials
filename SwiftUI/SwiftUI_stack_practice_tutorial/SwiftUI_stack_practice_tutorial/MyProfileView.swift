//
//  MyProfileView.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by λ°±μΉμ½ on 2022/03/15.
//

import SwiftUI

struct MyProfileView: View {
    
    @Binding var isNavigationBarHidden: Bool
    
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)) {
        _isNavigationBarHidden = isNavigationBarHidden
    }
    
    var body: some View {
        ScrollView {
            VStack {
                MyCircleImageView(imageString: "profile_image")
                    .padding(.vertical, 20)
                Text("Herbert Harrison")
                    .font(.system(size: 30))
                    .fontWeight(.black)
                Spacer().frame(height: 20)
                Text("Pleases Check Subscribe and Like")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                
                HStack(spacing: 30) {
                    Text("π Subscribe")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(20)
                    Text("π Like")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(20)
                } // HStack
            } // VStack
        } // ScrollView
        .navigationBarTitle("My Profile")
        .navigationBarItems(
            trailing: NavigationLink(
                destination:
                    Text("μ€μ ")
                        .font(.largeTitle)
                        .fontWeight(.black)) {
                            Image(systemName: "gear")
//                                .font(.largeTitle)
                                .foregroundColor(.black)
                        }
        
        )
        .onAppear() {
            self.isNavigationBarHidden = false
        }
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}
