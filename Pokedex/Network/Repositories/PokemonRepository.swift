//
//  PokemonRepository.swift
//  Pokedex
//
//  Created by rafaela.lourenco on 23/11/22.
//

import Foundation

protocol PokemonRepositoryProtocol {
    func fetchDetails(id: Int?, completion: @escaping (Result<PokemonResponse.DataClass.Pokemon, NSError>) -> Void)
    func fetchList(completion: @escaping (Result<[PokemonListResponse.DataClass.Pokemon], NSError>) -> Void)
}

class PokemonRepository: PokemonRepositoryProtocol {
    let session = URLSession.shared
    
    func fetchDetails(id: Int?, completion: @escaping (Result<PokemonResponse.DataClass.Pokemon, NSError>) -> Void) {
        guard
            let request = URLRequest.pokemonGraphQL(body: Body.pokemon(with: id))
        else {
            completion(.failure(NSError(domain: "Error creating URL", code: 0)))
            return
        }
        
        let task = session.pokemonResponseTask(with: request) { pokemonResponse, response, error in
            guard
                let pokemonResponse = pokemonResponse,
                let pokemon = pokemonResponse.data?.pokemon
            else {
                completion(.failure(NSError(domain: "Error parsing response", code: 0)))
                return
            }
            completion(.success(pokemon))
        }
        task.resume()
    }
    
    func fetchList(completion: @escaping (Result<[PokemonListResponse.DataClass.Pokemon], NSError>) -> Void) {
        guard
            let request = URLRequest.pokemonGraphQL(body: Body.pokemonList())
        else {
            completion(.failure(NSError(domain: "Error creating URL", code: 0)))
            return
        }
        
        let task = session.pokemonListResponseTask(with: request) { pokemonListResponse, response, error in
            guard
                let pokemons = pokemonListResponse?.data?.pokemons
            else {
                completion(.failure(NSError(domain: "Error parsing response", code: 0)))
                return
            }
            completion(.success(pokemons))
            
        }
        task.resume()
    }
}

// MARK: - URLSession Extension

extension URLSession {
    fileprivate func pokemonListResponseTask(with request: URLRequest, completionHandler: @escaping (PokemonListResponse?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: request, completionHandler: completionHandler)
    }
    
    fileprivate func pokemonResponseTask(with request: URLRequest, completionHandler: @escaping (PokemonResponse?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: request, completionHandler: completionHandler)
    }
}
