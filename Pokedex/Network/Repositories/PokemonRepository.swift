//
//  PokemonRepository.swift
//  Pokedex
//
//  Created by rafaela.lourenco on 23/11/22.
//

import Foundation

protocol PokemonRepositoryProtocol {
    
}

class PokemonRepository: PokemonRepositoryProtocol {
    let session = URLSession.shared
    
    func fechList(completion: @escaping (Result<[Pokemon], NSError>) -> Void) {
        guard
            let url = URL(string: Constants.Url.PokemonList),
            let postData = Payload.pokemonList()
        else {
            completion(.failure(NSError(domain: "Error creating URL", code: 0)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = Constants.HttpMethod.Post
        request.httpBody = postData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("graphiql", forHTTPHeaderField: "X-Method-Used")
        
        let task = session.pokemonListResponseTask(with: request) { pokemonListResponse, response, error in
            guard
                let pokemonListResponse = pokemonListResponse
            else {
                completion(.failure(NSError(domain: "Error parsing response", code: 0)))
                return
            }
            let pokemons = pokemonListResponse.data?.pokemons
            completion(.success(pokemons ?? []))
            
        }
        task.resume()
    }
}

// MARK: - URLSession Extension

extension URLSession {
    fileprivate func pokemonListResponseTask(with request: URLRequest, completionHandler: @escaping (PokemonListResponse?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: request, completionHandler: completionHandler)
    }
}
