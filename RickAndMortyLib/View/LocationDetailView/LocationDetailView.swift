//
//  LocationDetailView.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import SwiftUI

struct LocationDetailView: View {
    var id: String
    @ObservedObject var viewModel: LocationDetailViewModel
    
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
        VStack {
            StatusCheckView(
                status: $viewModel.stateStatus,
                onErrorMessage: "Unable to get location detail"
            ) {
                Form {
                    Section(header: Text("Location Detail")) {
                        buildInfoRow(
                            title: "Name",
                            value: viewModel.location?.name
                        )
                        buildInfoRow(
                            title: "Dimension",
                            value: viewModel.location?.dimension
                        )
                    }
                    
                    if let residents = viewModel.location?.residents {
                        Section(header: Text("Residents")) {
                            List(residents, id: \.?.id) { resident in
                                if let resident = resident {
                                    CharacterRowView(character: resident)
                                }
                            }
                            
                        }
                    }
                    
                    
                }
            }
        }
        .onAppear(
            perform: {
                viewModel.fetchLocation(id: id)
            }
        )
        
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(
            id: "1",
            viewModel: LocationDetailViewModel(
                repository: LocationRepositoryMock()
            )
        )
    }
}
