//
//  PokemonDetails.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 7.11.22.
//

import Foundation

struct PokemonDetails: Decodable {
    let id: Int
    let name: String
    let sprites: PokemonSprites
    let types: [PokemonTypeDetails]
    let height: Int
    let weight: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case sprites
        case types
        case height
        case weight
    }
}

struct PokemonSprites: Decodable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct PokemonTypeDetails: Decodable {
    let type: PokemonType
    
    enum CodingKeys: String, CodingKey {
        case type
    }
}

struct PokemonType: Decodable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}

extension PokemonDetails {
    var displayName: String {
        return name.formatNetworkOutput()
    }
    
    var pokemonImageUrl: String {
        return sprites.frontDefault
    }
    
    var heightInCm: Int {
        return height * 10
    }
    
    var weightInKg: Double {
        return Double(weight / 10)
    }
    
    var typesArray: [String] {
        return types.map { $0.type.name }
    }
}
