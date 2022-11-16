//
//  PokemonListRepository.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import Foundation

typealias PokemonListHandler = (Result<PokemonListCellStructures, Error>) -> Void
typealias PokemonDetailsHandler = (Result<PokemonDetailsStructure, Error>) -> Void

protocol PokemonListRepositoryProtocol: AnyObject {
    func loadPokemons(nextPagePath: String, completion: @escaping PokemonListHandler)
    func loadPokemonDetails(pokemonId: String, completion: @escaping PokemonDetailsHandler)
    func wipeCachedPokemons()
}

final class PokemonListRepository: PokemonListRepositoryProtocol {
    private let networkManager: NetworkManagerProtocol
    private let coreDataManager: CoreDataManagerProtocol
    private let dataCategory: String = Contents.BasicContent.dataCategory
    private var pokemonsCount: Int?
    private var next: String?
    
    init(networkManager: NetworkManagerProtocol = NetworkManager(),
         coreDataManager: CoreDataManagerProtocol = CoreDataManager()) {
        self.networkManager = networkManager
        self.coreDataManager = coreDataManager
    }
    
    // MARK: - Methods to fetch general Pokemon data to create lists
    
    func loadPokemons(nextPagePath: String, completion: @escaping PokemonListHandler) {
        if let pokemonsCount = pokemonsCount, let next = next, nextPagePath.isEmpty {
            let fetchedPokemons = coreDataManager.readPokemonData(dataCategory: dataCategory)
            let pokemons = PokemonListCellStructures(pokemons: fetchedPokemons.map({ PokemonListCellStructure(pokemon: $0) }),
                                                     count: pokemonsCount,
                                                     next: next)
            completion(.success(pokemons))
        }
        preparePokemonListRequest(nextPagePath: nextPagePath) { result in
            switch result {
            case .success(let pokemonsModel):
                self.pokemonsCount = pokemonsModel.count
                self.next = pokemonsModel.next
                self.updateCachedPokemons(dataCategory: self.dataCategory, pokemons: pokemonsModel.results)
                let pokemons = PokemonListCellStructures(pokemons: pokemonsModel)
                completion(.success(pokemons))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func preparePokemonListRequest(nextPagePath: String, handler: @escaping (Result<PokemonsModel, Error>) -> Void) {
        let endpoint = PokemonListEndpoint(nextPagePath: nextPagePath)
        networkManager.sendRequest(endpoint: endpoint.setEndpoint(), then: handler)
    }
    
    private func updateCachedPokemons(dataCategory: String, pokemons: [PokemonModel]) {
        wipeCachedPokemons()
        pokemons.forEach {
            coreDataManager.savePokemonData(pokemon: $0, dataCategory: dataCategory)
        }
    }
    
    func wipeCachedPokemons() {
        coreDataManager.deletePokemonData(dataCategory: dataCategory)
    }
    
    // MARK: - Methods to fetch detailed data on a particular Pokemon
    
    func loadPokemonDetails(pokemonId: String, completion: @escaping PokemonDetailsHandler) {
        if let id = Int(pokemonId), let cachedPokemon = coreDataManager.readPokemonById(id: id) {
            completion(.success(cachedPokemon))
        } else {
            preparePokemonDetailsRequest(pokemonId: pokemonId) { result in
                switch result {
                case .success(let pokemonDetails):
                    let pokemonDetailsStructure = PokemonDetailsStructure(pokemonDetails: pokemonDetails)
                    self.savePokemonDetails(details: pokemonDetailsStructure)
                    completion(.success(pokemonDetailsStructure))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    private func preparePokemonDetailsRequest(pokemonId: String, handler: @escaping (Result<PokemonDetailsModel, Error>) -> Void) {
        let endpoint = PokemonDetailsEndpoint(pokemonId: pokemonId)
        networkManager.sendRequest(endpoint: endpoint.setEndpoint(), then: handler)
    }
    
    private func savePokemonDetails(details: PokemonDetailsStructure) {
        coreDataManager.savePokemonDetails(details: details)
    }
}
