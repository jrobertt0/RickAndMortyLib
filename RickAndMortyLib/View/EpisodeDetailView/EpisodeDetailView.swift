//
//  EpisodeDetailView.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import SwiftUI

struct EpisodeDetailView: View {
    var id: String
    @ObservedObject var viewModel: EpisodeDetailViewModel
    
    @ViewBuilder func buildInfoRow(title: String, value: String?) -> some View {
        HStack {
            Text("\(title) ")
            Spacer()
            Text(value ?? "Unknown")
                .fontWeight(.light)
                .foregroundColor(.gray)
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
                
                if let characters = viewModel.episode?.characters {
                    Section(header: Text("Characterss")) {
                        List(characters, id: \.?.id) { character in
                            if let character = character {
                                CharacterRowView(character: character)
                            }
                        }
                        
                    }
                }
            }
        }
        .navigationTitle("Episode")
        .onAppear(
            perform: {
                viewModel.fetchEpisode(id: id)
            }
        )
    }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailView(
            id: "1",
            viewModel: EpisodeDetailViewModel(
                repository: EpisodeRepositoryMock()
            )
        )
    }
}
