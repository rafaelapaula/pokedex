//
//  Payload.swift
//  Pokedex
//
//  Created by rafaela.lourenco on 23/11/22.
//

import Foundation

struct Body {}

// MARK: - Pokemon List

extension Body {
    static func pokemonList() -> Data? {
        let query = """
            {
                "query": "query { pokemon_v2_pokemon(limit: 151) { id name }}"
            }
        """
        return query.data(using: .utf8)
    }
    
    static func pokemon(with id: Int?) -> Data? {
        guard let id = id else { return nil }
        
        let query = """
            {
                "query": "query { pokemon_v2_pokemon_by_pk(id: \(String(describing: id))) { id name }}"
            }
        """
        
        return query.data(using: .utf8)
    }
}
