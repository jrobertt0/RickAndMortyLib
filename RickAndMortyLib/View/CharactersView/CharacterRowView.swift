//
//  CharacterRow.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import SwiftUI

struct CharacterRowView: View {
    var character: Character
    
    var body: some View {
        HStack{
            AsyncImage.init(url: URL(string: character.image ?? "")) { image in
               image.resizable()
                    .frame(width: 40, height: 40)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView().frame(width: 40, height: 40)
            }.padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                Text(character.name ?? "Unknown").font(.body)
                Text(character.gender ?? "Unknown").font(.caption).foregroundColor(.gray)
            }
            
            Spacer()
           
            if let status = character.status {
                VStack {
                    switch StatusFilter(rawValue: status) {
                    case .some(.alive):
                        Image(systemName: "heart.fill")
                            .foregroundColor(.gray.opacity(0.8))
                    case .some(.dead):
                        Image("deadStatus")
                            .foregroundColor(.gray.opacity(0.8))
                    case .some(.unknown):
                        Image(systemName: "questionmark")
                            .foregroundColor(.gray.opacity(0.8)).padding(.trailing, 5)
                    case .none:
                        Image(systemName: "questionmark")
                            .foregroundColor(.gray.opacity(0.8))
                    }
                    
                    if StatusFilter(rawValue: status) != .unknown {
                        Text(status)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.top, 5)
                    }
                    
                }
            }

        }
    }
}

struct CharacterRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRowView(character: Character(example: true))
    }
}
