//
//  EpisodeRepositoryMock.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 15/05/23.
//

import Foundation
import Combine

class EpisodeRepositoryMock: EpisodeRepositoryProtocol {
    func fetchEpisodes(page: Int, filter: API.FilterEpisode?) throws -> AnyPublisher<[Episode], RequestError> {
        return Just([Episode.init(example: true), Episode.init(example: true)])
            .setFailureType(to: RequestError.self)
            .eraseToAnyPublisher()
    }
    
    func fetchEpisode(id: String) throws -> AnyPublisher<Episode, RequestError> {
        return Just(Episode.init(example: true))
            .setFailureType(to: RequestError.self)
            .eraseToAnyPublisher()
    }
}
