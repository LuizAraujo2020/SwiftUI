//
//  MockLocationManager.swift
//  UI-Weather-ITests
//
//  Created by Luiz Araujo on 14/01/23.
//

import CoreLocation
@testable import UI_Weather_I

class MockLocationManager: NSObject, LocationManagerProtocol {
    
//    func requestLocation() { }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { }
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Swift.Error) { }
//
    
    
    
    var manager = CLLocationManager()

    /// Able to request the user’s location on demand.
    @Published var location: CLLocationCoordinate2D?

    override init() {
        super.init()
        manager.delegate = self
    }

    func requestLocation() {
        
        location = CLLocationCoordinate2D(
            latitude: 37.3317,
            longitude: -122.0325086
        )
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Swift.Error) {
        
    }
    
    
}
