//
//  CharactersViewModel.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import Foundation
import Combine

@MainActor class CharactersViewModel: ObservableObject {
    @Published private(set) var characters: [Character] = []
    @Published var searchText = ""
    
    var cancellables = Set<AnyCancellable>()
    var stateStatus: StateStatus = .loading
    
    func fetchCharacters(page: Int = 1, filter: API.FilterCharacter? = nil) -> Void {
        var filterToPerform: API.FilterCharacter? = nil
        if let filter = filter {
            filterToPerform = API.FilterCharacter(
                name: GraphQLNullable.init(
                    stringLiteral: searchText)
                ,
                status: filter.status,
                species: filter.species,
                gender: filter.gender
            )
        } else {
            filterToPerform = API.FilterCharacter(
                name: GraphQLNullable.init(
                    stringLiteral: searchText)
                )
        }
        
        do {
            try CharacterRepository.shared.fetchCharacters(page: page, filter: filterToPerform)
                .receive(on: DispatchQueue.main)
                .sink(
                    receiveCompletion: { result in
                        switch result {
                        case .finished:
                            self.stateStatus = self.characters.isEmpty ? .noData : .ready
                            break
                        case .failure(let error):
                            self.stateStatus = .error
                            print(error)
                        }
                    }, receiveValue: { data in
                        self.characters = data
                    }
                )
                .store(in: &cancellables)
        } catch {
            self.stateStatus = .error
            print("error")
        }
    }
}
