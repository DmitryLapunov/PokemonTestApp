//
//  Contents.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 8.11.22.
//

import Foundation

enum Contents {
    enum CoreData {
        static let persistentContainer = "PokemonTestApp"
        static let pokemonEntity = "CachedPokemonListing"
        static let pokemonDetailsEntity = "CachedPokemonDetailsListing"
    }
    
    enum BasicContent {
        static let dataCategory = "Pokemon"
    }
    
    enum Networking {
        static let pokemonApiUrl = "https://pokeapi.co/api/v2/pokemon"
    }
}
