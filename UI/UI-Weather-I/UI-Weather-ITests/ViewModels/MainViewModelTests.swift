//
//  MainViewModelTests.swift
//  UI-Weather-ITests
//
//  Created by Luiz Araujo on 13/01/23.
//

import XCTest
@testable import UI_Weather_I

@MainActor
final class MainViewModelTests: XCTestCase {
    var sut: MainViewModel!

    @MainActor
    override func setUpWithError() throws {
        sut = MainViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    @MainActor
    func testInit() {
        // THEN
        XCTAssertNotNil(sut)
    }
    
    @MainActor
    func testFetch() {
        // WHEN
        sut.fetch()
        
        let exp = expectation(description: "Test after 5 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 5.0)
        
        // THEN
        if result == XCTWaiter.Result.timedOut {
            XCTAssertNotNil(sut.weather)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func test_getDayOfWeek() {
        XCTAssertEqual(sut.getDayOfWeek(), "Wednesday", "The day of the week should be Wednesday, and it cames from the JSON file")
    }
    
    func test_getMonth() {
        XCTAssertEqual(sut.getMonth(), "January", "The day of the week should be January, and it cames from the JSON file")
    }
    
    func test_getYear() {
        XCTAssertEqual(sut.getYear(), "2023")
    }
    
    func test_getDateFromDatetimeEpoch() {
        // GIVEN
        let date: Date
        
        // WHEN
        date = Date(timeIntervalSince1970: TimeInterval(0))
        
        // THEN
        XCTAssertEqual(sut.getDateFromDatetimeEpoch(0.0), date)
    }
}
