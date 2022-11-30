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
    
    func fechDetails(id: Int?, completion: @escaping (Result<PokemonResponse.DataClass.Pokemon, NSError>) -> Void) {
        guard
            let request = createRequest(body: Body.pokemon(with: id))
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
    
    func fechList(completion: @escaping (Result<[PokemonListResponse.DataClass.Pokemon], NSError>) -> Void) {
        guard
            let request = createRequest(body: Body.pokemonList())
        else {
            completion(.failure(NSError(domain: "Error creating URL", code: 0)))
            return
        }
        
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
    
    func createRequest(body: Data?) -> URLRequest? {
        guard
            let url = URL(string: Constants.Url.Pokemon),
            let body = body
        else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = Constants.HttpMethod.Post
        request.httpBody = body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("graphiql", forHTTPHeaderField: "X-Method-Used")
        
        return request
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