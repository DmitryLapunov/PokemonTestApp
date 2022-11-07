//
//  Colors.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import UIKit

struct Colors {
    struct PokemonListCell {
        public static let pokemonName = UIColor.black
        public static let chevron = UIColor.black
        public static let cellBackground = UIColor.systemGray5
        public static let cellBorder = UIColor.systemGray3.cgColor
        public static let cellShadow = UIColor.black.cgColor
    }
    
    struct PokemonDetailsView {
        public static let infoViewBackground = UIColor.systemGray5
        public static let imageViewBackground = UIColor.white
        public static let imageViewTint = UIColor.black
        public static let controllerViewBackground = UIColor.white
        public static let viewBorder = UIColor.systemGray3.cgColor
        public static let viewShadow = UIColor.black.cgColor
        public static let pokemonName = UIColor.black
        public static let pokemonDetails = UIColor.black
    }
    
    struct NavigationBar {
        public static let background = UIColor(red: 239/255, green: 83/255, blue: 80/255, alpha: 1.0)
        public static let tint = UIColor.white
    }
}
