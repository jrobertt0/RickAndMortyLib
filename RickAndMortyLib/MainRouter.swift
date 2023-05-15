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
    
    @MainActor @ViewBuilder
    public func view() -> some View {
        switch self {
        case .charactersList:
            CharactersView(viewModel: CharactersViewModel(repository: CharacterRepository.shared))
        case .characterDetail(id: let id):
            CharacterDetailView(id: id, viewModel: CharacterDetailViewModel(repository: CharacterRepository.shared))
        case .episodeDetail(id: let id):
            EpisodeDetailView(id: id, viewModel: EpisodeDetailViewModel(repository: EpisodeRepository.shared))
        case .locationDetail(id: let id):
            LocationDetailView(id: id, viewModel: LocationDetailViewModel(repository: LocationRepository.shared))
        }
    }
}
