//
//  HCenterView.swift
//  RickAndMortyLib
//
//  Created by Jose Roberto de Leon Garcia on 15/05/23.
//

import SwiftUI

struct HCenterView<Content: View>: View {
    @ViewBuilder var content: Content
    
    var body: some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
    
}
