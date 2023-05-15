//
//  Episode.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 13/05/23.
//

import Foundation

protocol EpisodeBase {
    var air_date: String? { get }
    var episode: String? { get }
    var id: String? { get }
    var name: String? { get }
}

extension API.GetEpisodesQuery.Data.Episodes.Result: EpisodeBase {}
extension API.GetCharacterQuery.Data.Character.Episode: EpisodeBase {}

struct Episode {
    var airDate: String?
    var characters: [Character?]?
    var episode: String?
    var id: String?
    var name: String?
    
    init(from episode: API.GetEpisodeQuery.Data.Episode) {
        self.airDate = episode.air_date
        self.characters = episode.characters.filter{ $0 != nil }.map{ Character(fromBase: $0!) }
        self.episode = episode.episode
        self.id = episode.id
        self.name = episode.name
    }
    
    init(from episode: EpisodeBase) {
        self.airDate = episode.air_date
        self.episode = episode.episode
        self.id = episode.id
        self.name = episode.name
    }
    
    init(example: Bool) {
        if example {
            self.airDate = "Yesterday"
            self.characters = [Character(example: true)]
            self.episode = "Chapter 1"
            self.id = "1"
            self.name = "Pilot"
        }
    }
}
