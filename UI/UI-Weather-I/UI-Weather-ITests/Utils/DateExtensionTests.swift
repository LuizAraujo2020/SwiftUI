//
//  DateExtensionTests.swift
//  UI-Weather-ITests
//
//  Created by Luiz Araujo on 13/01/23.
//

import XCTest
@testable import UI_Weather_I

final class DateExtensionTests: XCTestCase {
    
    func test_getReturningDateComponents() {
        // GIVEN
        var dateTemp: Date = Date(timeIntervalSince1970: TimeInterval(0))
        let month: Int = dateTemp.get(.month)
        var day: Int = dateTemp.get(.day)
        
        // THEN
        XCTAssertNotNil(dateTemp)
        XCTAssertEqual(month, 12)
        XCTAssertEqual(day, 31)
        
        dateTemp = Date(timeIntervalSince1970: TimeInterval(86400))
        day = dateTemp.get(.day)
        XCTAssertEqual(day, 1)
    }
    
    func test_getReturningInt() {
        // GIVEN
        var dateTemp: Date = Date(timeIntervalSince1970: TimeInterval(0))
        let month: Int = dateTemp.get(.month)
        var day: Int = dateTemp.get(.day)
        
        // THEN
        XCTAssertNotNil(dateTemp)
        XCTAssertEqual(month, 12)
        XCTAssertEqual(day, 31)
        
        dateTemp = Date(timeIntervalSince1970: TimeInterval(86400))
        day = dateTemp.get(.day)
        XCTAssertEqual(day, 1)
    }
    
    func test_getDateFromDatetimeEpochReceivingDouble() {
        // GIVEN
        let date: Date = Date.getDateFromDatetimeEpoch(0.0)
        let date2: Date = Date(timeIntervalSince1970: 0)
        // THEN
        XCTAssertEqual(date, date2)
    }
}
