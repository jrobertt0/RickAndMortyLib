//
//  LocationRepository.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import Foundation
import Combine

class LocationRepository {
    static let shared = LocationRepository()
    private init() {}
    
    private let network = Network.shared
    
    func fetchLocations(page: Int, filter: API.FilterLocation? = nil) throws -> AnyPublisher<[Location], RequestError> {
        let parsedFilter = filter == nil ? GraphQLNullable<API.FilterLocation>(API.FilterLocation()) : GraphQLNullable<API.FilterLocation>(filter!)
        
        return network.fetch(
            query: API.GetLocationsQuery(
                page: GraphQLNullable<Int>(integerLiteral: page),
                filter: parsedFilter
            )
        )
        .compactMap(\.locations?.results)
        .flatMap{
            Just(
                $0.map{ data in Location(from: data) }
            )
        }
        .eraseToAnyPublisher()
    }
    
    func fetchLocation(id: String) throws -> AnyPublisher<Location, RequestError> {
        return network.fetch(
            query: API.GetLocationQuery(id: id)
        )
        .compactMap(\.location)
        .map{ Location(from: $0) }
        .eraseToAnyPublisher()
    }
    
}
