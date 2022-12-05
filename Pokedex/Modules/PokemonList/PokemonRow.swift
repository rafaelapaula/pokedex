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
        Text(pokemon.name ?? "")
    }
}
