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
    }
    
    enum BasicContent {
        static let dataCategory = "Pokemon"
        static let unexpectedError = "An unexpected error occured"
    }
    
    enum Networking {
        static let pokemonApiUrl = "https://pokeapi.co/api/v2/pokemon"
    }
}
