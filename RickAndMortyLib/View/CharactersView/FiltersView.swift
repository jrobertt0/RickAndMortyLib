//
//  FiltersView.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import SwiftUI

struct FiltersView: View {
    @State private var topExpanded: Bool = true
    
    var body: some View {
        DisclosureGroup("Filters", isExpanded: $topExpanded) {
            HStack{
                Menu {
                    ForEach(GenderFilter.allCases) { filter in
                        Button {
                            // do something
                        } label: {
                            Text(filter.rawValue)
                        }
                    }
                } label: {
                    Text("Gender")
                    Image(systemName: "arrowtriangle.down.fill").resizable().frame(width: 8, height: 5)
                }
                
                Spacer()
                
                Menu {
                    ForEach(StatusFilter.allCases) { filter in
                        Button {
                            // do something
                        } label: {
                            Text(filter.rawValue)
                        }
                    }
                } label: {
                    Text("Status")
                    Image(systemName: "arrowtriangle.down.fill").resizable().frame(width: 8, height: 5)
                }
                
                Spacer()
                
                Menu {
                    ForEach(GenderFilter.allCases) { filter in
                        Button {
                            // do something
                        } label: {
                            Text(filter.rawValue)
                        }
                    }
                } label: {
                    Text("Species")
                    Image(systemName: "arrowtriangle.down.fill").resizable().frame(width: 8, height: 5)
                }
            }.padding(.top, 20)
        }.padding(.horizontal, 40)
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView()
    }
}
