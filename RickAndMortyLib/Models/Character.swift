//
//  Character.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 13/05/23.
//

import Foundation

protocol CharacterBase {
    var id: String?  { get }
    var name: String?  { get }
    var gender: String?  { get }
    var species: String?  { get }
    var status: String?  { get }
    var image: String?  { get }
}

extension API.GetCharactersQuery.Data.Characters.Result: CharacterBase {}
extension API.GetLocationQuery.Data.Location.Resident: CharacterBase {}
extension API.GetEpisodeQuery.Data.Episode.Character: CharacterBase {}

public class Character {
    var id: String?
    var episode: [Episode]?
    var gender: String?
    var image: String?
    var location: Location?
    var name: String?
    var origin: Location?
    var species: String?
    var status: String?
    var type: String?
    
    init(from character: API.GetCharacterQuery.Data.Character) {
        self.id = character.id
        self.episode = character.episode.filter{ $0 != nil }.map{ Episode(from: $0!) }
        self.gender = character.gender
        self.image = character.image
        
        if let location = character.location {
            self.location = Location(from: location)
        }
        if let origin = character.origin {
            self.origin = Location(from: origin)
        }
        
        self.name = character.name
        self.species = character.species
        self.status = character.status
        self.type = character.type
    }
    
    init(from character: CharacterBase?) {
        self.id = character?.id
        self.name = character?.name
        self.gender = character?.gender
        self.species = character?.species
        self.status = character?.status
        self.image = character?.image
    }
    
    init(example: Bool) {
        if example {
            self.id = "1"
//            self.episode = [Episode(example: true)]
            self.gender = "Male"
            self.image = "https://rickandmortyapi.com/api/character/avatar/19.jpeg"
            self.name = "Rick"
//            self.location = Location(example: true)
//            self.origin = Location(example: true)
            self.species = "Unknown"
            self.status = "unknown"
            self.type = "Unknown"
        }
    }
}
