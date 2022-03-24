//
//  ContentView.swift
//  State_Binding_EnvironmentObject_tutorial
//
//  Created by 백승엽 on 2022/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: MyViewModel
    
    @State var count = 0
    
    @State var appTitle: String = ""
    
    //    var appTitle: String
    //
    //    init(appTitle: String = "SwiftUI 3.0") {
    //        self.appTitle = appTitle
    //    }
    
    var body: some View {
        TabView {
            VStack {
                Text("1번 텍스트 count: \(count)")
                    .padding()
                
                Button {
                    count = count + 1
//                    appTitle = "Apple \(appTitle)"
                    viewModel.appTitle = "SwiftUI 3.0 / count: \(count)"
                } label: {
                    Text("Count Up")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
            } // VStack
            .tabItem {
                Label("1번", systemImage: "pencil.circle")
            }
            
            
            SecondView(count: $count)
                .tabItem {
                    Label("2번", systemImage: "folder.fill")
                }
            
            ThirdView(count: $count)
                .tabItem {
                    Label("3번", systemImage: "paperplane.fill")
                }
        } // TabView
        .overlay(Text(appTitle)
            .offset(y: -(UIScreen.main.bounds.height * 0.4)))
        .onReceive(viewModel.$appTitle) { receivedAppTitle in
            print("ContentView receivedAppTitle:", receivedAppTitle)
            appTitle = receivedAppTitle
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
