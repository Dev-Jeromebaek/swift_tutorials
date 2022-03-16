//
//  MyNavigationView.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by 백승엽 on 2022/03/15.
//

import SwiftUI

struct MyNavigationView: View {
    var body: some View {
        NavigationView {
//            Text("MyNavigationView")
//                .navigationBarTitle("안녕하세요!")
            
            MyList()
                .navigationBarTitle("안녕하세요!")
                .navigationBarItems(
                    leading:
                        Button(action: {
                            print("호호")
                            }) {
                                Text("하하")
                            }
                    , trailing:
                        NavigationLink(destination:
                                        Text("넘어온 화면입니다.")) {
                                            Image(systemName: "bookmark.fill")
                                                .font(.system(size: 25))
                                                .foregroundColor(Color.black )
                                        }
                )
        }
    }
}

struct MyNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView()
    }
}
