//
//  CharacterDetailView.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import SwiftUI

struct CharacterDetailView: View {
    var id: String
    @ObservedObject var viewModel: CharacterDetailViewModel
    
    @EnvironmentObject var coordinator: Coordinator<MainRouter>
    
    @ViewBuilder func buildInfoRow(title: String?, value: String?, showNavIcon: Bool = false) -> some View {
        HStack {
            Text("\(title ?? "Unknown") ")
            Spacer()
            Text(value ?? "Unknown")
                .fontWeight(.light)
                .foregroundColor(.gray)
            if showNavIcon {
                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 5, height: 8)
                    .foregroundColor(.gray.opacity(0.8))
                    .padding(.leading, 5)
            }
        }
    }
    
    @ViewBuilder func buildLocationSection(title: String, location: Location?) -> some View {
        Section(header: Text(title)) {
            buildInfoRow(
                title: "Place",
                value: location?.name,
                showNavIcon: true
            )
            buildInfoRow(
                title: "Dimension",
                value: location?.dimension,
                showNavIcon: true
            )
        }.onTapGesture {
            coordinator.show(.locationDetail(id: location?.id ?? ""))
        }
    }
    
    var body: some View {
        VStack {
            StatusCheckView(
                status: $viewModel.stateStatus,
                onErrorMessage: "Unable to get characters",
                onNoDataMessage: "There are no characters to show"
            ) {
                Form {
                    Section {
                        HStack {
                            Spacer()
                            AsyncCircleImage(
                                radius: 100,
                                image: viewModel.character?.image
                            )
                            Spacer()
                        }
                        
                    }
                
                    Section(header: Text("General Information")) {
                        buildInfoRow(
                            title: "Name",
                            value: viewModel.character?.name
                        )
                        buildInfoRow(
                            title: "Gender",
                            value: viewModel.character?.gender
                        )
                        buildInfoRow(
                            title: "Species",
                            value: viewModel.character?.species
                        )
                    }
                    
                    buildLocationSection(
                        title: "Current Location",
                        location: viewModel.character?.location
                    )
                    
                    buildLocationSection(
                        title: "Origin Location",
                        location: viewModel.character?.origin
                    )
                    
                    Section(header: Text("Episode List")) {
                        List(viewModel.character?.episode ?? [], id: \.id) { episode in
                            buildInfoRow(
                                title: episode.name,
                                value: episode.episode,
                                showNavIcon: true
                            ).onTapGesture {
                                coordinator.show(.episodeDetail(id: episode.id ?? ""))
                            }
                        }
                    }
                }
            }
        }
       .onAppear(
            perform: {
                viewModel.fetchCharacter(id: id)
            }
        )
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(
            id: "1",
            viewModel: CharacterDetailViewModel(
                repository: CharacterRepositoryMock()
            )
        )
    }
}
