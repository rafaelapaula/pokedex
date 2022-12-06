//
//  PokemonListView.swift
//  Pokedex
//
//  Created by rafaela.lourenco on 30/11/22.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var viewModel = PokemonListViewModel()
    
    var loading: some View {
        ZStack {
            Text("Loading...")
        }
    }
    
    var success: some View {
        GeometryReader { metrics in
            ZStack {
                List(viewModel.pokemons) { pokemon in
                    PokemonRowView(pokemon: pokemon)
                        .listRowSeparator(.hidden)
                        .frame(height: metrics.size.height * 0.2)
                }
            }
        }
    }
    
    var error: some View {
        ZStack {
            Button("Error! \nTap to try again!") {
                viewModel.fetch()
            }
        }
    }
    
    var body: some View {
        ZStack {
            switch(viewModel.state) {
            case .loading:
                self.loading
            case .success:
                self.success
            case .error:
                self.error
            }
        }.onAppear {
            viewModel.fetch()
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
