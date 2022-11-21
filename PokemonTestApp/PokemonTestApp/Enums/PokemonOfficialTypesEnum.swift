//
//  PokemonOfficialTypesEnum.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 8.11.22.
//

import UIKit

enum PokemonOfficialTypes: String {
    case normal
    case flying
    case fire
    case psychic
    case water
    case bug
    case grass
    case rock
    case electric
    case ghost
    case ice
    case dark
    case fighting
    case dragon
    case poison
    case steel
    case ground
    case fairy
    
    var typeColor: UIColor {
        switch self {
        case .normal:
            return Colors.PokemonOfficialTypes.normal
        case .flying:
            return Colors.PokemonOfficialTypes.flying
        case .fire:
            return Colors.PokemonOfficialTypes.fire
        case .psychic:
            return Colors.PokemonOfficialTypes.psychic
        case .water:
            return Colors.PokemonOfficialTypes.water
        case .bug:
            return Colors.PokemonOfficialTypes.bug
        case .grass:
            return Colors.PokemonOfficialTypes.grass
        case .rock:
            return Colors.PokemonOfficialTypes.rock
        case .electric:
            return Colors.PokemonOfficialTypes.electric
        case .ghost:
            return Colors.PokemonOfficialTypes.ghost
        case .ice:
            return Colors.PokemonOfficialTypes.ice
        case .dark:
            return Colors.PokemonOfficialTypes.dark
        case .fighting:
            return Colors.PokemonOfficialTypes.fighting
        case .dragon:
            return Colors.PokemonOfficialTypes.dragon
        case .poison:
            return Colors.PokemonOfficialTypes.poison
        case .steel:
            return Colors.PokemonOfficialTypes.steel
        case .ground:
            return Colors.PokemonOfficialTypes.ground
        case .fairy:
            return Colors.PokemonOfficialTypes.fairy
        }
    }
}
