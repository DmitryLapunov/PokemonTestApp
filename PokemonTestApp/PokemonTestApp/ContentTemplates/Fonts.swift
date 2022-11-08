//
//  Fonts.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import UIKit

struct Fonts {
    struct PokemonListCell {
        public static let pokemonName = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    
    struct PokemonDetailsView {
        public static let pokemonName = UIFont.systemFont(ofSize: 20, weight: .bold)
        public static let pokemonId = UIFont.systemFont(ofSize: 16, weight: .regular)
        public static let pokemonDetails = UIFont.systemFont(ofSize: 18, weight: .semibold)
    }
}
