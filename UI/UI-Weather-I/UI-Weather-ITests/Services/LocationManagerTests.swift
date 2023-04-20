//
//  LocationManagerTests.swift
//  UI-Weather-ITests
//
//  Created by Luiz Araujo on 14/01/23.
//

import XCTest
import CoreLocation
import CoreLocationUI
@testable import UI_Weather_I

final class LocationManagerTests: XCTestCase {
    var sut: (any LocationManagerProtocol)!

    override func setUpWithError() throws {
        sut = MockLocationManager()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testInit() {
        XCTAssertNotNil(sut.manager.delegate, "After the initialization, the `manager.delegate`shouldn't be nil.")
        XCTAssertNil(sut.location, "Right after the initialization, the `location` should be nil.")
    }
    
    func testRequestLocation() {
        /// When
        sut.requestLocation()
        
        /// Then
        XCTAssertNotNil(sut.location, "After the request, the `location` shouldn't be nil.")
        XCTAssertEqual(sut.location!.latitude, CLLocationDegrees(37.3317), "After the request, the `location.latitude` should be 37.3317.")
        XCTAssertEqual(sut.location!.longitude, CLLocationDegrees(-122.0325086), "After the request, the `location.longitude` should be -122.0325086.")
    }
}
