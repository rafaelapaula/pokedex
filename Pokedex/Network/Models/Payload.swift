//
//  Payload.swift
//  Pokedex
//
//  Created by rafaela.lourenco on 23/11/22.
//

import Foundation

struct Payload {}

// MARK: - Pokemon List

extension Payload {
    static func pokemonList() -> Data? {
        let query = """
            {
                "query": "query { pokemon_v2_pokemon(limit: 151) { id name }}"
            }
        """
        return query.data(using: .utf8)
    }
}
