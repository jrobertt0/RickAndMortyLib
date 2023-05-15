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

struct Location {
    var id: String?
    var dimension: String?
    var name: String?
    var residents: [Character?]?
    var type: String?
    
    init(from location: API.GetLocationQuery.Data.Location) {
        self.id = location.id
        self.dimension = location.dimension
        self.name = location.name
        self.residents = location.residents.filter {$0 != nil}.map({ resident in
          return Character(from: resident!)
        })
        self.type = location.type
    }
    
    init(from location: LocationBase?) {
        self.id = location?.id
        self.dimension = location?.dimension
        self.name = location?.name
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
}
