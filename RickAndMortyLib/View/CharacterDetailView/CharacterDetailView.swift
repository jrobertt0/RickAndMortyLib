//
//  CharacterDetailView.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import SwiftUI

struct CharacterDetailView: View {
    var id: String
    @StateObject var viewModel = CharacterDetailViewModel()
    
    @ViewBuilder func buildInfoRow(title: String, value: String?) -> some View {
        HStack {
            Text("\(title) ")
            Spacer()
            Text(value ?? "Unknown")
        }
    }
    
    @ViewBuilder func buildLocationSection(title: String, location: Location?) -> some View {
        Section(header: Text(title)) {
            buildInfoRow(
                title: "Place",
                value: location?.name
            )
            buildInfoRow(
                title: "Dimension",
                value: location?.dimension
            )
        }
    }
    
    var body: some View {
        VStack {
            switch viewModel.stateStatus {
            case .loading:
                ProgressView()
            case .error:
                Text("Unable to get characters")
            case .noData:
                Text("There's no characters to show")
            case .ready:
                Form {
                    Section {
                        HStack {
                            Spacer()
                            AsyncCircleImage(
                                radius: 100,
                                image: viewModel.character!.image
                            )
                            Spacer()
                        }
                        
                    }
                
                    Section(header: Text("General Information")) {
                        buildInfoRow(
                            title: "Name",
                            value: viewModel.character!.name
                        )
                        buildInfoRow(
                            title: "Gender",
                            value: viewModel.character!.gender
                        )
                        buildInfoRow(
                            title: "Species",
                            value: viewModel.character!.species
                        )
                    }
                    
                    buildLocationSection(
                        title: "Current Location",
                        location: viewModel.character!.location
                    )
                    
                    buildLocationSection(
                        title: "Origin Location",
                        location: viewModel.character!.origin
                    )
                    
                    Section(header: Text("Episode List")) {
                        ForEach(viewModel.character!.episode ?? [], id: \.id) { episode in
                            buildInfoRow(
                                title: episode.name ?? "",
                                value: episode.episode
                            )
                        }
                    }
                }
            }
        }
       .onAppear(
            perform: {
                viewModel.fetchCharacters(id: id)
            }
        )
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(id: "1")
    }
}
