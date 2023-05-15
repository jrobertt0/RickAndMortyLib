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
    
    @ViewBuilder func buildBody() -> some View{
        ScrollView {
            LazyVStack {
                ForEach(viewModel.characters, id: \.id) { value in
                    CharacterRowView(
                        character: value,
                        showNavIcon: true
                    ).padding(.horizontal, 10)
                        .padding(.top, 10)
                        .onTapGesture {
                            coordinator.show(.characterDetail(id: value.id!))
                        }.onAppear {
                            if value.id == viewModel.characters.last?.id && viewModel.stateStatus != .loadingMoreItems {
                                viewModel.fetchCharacters(resetPage: false)
                            }
                        }
                    Divider()
                        .padding(.leading, 70)
                    
                }
                
                if viewModel.stateStatus == .loadingMoreItems {
                    HCenterView {
                        ProgressView()
                            .padding(.vertical, 15)
                    }
                } else if viewModel.stateStatus == .noMoreItems {
                    HCenterView {
                        Text("No more characters to load")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.vertical, 15)
                    }
                }
            }.background()
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.horizontal, 15)
        }
    }
    
    var body: some View {
        ZStack {
            Color(.systemGray6).edgesIgnoringSafeArea(.all)
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
                    buildBody()
                }
                Spacer()
                FiltersView(filters: $viewModel.filters)
            }.onAppear {
                viewModel.fetchCharacters()
            }
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
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView(viewModel: CharactersViewModel(repository: CharacterRepositoryMock()))
    }
}
