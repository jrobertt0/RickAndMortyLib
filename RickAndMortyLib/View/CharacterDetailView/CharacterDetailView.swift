//
//  CharacterDetailView.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import SwiftUI

struct CharacterDetailView: View {
    var character: Character
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGroupedBackground).ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 10).overlay(alignment: .center) {
                    AsyncCircleImage(
                        radius: 100,
                        image: character.image
                    )
                }
                .foregroundColor(.white)
                .frame(height: 250)
                .padding(.horizontal, 20)
          
                
                Form {
                    Section {
                        Label("Text", systemImage: "heart")
                    }
                }
            }
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: Character.init(example: true))
    }
}
