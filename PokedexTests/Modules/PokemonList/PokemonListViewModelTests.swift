//
//  PokemonListViewModelTests.swift
//  PokedexTests
//
//  Created by rafaela.lourenco on 30/11/22.
//

import XCTest
@testable import Pokedex

final class PokemonListViewModelTests: XCTestCase {

    var viewModel: PokemonListViewModel?
    var repositoryMock: PokemonRepositoryProtocolMock?
    
    override func setUp() {
        repositoryMock = PokemonRepositoryProtocolMock()
        viewModel = PokemonListViewModel()
        viewModel?.repository = repositoryMock!
    }
    
    func testInitialization() {
        XCTAssertEqual(viewModel?.state, .loading)
        XCTAssertEqual(viewModel?.pokemons, [])
    }

    func testFetchListSucceed() async {
        let pokemonsMock = [PokemonRow(id: 0, name: "Test")]
        repositoryMock?.fetchListToReturn = .success(pokemonsMock)
        viewModel?.fetch()
        
        XCTAssertTrue(repositoryMock!.fetchListCalled)
        XCTAssertEqual(viewModel?.state, .success)
        XCTAssertEqual(viewModel?.pokemons, pokemonsMock)
    }
    
    func testFetchListFailed() async {
        let errorMock = NSError(domain: "Test", code: 000)
        repositoryMock?.fetchListToReturn = .failure(errorMock)
        viewModel?.fetch()
        
        XCTAssertTrue(repositoryMock!.fetchListCalled)
        XCTAssertEqual(viewModel?.state, .error)
        XCTAssertEqual(viewModel?.pokemons, [])
    }

}
