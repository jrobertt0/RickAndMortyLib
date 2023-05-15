//
//  Network.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 13/05/23.
//

import Foundation
import Apollo
import Combine

enum RequestError: Error {
    case fetchError
}

class Network {
    static let shared = Network()
    private init() {}
    
    private lazy var apollo = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
    
    func fetch<T: GraphQLQuery>(query: T) -> AnyPublisher<T.Data, RequestError>  {

        let future = Future<T.Data, RequestError> { promise in
            self.apollo.fetch(query: query) { result in
                guard let data = try? result.get().data else {
                    print("Error fetching")
                    return promise(.failure(RequestError.fetchError))
                }
                return promise(.success(data))
            }
        }.eraseToAnyPublisher()

        return future
    }
}
