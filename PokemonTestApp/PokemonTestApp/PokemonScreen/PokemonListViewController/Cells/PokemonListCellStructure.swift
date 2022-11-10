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
    
    init(pokemons: PokemonsModel) {
        self.pokemons = pokemons.results.map { PokemonListCellStructure(pokemon: $0) }
        self.count = pokemons.count
        self.next = pokemons.next ?? ""
    }
    
    init(pokemons: [PokemonListCellStructure], count: Int, next: String) {
        self.pokemons = pokemons
        self.count = count
        self.next = next
    }
}

struct PokemonListCellStructure {
    let name: String
    let id: String
    
    init(pokemon: PokemonModel) {
        self.name = pokemon.displayName
        self.id = pokemon.id
    }
}
