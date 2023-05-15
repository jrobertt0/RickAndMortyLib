//
//  EpisodeRepository.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import Foundation
import Combine

protocol EpisodeRepositoryProtocol {
    func fetchEpisodes(page: Int, filter: API.FilterEpisode?) throws -> AnyPublisher<[Episode], RequestError>
    func fetchEpisode(id: String) throws -> AnyPublisher<Episode, RequestError>
}

class EpisodeRepository: EpisodeRepositoryProtocol {
    static let shared = EpisodeRepository()
    private init() {}
    
    private let network = Network.shared
    
    func fetchEpisodes(page: Int, filter: API.FilterEpisode? = nil) throws -> AnyPublisher<[Episode], RequestError> {
        let parsedFilter = filter == nil ? GraphQLNullable<API.FilterEpisode>(API.FilterEpisode()) : GraphQLNullable<API.FilterEpisode>(filter!)
        
        return network.fetch(
            query: API.GetEpisodesQuery(
                page: GraphQLNullable<Int>(integerLiteral: page),
                filter: parsedFilter
            )
        )
        .compactMap(\.episodes?.results)
        .flatMap{
            Just(
                $0.map{ data in Episode(fromBase: data) }
            )
        }
        .eraseToAnyPublisher()
    }
    
    func fetchEpisode(id: String) throws -> AnyPublisher<Episode, RequestError> {
        return network.fetch(
            query: API.GetEpisodeQuery(id: id)
        )
        .compactMap(\.episode)
        .map{ Episode(from: $0) }
        .eraseToAnyPublisher()
    }
    
}
