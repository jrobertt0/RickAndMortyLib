//
//  CharactersView.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import SwiftUI

struct CharactersView: View {
    @ObservedObject var viewModel: CharactersViewModel
    
    @EnvironmentObject var coordinator: Coordinator<MainRouter>
    
    var body: some View {
        VStack {
            switch viewModel.stateStatus {
            case .loading:
                Spacer()
                ProgressView()
            case .error:
                Spacer()
                Text("Unable to get characters")
            case .noData:
                Spacer()
                Text("There's no characters to show")
            case .ready, .loadingMoreItems, .noMoreItems:
                List {
                    
                    ForEach(viewModel.characters, id: \.id) { value in
                        CharacterRowView(character: value, showNavIcon: true).onTapGesture {
                            coordinator.show(.characterDetail(id: value.id!))
                        }.onAppear {
                            if value.id == viewModel.characters.last?.id && viewModel.stateStatus != .loadingMoreItems {
                                viewModel.fetchCharacters(resetPage: false)
                            }
                        }
                    }
                    
                    if viewModel.stateStatus == .loadingMoreItems {
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                       
                    } else if viewModel.stateStatus == .noMoreItems {
                        HStack {
                            Spacer()
                            Text("No more characters to load").font(.footnote).foregroundColor(.gray)
                            Spacer()
                        }
                    }
                }
            }
            Spacer()
            FiltersView(filters: $viewModel.filters)
        }.onAppear(
            perform: {
                viewModel.fetchCharacters()
            }
        )
        .navigationTitle("Characters")
        .searchable(text: $viewModel.searchText)
        .onChange(
            of: viewModel.searchText,
            perform: { _ in
                viewModel.fetchCharacters()
            }
        ).onChange(
            of: viewModel.filters
        ) { _ in
            viewModel.fetchCharacters()
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView(viewModel: CharactersViewModel(repository: CharacterRepositoryMock()))
    }
}
