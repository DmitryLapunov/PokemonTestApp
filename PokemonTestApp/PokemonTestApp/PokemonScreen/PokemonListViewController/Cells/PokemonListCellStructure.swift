//
//  PokemonListCellStructure.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import Foundation

struct PokemonListCellStructures {
    let pokemons: [PokemonListCellStructure]
    let count: Int
    let next: String
    
    init(pokemons: Pokemons) {
        self.pokemons = pokemons.results.map { PokemonListCellStructure(pokemon: $0) }
        self.count = pokemons.count
        self.next = pokemons.next ?? ""
    }
}

struct PokemonListCellStructure {
    let name: String
    let id: String
    
    init(pokemon: Pokemon) {
        self.name = pokemon.displayName
        self.id = pokemon.id
    }
}
