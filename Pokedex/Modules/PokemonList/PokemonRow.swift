//
//  PokemonRow.swift
//  Pokedex
//
//  Created by rafaela.lourenco on 30/11/22.
//

import SwiftUI

typealias PokemonRow = PokemonListResponse.DataClass.Pokemon

struct PokemonRowViewConstants {
    static let backgroundCornerRadius = 20.0
    static let informationPadding = 8.0
}

struct PokemonRowView: View {
    let constants = PokemonRowViewConstants.self
    var pokemon: PokemonRow

    var body: some View {
        GeometryReader { metrics in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: constants.backgroundCornerRadius)
                    .fill(.gray)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(pokemon.name ?? "")
                            .font(.title)
                            .fontWeight(.light)
                        Spacer()
                    }
                }
                .padding(constants.informationPadding)
                .frame(width: informationWidth(metrics))
                
                HStack {
                    Spacer()
                    AsyncImage(url: pokemon.imageUrl()) { phase in
                        phase.image?
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imageWidth(metrics), height: imageHeight(metrics))
                            .offset(imageOffset(metrics))
                        
                    }
                }
            }.padding(rowPadding(metrics))
        }
    }
}

extension PokemonRowView {
    func imageOffset(_ metrics: GeometryProxy) -> CGSize {
        CGSize(width: 0, height: -metrics.size.height * 0.25)
    }
    
    func imageHeight(_ metrics: GeometryProxy) -> CGFloat {
        metrics.size.height * 0.9
    }
    
    func imageWidth(_ metrics: GeometryProxy) -> CGFloat {
        metrics.size.width * 0.45
    }
    
    func rowPadding(_ metrics: GeometryProxy) -> CGFloat {
        metrics.size.width * 0.05
    }
    
    func informationWidth(_ metrics: GeometryProxy) -> CGFloat {
        metrics.size.width * 0.45
    }
}

struct PokemonRowView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { metrics in
            PokemonRowView(pokemon: PokemonRow(id: 9, name: "Pokemom"))
                .frame(height: 300)
                .clipped()
        }
    }
}
