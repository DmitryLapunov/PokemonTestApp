//
//  PokemonDetails.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 7.11.22.
//

import Foundation

struct PokemonDetailsModel: Decodable {
    let id: Int
    let name: String
    let sprites: PokemonSpritesModel
    let types: [PokemonTypeDetailsModel]
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

struct PokemonSpritesModel: Decodable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct PokemonTypeDetailsModel: Decodable {
    let type: PokemonTypeModel
    
    enum CodingKeys: String, CodingKey {
        case type
    }
}

struct PokemonTypeModel: Decodable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}

extension PokemonDetailsModel {
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
