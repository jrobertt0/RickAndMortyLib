//
//  Router.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import SwiftUI

public enum MainRouter: NavigationRouter {
    
    case charactersList
    case characterDetail(id: String)
    case episodeDetail(id: String)
    case locationDetail(id: String)
    
    public var transition: NavigationTransitionStyle {
        switch self {
        case .charactersList:
            return .push
        case .characterDetail:
            return .push
        case .episodeDetail:
            return .push
        case .locationDetail:
            return .push
        }
    }
    
    @ViewBuilder
    public func view() -> some View {
        switch self {
        case .charactersList:
            CharactersView()
        case .characterDetail(id: let id):
            CharacterDetailView(id: id)
        case .episodeDetail(id: let id):
            EpisodeDetailView(id: id)
        case .locationDetail(id: let id):
            LocationDetailView(id: id)
        }
    }
}
