//
//  PokemonListCoreData.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 22.11.22.
//

import Foundation

protocol PokemonListCoreDataProtocol: AnyObject {
    func getPokemon(predicate: NSPredicate?) -> Result<[PokemonListCellStructure], Error>
    func savePokemon(pokemon: PokemonModel, dataCategory: String) -> ResultBoolError
    func deletePokemon(predicate: NSPredicate?) -> ResultBoolError
}

final class PokemonListCoreData: PokemonListCoreDataProtocol {
    private let coreDataProvider: CoreDataProvider<CachedPokemonListing>
    
    init() {
        self.coreDataProvider = CoreDataProvider<CachedPokemonListing>()
    }
    
    func getPokemon(predicate: NSPredicate?) -> Result<[PokemonListCellStructure], Error> {
        let result = coreDataProvider.readCache(predicate: predicate)
        switch result {
        case .success(let cachedPokemonArray):
            let pokemonArray = cachedPokemonArray.map({ PokemonListCellStructure(pokemonCache: $0) })
            return .success(pokemonArray)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func savePokemon(pokemon: PokemonModel, dataCategory: String) -> ResultBoolError {
        let result = coreDataProvider.saveCache()
        switch result {
        case .success(let cachedPokemon):
            cachedPokemon.name = pokemon.name
            cachedPokemon.url = pokemon.url
            cachedPokemon.dataCategory = dataCategory
            return .success(true)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func deletePokemon(predicate: NSPredicate?) -> ResultBoolError {
        let result = coreDataProvider.deleteAllCache(predicate: predicate)
        switch result {
        case .success(let response):
            return .success(response)
        case .failure(let error):
            return .failure(error)
        }
    }
}

