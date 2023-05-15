//
//  CharacterRepositoryMock.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 15/05/23.
//

import Foundation
import Combine

class CharacterRepositoryMock: CharacterRepositoryProtocol {
    func fetchCharacters(page: Int, filter: API.FilterCharacter?) throws -> AnyPublisher<[Character], RequestError> {
        return Just([Character.init(example: true), Character.init(example: true)])
            .setFailureType(to: RequestError.self)
            .eraseToAnyPublisher()
    }
    
    func fetchCharacter(id: String) throws -> AnyPublisher<Character, RequestError> {
        return Just(Character.init(example: true))
            .setFailureType(to: RequestError.self)
            .eraseToAnyPublisher()
    }
}
