//
//  PokemonResponse.swift
//  Pokedex
//
//  Created by rafaela.lourenco on 25/11/22.
//

import Foundation

// MARK: - PokemonResponse
struct PokemonResponse: Codable, Hashable {
    let data: DataClass?
    
    // MARK: - DataClass
    struct DataClass: Codable, Hashable {
        let pokemon: Pokemon?
        
        // MARK: - Pokemon
        struct Pokemon: Codable, Hashable {
            let id: Int?
            let name: String?
        }

        enum CodingKeys: String, CodingKey {
            case pokemon = "pokemon_v2_pokemon_by_pk"
        }
    }
}
