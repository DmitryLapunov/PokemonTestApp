//
//  CollectionViewInteractionEnum.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 22.11.22.
//

import Foundation

enum CollectionViewInteraction {
    case enable
    case disable
    
    var interactionState: Bool {
        switch self {
        case .enable:
            return true
        case .disable:
            return false
        }
    }
}
