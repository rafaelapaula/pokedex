//
//  PokemonRepositoryProtocolMock.swift
//  PokedexTests
//
//  Created by rafaela.lourenco on 30/11/22.
//

import Foundation
@testable import Pokedex

class PokemonRepositoryProtocolMock: PokemonRepositoryProtocol {
    private(set) var fetchListCalled = false
    var fetchListToReturn: Result<[Pokedex.PokemonListResponse.DataClass.Pokemon], NSError>?
    
    func fetchDetails(id: Int?, completion: @escaping (Result<Pokedex.PokemonResponse.DataClass.Pokemon, NSError>) -> Void) {}
    
    func fetchList(completion: @escaping (Result<[Pokedex.PokemonListResponse.DataClass.Pokemon], NSError>) -> Void) {
        fetchListCalled = true
        completion(fetchListToReturn!)
    }
}
