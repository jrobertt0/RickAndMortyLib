//
//  Location.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 13/05/23.
//

import Foundation

protocol LocationBase {
    var id: String? { get }
    var dimension: String? { get }
    var name: String? { get }
}

extension API.GetLocationsQuery.Data.Locations.Result: LocationBase {}
extension API.GetCharacterQuery.Data.Character.Location: LocationBase {}
extension API.GetCharacterQuery.Data.Character.Origin: LocationBase {}
extension API.GetLocationQuery.Data.Location: LocationBase {}
extension API.GetCharactersQuery.Data.Characters.Result.Location: LocationBase {}

class Location: Equatable {
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: String?
    var dimension: String?
    var name: String?
    var residents: [Character?]?
    var type: String?
    
    init(from location: API.GetLocationQuery.Data.Location) {
        assignValues(location: location)
        self.residents = location.residents.filter {$0 != nil}.map({ resident in
          return Character(fromBase: resident!)
        })
        self.type = location.type
    }
    
    init(fromBase location: LocationBase?) {
        assignValues(location: location)
    }
    
    init(example: Bool) {
        if example {
            self.id = "1"
            self.dimension = "Terra 1"
            self.name = "Tierra"
            self.residents = [Character(example: true)]
            self.type = "Unknown"
        }
    }
    
    func assignValues(location: LocationBase?) {
        self.id = location?.id
        self.dimension = location?.dimension
        self.name = location?.name
    }
}
