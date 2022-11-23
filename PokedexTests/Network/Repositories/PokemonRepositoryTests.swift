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
    
    func testFechPokemonList() {
        let expectation = XCTestExpectation(description: "Pokemon List Received")
        
        pokemonRepository?.fechList { result in
            switch result {
            case .success(let pokemons):
                XCTAssertEqual(pokemons[0].name, "bulbasaur")
                expectation.fulfill()
            default:
                break
            }
        }
        
        wait(for: [expectation], timeout: 1)
    }
}
