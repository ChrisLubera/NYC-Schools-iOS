//
//  MapView.swift
//  NYCSchools
//
//  Created by Chris Lubera on 3/15/23.
//

import Foundation
import SwiftUI
import MapKit


struct MapView: View {
  
  var name: String
  var coordinate: CLLocationCoordinate2D
  @State private var region = MKCoordinateRegion()
  
  // Displays the map of the location of the school
  var body: some View {
    Map(coordinateRegion: $region,
        annotationItems: [MapLocation(name: name, coordinate: coordinate)], annotationContent: { locations in
      MapMarker(coordinate: locations.coordinate, tint: .red)
    })
      .onAppear {
        setRegion(coordinate)
      }
  }
  
  private func setRegion(_ coordinate: CLLocationCoordinate2D) {
    region = MKCoordinateRegion(
      center: coordinate,
      span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    )
  }
}

struct MapLocation: Identifiable {
  let id = UUID()
  // Keeping name in here for potential future use
  let name: String
  let coordinate: CLLocationCoordinate2D
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView(name: "Test", coordinate: CLLocationCoordinate2D(latitude: 40.73653, longitude: -73.9927))
  }
}
