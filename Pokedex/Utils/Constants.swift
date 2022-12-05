//
//  Constants.swift
//  Pokedex
//
//  Created by rafaela.lourenco on 23/11/22.
//

import Foundation

struct Constants {
    struct Url {
        static let Pokemon = "https://beta.pokeapi.co/graphql/v1beta"
        static let Sprite = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/"
    }
    
    struct HttpMethod {
        static let Post = "POST"
    }
    
    struct Parameters {
        static let ContentType = (value: "application/json", field: "Content-Type")
        static let XMethodUsed = (value: "graphiql", field: "X-Method-Used")
    }
}
