//
//  CharacterRepository.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import Foundation
import Combine

class CharacterRepository {
    static let shared = CharacterRepository()
    private init() {}
    
    private let network = Network.shared
    
    func fetchCharacters(page: Int, filter: API.FilterCharacter? = nil) throws -> AnyPublisher<[Character], RequestError> {
        let parsedFilter = filter == nil ? GraphQLNullable<API.FilterCharacter>(API.FilterCharacter()) : GraphQLNullable<API.FilterCharacter>(filter!)
        
        return network.fetch(
            query: API.GetCharactersQuery(
                page: GraphQLNullable<Int>(integerLiteral: page),
                filter: parsedFilter
            )
        )
        .compactMap(\.characters?.results)
        .flatMap{
            Just(
                $0.map{ data in Character(from: data) }
            )
        }
        .eraseToAnyPublisher()
    }
    
    func fetchCharacter(id: String) throws -> AnyPublisher<Character, RequestError> {
        return network.fetch(
            query: API.GetCharacterQuery(id: id)
        )
        .compactMap(\.character)
        .map{ Character(from: $0) }
        .eraseToAnyPublisher()
    }
    
}
