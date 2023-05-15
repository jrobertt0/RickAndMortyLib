//
//  AsyncCircleImage.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 14/05/23.
//

import SwiftUI

struct AsyncCircleImage: View {
    let radius: Double
    let image: String?
    
    var body: some View {
        AsyncImage.init(url: URL(string: image ?? "")) { image in
           image.resizable()
                .frame(width: radius*2, height: radius*2)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
        } placeholder: {
            ProgressView().frame(width: radius*2, height: radius*2)
        }
    }
}

struct AsyncCircleImage_Previews: PreviewProvider {
    static var previews: some View {
        AsyncCircleImage(radius: 30, image: "https://rickandmortyapi.com/api/character/avatar/19.jpeg")
    }
}
