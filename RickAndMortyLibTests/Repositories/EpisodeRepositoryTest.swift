//
//  EpisodeRepositoryTest.swift
//  RickAndMortyLibTests
//
//  Created by Jose Roberto de Leon Garcia on 15/05/23.
//

import XCTest
import Combine
@testable import RickAndMortyLib

final class EpisodeRepositoryTest: XCTestCase {
    
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancellables = []
    }
    
    func testFetchEpisode() {
        let mock = EpisodeRepositoryMock()
        
        var error: RequestError?
        var error2: RequestError?
        var episode: Episode?
        let expectation = self.expectation(description: "EpisodeRepository Testing: FetchEpisode")

        // Setting up our Combine pipeline:
        do {
            try mock.fetchEpisode(id: "1")
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let encounteredError):
                        error = encounteredError
                    }

                    expectation.fulfill()
                }, receiveValue: { value in
                    episode = value
                })
                .store(in: &cancellables)
        } catch {
            error2 = RequestError.excecutionError
        }

        waitForExpectations(timeout: 10)

        XCTAssertNil(error)
        XCTAssertNil(error2)
        XCTAssertEqual(episode, Episode(example: true))
    }
    
    func testFetchEpisodes() {
        let mock = EpisodeRepositoryMock()
        
        var error: RequestError?
        var error2: RequestError?
        var episodes = [Episode]()
        let expectation = self.expectation(description: "EpisodeRepository Testing: FetchEpisodes")

        // Setting up our Combine pipeline:
        do {
            try mock.fetchEpisodes(page: 1, filter: nil)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let encounteredError):
                        error = encounteredError
                    }

                    expectation.fulfill()
                }, receiveValue: { value in
                    episodes = value
                })
                .store(in: &cancellables)
        } catch {
            error2 = RequestError.excecutionError
        }

        waitForExpectations(timeout: 10)

        XCTAssertNil(error)
        XCTAssertNil(error2)
        XCTAssertEqual(episodes, [Episode(example: true), Episode(example: true)])
    }

    
}



