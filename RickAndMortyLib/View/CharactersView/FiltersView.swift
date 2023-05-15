//
//  FiltersView.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import SwiftUI

struct FiltersView: View {
    @State private var topExpanded: Bool = false
    @Binding var filters: FilterState
    
    var body: some View {
        DisclosureGroup("Filters", isExpanded: $topExpanded) {
            VStack {
                HStack{
                    Text("Gender")
                    Spacer()
                    Picker(selection: $filters.gender, label: Text("Unselected")) {
                        ForEach(GenderFilter.allCases, id: \.self) { filter in
                            Text(filter.rawValue)
                        }
                    }
                }
                Divider()
                HStack{
                    Text("Status")
                    Spacer()
                    Picker(selection: $filters.status, label: Text("Unselected")) {
                        ForEach(StatusFilter.allCases, id: \.self) { filter in
                            Text(filter.rawValue)
                        }
                    }
                }
                Divider()
                HStack{
                    Text("Species")
                    Spacer()
                    Picker(selection: $filters.species, label: Text("Species")) {
                        ForEach(SpeciesFilter.allCases, id: \.self) { filter in
                            Text(filter.rawValue)
                        }
                    }
                }
                Button("Clear Filters") {
                    filters = FilterState()
                }.padding(.top, 10)
            }.padding(.top, 20)
        }.padding(.horizontal, 40)
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView(filters: .constant(FilterState()))
    }
}
