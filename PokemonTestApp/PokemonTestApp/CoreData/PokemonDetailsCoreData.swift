//
//  PokemonDetailsCoreData.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 23.11.22.
//

import Foundation
import CoreData

protocol PokemonDetailsCoreDataProtocol: AnyObject {
    func getPokemonDetails(predicate: NSPredicate?) -> Result<PokemonDetailsStructure, Error>
    func savePokemonDetails(details: PokemonDetailsStructure) -> ResultBoolError
}

final class PokemonDetailsCoreData: PokemonDetailsCoreDataProtocol {
    private let coreDataProvider: CoreDataProvider<CachedPokemonDetailsListing>
    
    init() {
        self.coreDataProvider = CoreDataProvider<CachedPokemonDetailsListing>()
    }
    
    func getPokemonDetails(predicate: NSPredicate?) -> Result<PokemonDetailsStructure, Error> {
        let result = coreDataProvider.readCache(predicate: predicate)
        switch result {
        case .success(let detailsArray):
            if let pokemonCachedDetails = detailsArray.first {
                let pokemonDetails = PokemonDetailsStructure(detailsCache: pokemonCachedDetails)
                return .success(pokemonDetails)
            } else {
                return .failure(CoreDataError.invalidManagedObjectType)
            }
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func savePokemonDetails(details: PokemonDetailsStructure) -> ResultBoolError {
        let result = coreDataProvider.saveCache()
        switch result {
        case .success(let pokemonCachedDetails):
            pokemonCachedDetails.pokemonId = Int64(truncatingIfNeeded: details.id)
            pokemonCachedDetails.name = details.name
            pokemonCachedDetails.imageUrl = details.imageUrl
            pokemonCachedDetails.height = Int64(truncatingIfNeeded: details.height)
            pokemonCachedDetails.weight = details.weight
            pokemonCachedDetails.types = details.types
            return .success(true)
        case .failure(let error):
            return .failure(error)
        }
    }
}
