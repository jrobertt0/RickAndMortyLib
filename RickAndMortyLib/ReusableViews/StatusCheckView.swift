//
//  StatusCheckView.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import SwiftUI

struct StatusCheckView<Content: View>: View {
    @Binding var status: StateStatus
    var onErrorMessage: String?
    var onNoDataMessage: String?
    @ViewBuilder var content: Content
    
    var body: some View {
        VStack {
            switch status {
            case .loading:
                ProgressView()
            case .error:
                Text(onErrorMessage ?? "Unable to get data")
            case .noData:
                Text(onNoDataMessage ?? "There's no data to show")
            case .ready:
                content
            }
            
        }
    }
}
