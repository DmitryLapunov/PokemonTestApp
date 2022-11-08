//
//  Colors.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import UIKit

struct Colors {
    struct PokemonListCell {
        public static let pokemonName = UIColor(red: 29/255, green: 44/255, blue: 94/255, alpha: 1.0)
        public static let chevron = UIColor(red: 29/255, green: 44/255, blue: 94/255, alpha: 1.0)
        public static let cellBackground = UIColor.systemGray6
        public static let cellBorder = UIColor.systemGray5.cgColor
        public static let cellShadow = UIColor.black.cgColor
    }
    
    struct PokemonDetailsView {
        public static let infoViewBackground = UIColor.systemGray6
        public static let imageViewBackground = UIColor.white
        public static let imageViewTint = UIColor.black
        public static let controllerViewBackground = UIColor.white
        public static let viewBorder = UIColor.systemGray5.cgColor
        public static let viewShadow = UIColor.black.cgColor
        public static let pokemonName = UIColor(red: 29/255, green: 44/255, blue: 94/255, alpha: 1.0)
        public static let pokemonId = UIColor.systemGray3
        public static let pokemonDetails = UIColor(red: 29/255, green: 44/255, blue: 94/255, alpha: 1.0)
        public static let icon = UIColor(red: 29/255, green: 44/255, blue: 94/255, alpha: 1.0)
    }
    
    struct NavigationBar {
        public static let background = UIColor(red: 239/255, green: 83/255, blue: 80/255, alpha: 1.0)
        public static let tint = UIColor.white
    }
    
    struct PokemonOfficialTypes {
        public static let normal = UIColor(red: 144/255, green: 153/255, blue: 161/255, alpha: 1.0)
        public static let flying = UIColor(red: 146/255, green: 170/255, blue: 222/255, alpha: 1.0)
        public static let fire = UIColor(red: 255/255, green: 156/255, blue: 84/255, alpha: 1.0)
        public static let psychic = UIColor(red: 249/255, green: 113/255, blue: 118/255, alpha: 1.0)
        public static let water = UIColor(red: 77/255, green: 144/255, blue: 213/255, alpha: 1.0)
        public static let bug = UIColor(red: 144/255, green: 193/255, blue: 44/255, alpha: 1.0)
        public static let grass = UIColor(red: 99/255, green: 187/255, blue: 91/255, alpha: 1.0)
        public static let rock = UIColor(red: 199/255, green: 183/255, blue: 139/255, alpha: 1.0)
        public static let electric = UIColor(red: 243/255, green: 210/255, blue: 59/255, alpha: 1.0)
        public static let ghost = UIColor(red: 82/255, green: 105/255, blue: 172/255, alpha: 1.0)
        public static let ice = UIColor(red: 116/255, green: 206/255, blue: 192/255, alpha: 1.0)
        public static let dark = UIColor(red: 90/255, green: 83/255, blue: 102/255, alpha: 1.0)
        public static let fighting = UIColor(red: 206/255, green: 64/255, blue: 105/255, alpha: 1.0)
        public static let dragon = UIColor(red: 9/255, green: 109/255, blue: 196/255, alpha: 1.0)
        public static let poison = UIColor(red: 171/255, green: 106/255, blue: 200/255, alpha: 1.0)
        public static let steel = UIColor(red: 90/255, green: 142/255, blue: 161/255, alpha: 1.0)
        public static let ground = UIColor(red: 217/255, green: 119/255, blue: 70/255, alpha: 1.0)
        public static let fairy = UIColor(red: 236/255, green: 143/255, blue: 230/255, alpha: 1.0)
    }
    
    struct CustomToast {
        public static let error = UIColor.red
        public static let lightError = UIColor(red: 255/255, green: 223/255, blue: 229/255, alpha: 1.0)
        public static let white = UIColor.white
    }
}
