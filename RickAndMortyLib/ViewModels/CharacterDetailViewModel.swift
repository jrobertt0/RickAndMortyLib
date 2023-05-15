//
//  CharacterDetail.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import Foundation
import Combine

@MainActor class CharacterDetailViewModel: ObservableObject {
    @Published private(set) var character: Character?
    
    var cancellables = Set<AnyCancellable>()
    var stateStatus: StateStatus = .loading
    
    let repository: CharacterRepositoryProtocol
    
    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
    func fetchCharacter(id: String) -> Void {
        do {
            try repository.fetchCharacter(id: id)
                .receive(on: DispatchQueue.main)
                .sink(
                    receiveCompletion: { result in
                        switch result {
                        case .finished:
                            self.stateStatus = self.character == nil ? .noData : .ready
                            break
                        case .failure(let error):
                            self.stateStatus = .error
                            print(error)
                        }
                    }, receiveValue: { data in
                        self.character = data
                    }
                )
                .store(in: &cancellables)
        } catch {
            self.stateStatus = .error
            print("error")
        }
    }
}
