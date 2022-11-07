//
//  Pokemon.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import Foundation

struct Pokemons: Decodable {
    let count: Int
    var next: String?
    var previous: String?
    let results: [Pokemon]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }
}

struct Pokemon: Decodable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}

extension Pokemon {
    var id: String {
        var pokemonId = ""
        let urlContracted = UrlFormatter.getPathLastComponent(url: url)
        if let urlContracted = urlContracted {
            pokemonId = urlContracted
        }
        return pokemonId
    }
    
    var displayName: String {
        return name.formatNetworkOutput()
    }
}
