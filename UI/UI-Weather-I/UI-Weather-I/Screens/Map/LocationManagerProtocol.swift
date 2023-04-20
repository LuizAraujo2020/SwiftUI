//
//  LocationManagerProtocol.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 14/01/23.
//

import CoreLocation

protocol LocationManagerProtocol: ObservableObject, CLLocationManagerDelegate {
    
    var manager: CLLocationManager { get set }
    var location: CLLocationCoordinate2D? { get set }
     
    func requestLocation()
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Swift.Error)
}
