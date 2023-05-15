//
//  Filters.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import Foundation

enum GenderFilter: String, CaseIterable, Identifiable {
    var id : String { UUID().uuidString }
    
    case any = "Any"
    case male = "Male"
    case female = "Female"
    case genderless = "GenderLess"
    case unknown = "Unknown"
}

enum StatusFilter: String, CaseIterable, Identifiable {
    var id : String { UUID().uuidString }
    
    case any = "Any"
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

enum SpeciesFilter: String, CaseIterable, Identifiable {
    var id : String { UUID().uuidString }
    
    case any = "Any"
    case human = "Human"
    case alien = "Alien"
    case humanoid = "Humanoid"
    case poopybutthole = "Poopybutthole"
    case robot = "Robot"
    case cronenberg = "Cronenberg"
    case animal = "Animal"
    case mythological = "Mythological Creature"
    case disease = "Disease"
    case unknown = "Unknown"
}
