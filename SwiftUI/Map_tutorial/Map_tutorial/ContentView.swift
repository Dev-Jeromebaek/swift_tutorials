//
//  ContentView.swift
//  Map_tutorial
//
//  Created by 백승엽 on 2022/03/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State var myPosition = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: CLLocationDegrees(37.331705), longitude: CLLocationDegrees(-122.030237)), span: MKCoordinateSpan())
    
    var body: some View {
//        if #available(iOS 15, *) {
//            Map(coordinateRegion: $myPosition)
//                .edgesIgnoringSafeArea(.all)
//        } else {
//            Text("iOS 버전이 14이하")
//        }
        MyMapView()
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
