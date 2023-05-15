//
//  StateStatus.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import Foundation

enum StateStatus {
    case ready
    case loading
    case noData
    case error
}

enum StateStatusInfiniteScroll {
    case loading
    case loadingMoreItems
    case noMoreItems
    case ready
    case noData
    case error
}
