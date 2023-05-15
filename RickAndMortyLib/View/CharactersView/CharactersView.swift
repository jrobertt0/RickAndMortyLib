//
//  CharactersView.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import SwiftUI

struct CharactersView: View {
    @StateObject var viewModel = CharactersViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.stateStatus {
                case .loading:
                    ProgressView()
                case .error:
                    Text("Unable to get characters")
                case .noData:
                    Text("There's no characters to show")
                case .ready:
                    VStack {
                        List(viewModel.characters, id: \.id) { value in
                            NavigationLink {
                                CharacterDetailView()
                            } label: {
                                CharacterRowView(character: value)//label
                            }
                            
                        }
                        FiltersView()
                    }
                }
            }.onAppear(
                perform: {
                    viewModel.fetchCharacters()
                }
            )
            .navigationTitle("Characters")
        }
        .searchable(text: $viewModel.searchText)
        .onChange(
            of: viewModel.searchText,
            perform: { _ in
                viewModel.fetchCharacters()
            }
        )
        
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
    }
}
