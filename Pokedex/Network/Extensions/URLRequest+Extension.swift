//
//  URLRequest+Extension.swift
//  Pokedex
//
//  Created by rafaela.lourenco on 30/11/22.
//

import Foundation

extension URLRequest {
    static func pokemonGraphQL(body: Data?) -> URLRequest? {
        guard
            let url = URL(string: Constants.Url.Pokemon),
            let body = body
        else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = Constants.HttpMethod.Post
        request.httpBody = body
        request.addValue(
            Constants.Parameters.ContentType.value,
            forHTTPHeaderField: Constants.Parameters.ContentType.field)
        request.addValue(
            Constants.Parameters.XMethodUsed.value,
            forHTTPHeaderField: Constants.Parameters.XMethodUsed.field)
        
        return request
    }
}
