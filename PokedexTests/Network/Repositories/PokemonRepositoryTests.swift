//
//  PokemonRepositoryTests.swift
//  PokedexTests
//
//  Created by rafaela.lourenco on 23/11/22.
//

import XCTest
@testable import Pokedex

final class PokemonRepositoryTests: XCTestCase {
    var pokemonRepository: PokemonRepository?
    
    override func setUp() {
        pokemonRepository = PokemonRepository()
    }
    
    func testFechPokemonList() async {
        pokemonRepository?.fetchList { result in
            switch result {
            case .success(let pokemons):
                XCTAssertEqual(pokemons[0].name, "bulbasaur")
            default:
                break
            }
        }
    }
    
    func testFechPokemonDetails() async {
        pokemonRepository?.fetchDetails(id: 10) { result in
            switch result {
            case .success(let pokemon):
                XCTAssertEqual(pokemon.name, "bulbasaur")
            default:
                break
            }
        }
    }
}
