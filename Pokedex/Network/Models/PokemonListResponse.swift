//
//  PokemonListResponse.swift
//  Pokedex
//
//  Created by rafaela.lourenco on 23/11/22.
//

import Foundation

// MARK: - PokemonListResponse
struct PokemonListResponse: Codable, Hashable {
    let data: DataClass?
    
    // MARK: - DataClass
    struct DataClass: Codable, Hashable {
        let pokemons: [Pokemon]?
        
        // MARK: - Pokemon
        struct Pokemon: Codable, Hashable, Identifiable {
            let id: Int?
            let name: String?
            
            func imageUrl() -> URL? {
                guard let id = id else { return nil }
                return URL(string: "\(Constants.Url.Sprite)\(id).png")
            }
        }

        enum CodingKeys: String, CodingKey {
            case pokemons = "pokemon_v2_pokemon"
        }
    }
}
