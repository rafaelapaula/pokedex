//
//  State.swift
//  Pokedex
//
//  Created by rafaela.lourenco on 30/11/22.
//

import Foundation

enum State {
    case loading
    case success
    case error
    
    mutating func loading() {
        self = .loading
    }
    
    mutating func error() {
        self = .error
    }
    
    mutating func success() {
        self = .success
    }
}
