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
        ZStack {
//            List(viewModel.pokemons) { item in
//                PokemonRowView(pokemon: item)
//            }
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
