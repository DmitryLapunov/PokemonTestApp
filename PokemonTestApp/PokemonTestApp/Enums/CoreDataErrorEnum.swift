//
//  CoreDataErrorEnum.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 23.11.22.
//

import Foundation

enum CoreDataError: Error {
    case invalidManagedObjectType
    case unableToClearCache
    
    var description: String {
        switch self {
        case .invalidManagedObjectType:
            return "Invalid managed object type"
        case .unableToClearCache:
            return "Unable to clear cache"
        }
    }
}
