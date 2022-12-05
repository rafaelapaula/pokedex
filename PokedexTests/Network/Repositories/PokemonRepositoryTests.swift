//
//  PokemonRepositoryTests.swift
//  PokedexTests
//
//  Created by rafaela.lourenco on 23/11/22.
//

import XCTest
@testable import Pokedex

/**
 The expectation of this class is to test the repository and also the real endpoint.
 **/

final class PokemonRepositoryTests: XCTestCase {
    var pokemonRepository: PokemonRepository?
    
    override func setUp() {
        pokemonRepository = PokemonRepository()
    }
    
    func testFechPokemonList() {
        let expectation = XCTestExpectation(description: "Pokemon List Received")
        
        pokemonRepository?.fetchList { result in
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
    
    func testFechPokemonDetails() {
        let expectation = XCTestExpectation(description: "Pokemon Details Received")
        
        pokemonRepository?.fetchDetails(id: 12) { result in
            switch result {
            case .success(let pokemon):
                XCTAssertEqual(pokemon.name, "butterfree")
                expectation.fulfill()
            default:
                break
            }
        }
        
        wait(for: [expectation], timeout: 1)
    }
}
