//
//  ServiceAPITests.swift
//  UI-Weather-ITests
//
//  Created by Luiz Araujo on 13/01/23.
//

import XCTest
@testable import UI_Weather_I

final class ServiceAPITests: XCTestCase {
    var sut: APIService!
    
    override func setUpWithError() throws {
        sut = APIService()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    
    func testRequest_Successfully() async throws {
        // GIVEN
        var result: Weather?
        
        do {
            result = try await sut.loadData()
        } catch {
            XCTFail("Test shouldn't return any error.")
        }
        XCTAssertNotNil(result, "The request shouldn't return nil.")
        XCTAssertEqual(result?.queryCost, 1, "The request should return a queryCost = 1")
    }
    
    func testRequestWithError_WrongName() async {
        // GIVEN
        var result: Weather?
        
        do {
            result = try await sut.loadData(forResource: "wrongFileName")
        } catch {
            guard let loadError = error as? APIService.RequestError else {
                XCTFail("Thrown the wrong type of error.")
                return
            }
            
            XCTAssertEqual(loadError, APIService.RequestError.fileNotFound, "The file shouldn't exists.")
        }
        
        XCTAssertNil(result, "The request should return nil.")
    }
    
    func testRequestWithError_WrongExtension() async {
        
            // GIVEN
            var result: Weather?
            
            do {
                result = try await sut.loadData(withExtension: "wrongFileExtension")
            } catch {
                guard let loadError = error as? APIService.RequestError else {
                    XCTFail("Thrown the wrong type of error.")
                    return
                }
                
                XCTAssertEqual(loadError, APIService.RequestError.fileNotFound, "The file extension should be wrong.")
            }
            
            XCTAssertNil(result, "The request should return nil.")
    }
    
    func testRequestWithError_WrongType() async {
        
        // GIVEN
        var result: Data?
        
        do {
            result = try await sut.loadData()
        } catch {
            guard let loadError = error as? APIService.RequestError else {
                XCTFail("Thrown the wrong type of error.")
                return
            }
            
            XCTAssertEqual(loadError, APIService.RequestError.failedToDecode, "The error type should be Failed to decode.")
        }
        
        XCTAssertNil(result, "The request should return nil.")
    }
}
