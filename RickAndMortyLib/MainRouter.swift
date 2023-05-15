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
    
    public var transition: NavigationTransitionStyle {
        switch self {
        case .charactersList:
            return .push
        case .characterDetail:
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
        }
    }
}
