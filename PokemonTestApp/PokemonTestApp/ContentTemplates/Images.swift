//
//  Images.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import UIKit

enum Images {
    enum PokemonListCell {
        static let chevronRight = UIImage(systemName: "chevron.right")
        static let pokeballOutline = UIImage(named: "pokeball_outline")
        static let pokeballIcon = UIImage(named: "pokeball_icon")
    }
    
    enum PokemonDetailsView {
        static let placeholderImage = UIImage(systemName: "questionmark")
        static let scalemass = UIImage(systemName: "scalemass")
        static let pencilAndRuler = UIImage(systemName: "pencil.and.ruler")
    }
    
    enum CustomToast {
        static let error = UIImage(systemName: "xmark")
    }
}
