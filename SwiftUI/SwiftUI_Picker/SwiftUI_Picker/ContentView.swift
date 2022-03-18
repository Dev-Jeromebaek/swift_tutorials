//
//  ContentView.swift
//  SwiftUI_Picker
//
//  Created by 백승엽 on 2022/03/18.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectionValue = 0
    
    let myColorArray = ["red", "green", "blue"]
    
    func changeColor(_ index: Int) -> Color {
        switch index {
        case 0:
            return Color.red
        case 1:
            return Color.green
        case 2:
            return Color.blue
        default:
            return Color.red
        }
    }
    
    var body: some View {
        
        VStack(alignment: .center) {
            Circle()
                .foregroundColor(self.changeColor(selectionValue))
                .frame(width: 50, height: 50)
            
            Text("선택한 값 : \(selectionValue)")
            Text("선택된 색상 : \(myColorArray[selectionValue])")
            
            Picker("Picker", selection: $selectionValue) {
                    Text("red").tag(0)
                    Text("green").tag(1)
                    Text("blue").tag(2)
            }
            .frame(width: 50, height: 100)
            .clipped()
            .padding()
            .border(self.changeColor(selectionValue), width: 10)
            
            Picker("Picker", selection: $selectionValue) {
                    Text("red").tag(0)
                    Text("green").tag(1)
                    Text("blue").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
        } // VStack
        .padding(.horizontal, 50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
