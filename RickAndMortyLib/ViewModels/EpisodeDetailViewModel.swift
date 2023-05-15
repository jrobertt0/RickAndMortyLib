//
//  EpisodeDetailViewModel.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import Foundation
import Combine

@MainActor class EpisodeDetailViewModel: ObservableObject {
    @Published private(set) var episode: Episode?
    
    var cancellables = Set<AnyCancellable>()
    var stateStatus: StateStatus = .loading
    
    let repository: EpisodeRepositoryProtocol
    
    init(repository: EpisodeRepositoryProtocol) {
        self.repository = repository
    }
    
    func fetchEpisode(id: String) -> Void {
        do {
            try repository.fetchEpisode(id: id)
                .receive(on: DispatchQueue.main)
                .sink(
                    receiveCompletion: { result in
                        switch result {
                        case .finished:
                            self.stateStatus = self.episode == nil ? .noData : .ready
                            break
                        case .failure(let error):
                            self.stateStatus = .error
                            print(error)
                        }
                    }, receiveValue: { data in
                        self.episode = data
                    }
                )
                .store(in: &cancellables)
        } catch {
            self.stateStatus = .error
            print("error")
        }
    }
}
