//
//  LocationDetailViewModel.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import Foundation
import Combine

@MainActor class LocationDetailViewModel: ObservableObject {
    @Published private(set) var location: Location?
    
    var cancellables = Set<AnyCancellable>()
    var stateStatus: StateStatus = .loading
    
    func fetchLocation(id: String) -> Void {
        do {
            try LocationRepository.shared.fetchLocation(id: id)
                .receive(on: DispatchQueue.main)
                .sink(
                    receiveCompletion: { result in
                        switch result {
                        case .finished:
                            self.stateStatus = self.location == nil ? .noData : .ready
                            break
                        case .failure(let error):
                            self.stateStatus = .error
                            print(error)
                        }
                    }, receiveValue: { data in
                        self.location = data
                    }
                )
                .store(in: &cancellables)
        } catch {
            self.stateStatus = .error
            print("error")
        }
    }
}
