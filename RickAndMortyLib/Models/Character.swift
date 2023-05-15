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
extension API.GetCharacterQuery.Data.Character: CharacterBase {}

public class Character: Equatable, Identifiable {
    public static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.id == rhs.id
    }
    public var strongId: UUID
    public var id: String?
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
        self.strongId = UUID()
        assignValues(character: character)
        self.type = character.type
        self.episode = character.episode.filter{ $0 != nil }.map{ Episode(fromBase: $0!) }
        if let location = character.location {
            self.location = Location(fromBase: location)
        }
        if let origin = character.origin {
            self.origin = Location(fromBase: origin)
        }
    }
    
    init(fromBase character: CharacterBase?) {
        self.strongId = UUID()
        assignValues(character: character)
    }
    
    init(fromList character: API.GetCharactersQuery.Data.Characters.Result?) {
        self.strongId = UUID()
        assignValues(character: character)
        self.location = Location(fromBase: character?.location)
    }
    
    init(example: Bool) {
        self.strongId = UUID()
        if example {
            self.id = "1"
            self.gender = "Male"
            self.image = "https://rickandmortyapi.com/api/character/avatar/19.jpeg"
            self.name = "Rick"
            self.species = "Unknown"
            self.status = "unknown"
            self.type = "Unknown"
        }
    }
    
    func assignValues(character: CharacterBase?){
        self.id = character?.id
        self.name = character?.name
        self.gender = character?.gender
        self.species = character?.species
        self.status = character?.status
        self.image = character?.image
    }
}
