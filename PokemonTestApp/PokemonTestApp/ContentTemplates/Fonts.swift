//
//  Fonts.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import UIKit

enum Fonts {
    enum PokemonListCell {
        static let pokemonName = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }
    
    enum PokemonDetailsView {
        static let pokemonName = UIFont.systemFont(ofSize: 20, weight: .bold)
        static let pokemonId = UIFont.systemFont(ofSize: 16, weight: .regular)
        static let pokemonDetails = UIFont.systemFont(ofSize: 18, weight: .semibold)
        static let typeLabel = UIFont.systemFont(ofSize: 14, weight: .semibold)
    }
    
    enum CustomToast {
        static let label = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
}
