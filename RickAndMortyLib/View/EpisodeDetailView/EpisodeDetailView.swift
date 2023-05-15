//
//  EpisodeDetailView.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import SwiftUI

struct EpisodeDetailView: View {
    var id: String
    @StateObject var viewModel = EpisodeDetailViewModel()
    
    @ViewBuilder func buildInfoRow(title: String, value: String?) -> some View {
        HStack {
            Text("\(title) ")
            Spacer()
            Text(value ?? "Unknown")
        }
    }
    
    var body: some View {
        StatusCheckView(
            status: $viewModel.stateStatus,
            onErrorMessage: "Unable to get episode detail"
        ) {
            Form {
                Section(header: Text("Episode Detail")) {
                    buildInfoRow(
                        title: "Name",
                        value: viewModel.episode?.name
                    )
                    buildInfoRow(
                        title: "Number",
                        value: viewModel.episode?.episode
                    )
                    buildInfoRow(
                        title: "Air Date",
                        value: viewModel.episode?.airDate
                    )
                }
                
                Section(header: Text("Characterss")) {
                    List(viewModel.episode?.characters ?? [], id: \.?.id) { character in
                        if let character = character {
                            CharacterRowView(character: character)
                        }
                    }
                    
                }
                
            }
        }
        .onAppear(
            perform: {
                viewModel.fetchEpisode(id: id)
            }
        )
    }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailView(id: "1")
    }
}
