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
    
    var currentPage = 1
    
    var cancellables = Set<AnyCancellable>()
    @Published var stateStatus: StateStatusInfiniteScroll = .loading
    
    let repository: CharacterRepositoryProtocol
    
    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchCharacters(resetPage: Bool = true) -> Void {
        if resetPage {
            currentPage = 1
            stateStatus = .loading
        } else {
            if stateStatus == .noMoreItems {
                return
            }
            stateStatus = .loadingMoreItems
        }
        
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
            try repository.fetchCharacters(page: currentPage, filter: filterToPerform)
                .receive(on: DispatchQueue.main)
                .sink(
                    receiveCompletion: {[weak self] result in
                        switch result {
                        case .finished:
                            if self?.stateStatus != .noMoreItems {
                                self?.stateStatus = self?.characters.isEmpty == true ? .noData : .ready
                            }
                           
                            self?.currentPage += 1

                            break
                        case .failure(let error):
                            self?.stateStatus = .error
                            print(error)
                        }
                    }, receiveValue: {[weak self] data in
                        if resetPage {
                            self?.characters = data
                        } else {
                            if data.count == 0 {
                                self?.stateStatus = .noMoreItems
                                return
                            }
                            self?.characters.append(contentsOf: data)
                        }
                        
                    }
                )
                .store(in: &cancellables)
        } catch {
            self.stateStatus = .error
            print("error")
        }
    }
}
