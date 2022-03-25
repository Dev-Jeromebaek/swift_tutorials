//
//  ContentView.swift
//  ScrollViewReader_tutorial
//
//  Created by 백승엽 on 2022/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex: Int = 0
    
    @Namespace var topID
    @Namespace var bottomID
    
    var selectedBg: (Int, Int) -> Color = { currentItemIndex, selectedItemIndex in
        if currentItemIndex == selectedItemIndex {
            return Color.green
        } else{
            return Color.yellow
        }
        
    }
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView(.vertical, showsIndicators: false) {
                    Button("Scroll to Bottom") {
                        withAnimation {
                            proxy.scrollTo(bottomID)
                        }
                    }
                    .id(topID)
                    ForEach(0..<100) { index in
                        Text("Hello, world! \(index)")
                            .padding()
                            .background(selectedBg(index, selectedIndex))
                            .id(index)
                    }
                    .onChange(of: selectedIndex) { newValue in
                        print("changedIndex: ", newValue)
                        withAnimation {
                            proxy.scrollTo(newValue, anchor: .center)
                        }
                    }
                    Button("Scroll to Top") {
                        withAnimation {
                            proxy.scrollTo(topID)
                        }
                    }
                    .id(bottomID)
                }
            }
            
            HStack(spacing: 10) {
                Button {
                    selectedIndex = 0
                } label: {
                    Text("인덱스: 0")
                        .padding()
                }
                Button {
                    selectedIndex = 10
                } label: {
                    Text("인덱스: 10")
                        .padding()
                }
                Button {
                    selectedIndex = 90
                } label: {
                    Text("인덱스: 90")
                        .padding()
                }
                
            } // HStack
        } // VStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
