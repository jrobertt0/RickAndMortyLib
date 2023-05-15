//
//  LocationRepositoryMock.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 15/05/23.
//

import Foundation
import Combine

class LocationRepositoryMock: LocationRepositoryProtocol {
    func fetchLocations(page: Int, filter: API.FilterLocation?) throws -> AnyPublisher<[Location], RequestError> {
        return Just([Location.init(example: true), Location.init(example: true)])
            .setFailureType(to: RequestError.self)
            .eraseToAnyPublisher()
    }
    
    func fetchLocation(id: String) throws -> AnyPublisher<Location, RequestError> {
        return Just(Location.init(example: true))
            .setFailureType(to: RequestError.self)
            .eraseToAnyPublisher()
    }
}
