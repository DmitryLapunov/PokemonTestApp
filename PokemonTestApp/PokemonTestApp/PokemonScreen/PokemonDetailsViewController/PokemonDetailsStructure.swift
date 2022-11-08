//
//  PokemonDetailsStructure.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 7.11.22.
//

import Foundation

struct PokemonDetailsStructure {
    let id: Int
    let name: String
    let imageUrl: String
    let height: Int
    let weight: Double
    let types: [String]
    
    init(pokemonDetails: PokemonDetails) {
        self.id = pokemonDetails.id
        self.name = pokemonDetails.displayName
        self.imageUrl = pokemonDetails.pokemonImageUrl
        self.height = pokemonDetails.heightInCm
        self.weight = pokemonDetails.weightInKg
        self.types = pokemonDetails.typesArray
    }
}
