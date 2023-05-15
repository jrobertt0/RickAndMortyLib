//
//  LocationRepositoryTest.swift
//  RickAndMortyLibTests
//
//  Created by Jose Roberto de Leon Garcia on 15/05/23.
//

import XCTest
import Combine
@testable import RickAndMortyLib

final class LocationRepositoryTest: XCTestCase {
    
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancellables = []
    }
    
    func testFetchLocation() {
        let mock = LocationRepositoryMock()
        
        var error: RequestError?
        var error2: RequestError?
        var location: Location?
        let expectation = self.expectation(description: "LocationRepository Testing: FetchLocation")

        // Setting up our Combine pipeline:
        do {
            try mock.fetchLocation(id: "1")
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let encounteredError):
                        error = encounteredError
                    }

                    expectation.fulfill()
                }, receiveValue: { value in
                    location = value
                })
                .store(in: &cancellables)
        } catch {
            error2 = RequestError.excecutionError
        }

        waitForExpectations(timeout: 10)

        XCTAssertNil(error)
        XCTAssertNil(error2)
        XCTAssertEqual(location, Location(example: true))
    }
    
    func testFetchLocations() {
        let mock = LocationRepositoryMock()
        
        var error: RequestError?
        var error2: RequestError?
        var locations = [Location]()
        let expectation = self.expectation(description: "LocationRepository Testing: FetchLocations")

        // Setting up our Combine pipeline:
        do {
            try mock.fetchLocations(page: 1, filter: nil)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let encounteredError):
                        error = encounteredError
                    }

                    expectation.fulfill()
                }, receiveValue: { value in
                    locations = value
                })
                .store(in: &cancellables)
        } catch {
            error2 = RequestError.excecutionError
        }

        waitForExpectations(timeout: 10)

        XCTAssertNil(error)
        XCTAssertNil(error2)
        XCTAssertEqual(locations, [Location(example: true), Location(example: true)])
    }

    
}



