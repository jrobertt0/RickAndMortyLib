//
//  CharactersViewModel.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import Foundation
import Combine

struct FilterState: Equatable {
    var gender: GenderFilter = .any
    var status: StatusFilter = .any
    var species: SpeciesFilter = .any
}

@MainActor class CharactersViewModel: ObservableObject {
    @Published private(set) var characters: [Character] = []
    @Published var searchText = ""
    @Published var filters = FilterState(gender: .any, status: .any, species: .any)
    
    var cancellables = Set<AnyCancellable>()
    var stateStatus: StateStatus = .loading
    
    let repository: CharacterRepositoryProtocol
    
    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchCharacters(page: Int = 1) -> Void {
        let filterToPerform: API.FilterCharacter? = API.FilterCharacter(
            name: GraphQLNullable.init(
                stringLiteral: searchText
            ),
            status: filters.status != .any ? GraphQLNullable.init(
                stringLiteral: filters.status.rawValue
            ) : nil,
            species: filters.species != .any ? GraphQLNullable.init(
                stringLiteral: filters.species.rawValue
            ) : nil,
            gender: filters.gender != .any ? GraphQLNullable.init(
                stringLiteral: filters.gender.rawValue
            ) : nil
        )
        
        do {
            try repository.fetchCharacters(page: page, filter: filterToPerform)
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
