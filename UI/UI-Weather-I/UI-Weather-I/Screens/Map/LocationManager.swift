//
//  LocationManager.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 13/01/23.
//

import CoreLocation
import CoreLocationUI

class LocationManager: NSObject, LocationManagerProtocol {
    var manager = CLLocationManager()

    /// Able to request the user’s location on demand.
    @Published var location: CLLocationCoordinate2D?

    override init() {
        super.init()
        manager.delegate = self
    }

    func requestLocation() {
        manager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Swift.Error) {
        
    }
}
