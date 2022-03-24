//
//  ThirdView.swift
//  State_Binding_EnvironmentObject_tutorial
//
//  Created by 백승엽 on 2022/03/24.
//

import Foundation
import SwiftUI

struct ThirdView: View {
    
    @EnvironmentObject var viewModel: MyViewModel
    
    @Binding var count: Int
    
    @State var title: String = ""
    
    init(count: Binding<Int> = .constant(99)) {
        _count = count
    }
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 26))
                .fontWeight(.bold)
                .padding()
            Text("2번 텍스트 count: \(count)")
                .padding()
            
            Button {
                count = count + 1
                //                    appTitle = "Apple \(appTitle)"
            } label: {
                Text("Count Up")
                //                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(10)
            }
            
        } // VStack
        .onReceive(viewModel.$appTitle) { receivedAppTitle in
            print("ThirdView - receivedAppTitle", receivedAppTitle)
            title = receivedAppTitle
        }
    }
}
