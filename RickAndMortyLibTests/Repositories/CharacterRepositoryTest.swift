//
//  CharacterRepositoryTest.swift
//  RickAndMortyLibTests
//
//  Created by Jose Roberto de Leon Garcia on 15/05/23.
//

import XCTest
import Combine
@testable import RickAndMortyLib

final class CharacterRepositoryTest: XCTestCase {
    
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancellables = []
    }
    
    func testFetchCharacter() {
        let mock = CharacterRepositoryMock()
        
        var error: RequestError?
        var error2: RequestError?
        var character: Character?
        let expectation = self.expectation(description: "CharacterRepository Testing: FetchCharacter")

        // Setting up our Combine pipeline:
        do {
            try mock.fetchCharacter(id: "1")
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let encounteredError):
                        error = encounteredError
                    }

                    expectation.fulfill()
                }, receiveValue: { value in
                    character = value
                })
                .store(in: &cancellables)
        } catch {
            error2 = RequestError.excecutionError
        }

        waitForExpectations(timeout: 10)

        XCTAssertNil(error)
        XCTAssertNil(error2)
        XCTAssertEqual(character, Character(example: true))
    }
    
    func testFetchCharacters() {
        let mock = CharacterRepositoryMock()
        
        var error: RequestError?
        var error2: RequestError?
        var characters = [Character]()
        let expectation = self.expectation(description: "CharacterRepository Testing: FetchCharacter")

        // Setting up our Combine pipeline:
        do {
            try mock.fetchCharacters(page: 1, filter: nil)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let encounteredError):
                        error = encounteredError
                    }

                    expectation.fulfill()
                }, receiveValue: { value in
                    characters = value
                })
                .store(in: &cancellables)
        } catch {
            error2 = RequestError.excecutionError
        }

        waitForExpectations(timeout: 10)

        XCTAssertNil(error)
        XCTAssertNil(error2)
        XCTAssertEqual(characters, [Character(example: true), Character(example: true)])
    }

    
}



