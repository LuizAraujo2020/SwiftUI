//
//  Mapview.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 13/01/23.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

struct Mapview: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("Your location: \(location.latitude), \(location.longitude)")
                    .foregroundColor(.accentColor)
            }
            
            LocationButton(.currentLocation) {
                locationManager.requestLocation()
            }
//            .tint(.accentColor)
//            .foregroundColor(.accentColor)
            .frame(height: 44)
            .padding()
        }
    }
}

struct Mapview_Previews: PreviewProvider {
    static var previews: some View {
        Mapview()
    }
}
