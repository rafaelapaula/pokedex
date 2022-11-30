//
//  URLRequest+ExtensionTests.swift
//  PokedexTests
//
//  Created by rafaela.lourenco on 30/11/22.
//

import XCTest
@testable import Pokedex

final class URLRequest_ExtensionTests: XCTestCase {

    func testPokemonGraphQLWithValidRequest() {
        let request = URLRequest.pokemonGraphQL(body: Body.pokemonList())
        
        XCTAssertEqual(request!.httpMethod, "POST")
        XCTAssertEqual(request!.value(forHTTPHeaderField: "X-Method-Used"), "graphiql")
        XCTAssertEqual(request!.value(forHTTPHeaderField: "Content-Type"), "application/json")
        XCTAssertEqual(request!.httpBody, Body.pokemonList())
    }
    
    func testPokemonGraphQLWithInvalidRequest() {
        let request = URLRequest.pokemonGraphQL(body: nil)

        XCTAssertNil(request)
    }

}
