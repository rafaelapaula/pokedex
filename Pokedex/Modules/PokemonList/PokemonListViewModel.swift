//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by rafaela.lourenco on 30/11/22.
//

import SwiftUI

protocol PokemonListViewModelProtocol {
    func fetch()
}

class PokemonListViewModel: ObservableObject, PokemonListViewModelProtocol {
    
    @Published var pokemons: [PokemonRow] = []
    @Published var state: State = .loading
    
    var repository: PokemonRepositoryProtocol = PokemonRepository()
    
    func fetch() {
        state.loading()
        repository.fetchList { [weak self] result in
            switch result {
            case .success(let pokemons):
                self?.pokemons = pokemons
                self?.state.success()
            case .failure(let error):
                print(error)
                self?.state.error()
            }
        }
    }
}
