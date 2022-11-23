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
    
    // MARK: - Class properties
    
    private let networkManager: NetworkManagerProtocol
    private let pokemonCoreDataProvider: PokemonListCoreDataProtocol
    private let pokemonDetailsCoreDataProvider: PokemonDetailsCoreDataProtocol
    private let dataCategory: String = Contents.BasicContent.dataCategory
    private var pokemonsCount: Int?
    private var next: String?
    private let alertManager = AlertManager()
    
    // MARK: - Init method
    
    init(networkManager: NetworkManagerProtocol = NetworkManager(),
         pokemonCoreDataProvider: PokemonListCoreDataProtocol = PokemonListCoreData(),
         pokemonDetailsCoreDataProvider: PokemonDetailsCoreDataProtocol = PokemonDetailsCoreData()) {
        self.networkManager = networkManager
        self.pokemonCoreDataProvider = pokemonCoreDataProvider
        self.pokemonDetailsCoreDataProvider = pokemonDetailsCoreDataProvider
    }
    
    // MARK: - Methods to fetch general Pokemon data to create lists
    
    func loadPokemons(nextPagePath: String, completion: @escaping PokemonListHandler) {
        if let pokemonsCount = pokemonsCount, let next = next, nextPagePath.isEmpty {
            let predicate = NSPredicate(format: "dataCategory = %@", dataCategory)
            let result = pokemonCoreDataProvider.getPokemon(predicate: predicate)
            switch result {
            case .success(let fetchedPokemons):
                let pokemons = PokemonListCellStructures(pokemons: fetchedPokemons,
                                                         count: pokemonsCount,
                                                         next: next)
                completion(.success(pokemons))
            case .failure(let error):
                alertManager.createAlert(message: error.localizedDescription)
            }
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
        var isCachingSuccessful = true
        pokemons.forEach {
            if isCachingSuccessful {
                let result = pokemonCoreDataProvider.savePokemon(pokemon: $0, dataCategory: dataCategory)
                switch result {
                case .success(let response):
                    isCachingSuccessful = response
                case .failure(let error):
                    isCachingSuccessful = false
                    alertManager.createAlert(message: error.localizedDescription)
                }
            }
        }
    }
    
    func wipeCachedPokemons() {
        let predicate = NSPredicate(format: "dataCategory = %@", dataCategory)
        let result = pokemonCoreDataProvider.deletePokemon(predicate: predicate)
        switch result {
        case .success(_):
            ()
        case .failure(let error):
            alertManager.createAlert(message: error.localizedDescription)
        }
    }
    
    // MARK: - Methods to fetch detailed data on a particular Pokemon
    
    func loadPokemonDetails(pokemonId: String, completion: @escaping PokemonDetailsHandler) {
        if let id = Int(pokemonId) {
            let predicate = NSPredicate(format: "pokemonId = %i", id)
            let result = pokemonDetailsCoreDataProvider.getPokemonDetails(predicate: predicate)
            switch result {
            case .success(let pokemonDetails):
                completion(.success(pokemonDetails))
            case .failure(_):
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
        } else {
            alertManager.createAlert(message: Contents.BasicContent.unexpectedError)
        }
    }
    
    private func preparePokemonDetailsRequest(pokemonId: String, handler: @escaping (Result<PokemonDetailsModel, Error>) -> Void) {
        let endpoint = PokemonDetailsEndpoint(pokemonId: pokemonId)
        networkManager.sendRequest(endpoint: endpoint.setEndpoint(), then: handler)
    }
    
    private func savePokemonDetails(details: PokemonDetailsStructure) {
        let result = pokemonDetailsCoreDataProvider.savePokemonDetails(details: details)
        switch result {
        case .success(_):
            ()
        case .failure(let error):
            alertManager.createAlert(message: error.localizedDescription)
        }
    }
}
