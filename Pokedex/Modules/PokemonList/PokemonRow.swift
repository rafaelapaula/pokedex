//
//  PokemonRow.swift
//  Pokedex
//
//  Created by rafaela.lourenco on 30/11/22.
//

import SwiftUI

typealias PokemonRow = PokemonListResponse.DataClass.Pokemon

struct PokemonRowView: View {
    var pokemon: PokemonRow

    var body: some View {
        GeometryReader { metrics in
            HStack {
                Text(pokemon.name ?? "")
                    .font(.title)
                    .fontWeight(.light)
                Spacer()
                AsyncImage(url: pokemon.imageUrl()) { phase in
                    phase.image?
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: metrics.size.width * 0.55)
                }
            }
        }
    }
}

struct PokemonRowView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonRowView(pokemon: PokemonRow(id: 9, name: "Pokemom"))
    }
}
