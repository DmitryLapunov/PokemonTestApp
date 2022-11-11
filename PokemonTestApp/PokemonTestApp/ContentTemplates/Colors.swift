//
//  Colors.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import UIKit

enum Colors {
    enum PokemonListCell {
        static let pokemonName = UIColor(red: 29/255, green: 44/255, blue: 94/255, alpha: 1.0)
        static let chevron = UIColor(red: 29/255, green: 44/255, blue: 94/255, alpha: 1.0)
        static let cellBackground = UIColor.systemGray6
        static let cellBorder = UIColor.systemGray5.cgColor
        static let cellShadow = UIColor.black.cgColor
    }
    
    enum PokemonDetailsView {
        static let infoViewBackground = UIColor.systemGray6
        static let imageViewBackground = UIColor.white
        static let imageViewTint = UIColor.black
        static let controllerViewBackground = UIColor.white
        static let viewBorder = UIColor.systemGray5.cgColor
        static let viewShadow = UIColor.black.cgColor
        static let pokemonName = UIColor(red: 29/255, green: 44/255, blue: 94/255, alpha: 1.0)
        static let pokemonId = UIColor.systemGray3
        static let pokemonDetails = UIColor(red: 29/255, green: 44/255, blue: 94/255, alpha: 1.0)
        static let icon = UIColor(red: 29/255, green: 44/255, blue: 94/255, alpha: 1.0)
        static let typeLabel = UIColor.white
    }
    
    enum NavigationBar {
        static let background = UIColor(red: 239/255, green: 83/255, blue: 80/255, alpha: 1.0)
        static let tint = UIColor.white
    }
    
    enum PokemonOfficialTypes {
        static let normal = UIColor(red: 144/255, green: 153/255, blue: 161/255, alpha: 1.0)
        static let flying = UIColor(red: 146/255, green: 170/255, blue: 222/255, alpha: 1.0)
        static let fire = UIColor(red: 255/255, green: 156/255, blue: 84/255, alpha: 1.0)
        static let psychic = UIColor(red: 249/255, green: 113/255, blue: 118/255, alpha: 1.0)
        static let water = UIColor(red: 77/255, green: 144/255, blue: 213/255, alpha: 1.0)
        static let bug = UIColor(red: 144/255, green: 193/255, blue: 44/255, alpha: 1.0)
        static let grass = UIColor(red: 99/255, green: 187/255, blue: 91/255, alpha: 1.0)
        static let rock = UIColor(red: 199/255, green: 183/255, blue: 139/255, alpha: 1.0)
        static let electric = UIColor(red: 243/255, green: 210/255, blue: 59/255, alpha: 1.0)
        static let ghost = UIColor(red: 82/255, green: 105/255, blue: 172/255, alpha: 1.0)
        static let ice = UIColor(red: 116/255, green: 206/255, blue: 192/255, alpha: 1.0)
        static let dark = UIColor(red: 90/255, green: 83/255, blue: 102/255, alpha: 1.0)
        static let fighting = UIColor(red: 206/255, green: 64/255, blue: 105/255, alpha: 1.0)
        static let dragon = UIColor(red: 9/255, green: 109/255, blue: 196/255, alpha: 1.0)
        static let poison = UIColor(red: 171/255, green: 106/255, blue: 200/255, alpha: 1.0)
        static let steel = UIColor(red: 90/255, green: 142/255, blue: 161/255, alpha: 1.0)
        static let ground = UIColor(red: 217/255, green: 119/255, blue: 70/255, alpha: 1.0)
        static let fairy = UIColor(red: 236/255, green: 143/255, blue: 230/255, alpha: 1.0)
    }
    
    enum CustomToast {
        static let error = UIColor.red
        static let lightError = UIColor(red: 255/255, green: 223/255, blue: 229/255, alpha: 1.0)
        static let white = UIColor.white
    }
}
