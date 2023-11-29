//
//  ContentView.swift
//  In-Class Activity Pro IPhone Ch11 Using Location and Maps
//
//  Created by Student Account on 11/20/23.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let cascadiaCollege = CLLocationCoordinate2D(latitude: 47.76096766707533, longitude:-122.19158954788811)
    static let bothellHigh = CLLocationCoordinate2D(latitude: 47.76096297259954, longitude:-122.21924592963471)
    static let blythePark = CLLocationCoordinate2D(latitude: 47.75027775753351, longitude:-122.2088547318621)
}

struct ContentView: View {
    let locationManager = CLLocationManager()
    @State var message = "Map of Bothell"
    var body: some View {
        VStack{
            Map(){
                Marker("Bothell High School", coordinate: .bothellHigh)
                Annotation("Blythe Park", coordinate: .blythePark){
                    Image(systemName: "mappin")
                        .foregroundColor(.blue)
                }
                Annotation("Cascadia College", coordinate: .cascadiaCollege){
                    Image(systemName: "graduationcap.fill")
                        .foregroundColor(.black)
                }
            }
            .frame(width: 300, height: 500)
            TextEditor(text: $message)
                .frame(width: .infinity, height: 100)
        }
        .padding()
        .onAppear {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
}

#Preview {
    ContentView()
}
