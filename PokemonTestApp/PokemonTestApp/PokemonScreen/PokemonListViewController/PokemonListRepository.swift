//
//  PokemonListRepository.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import Foundation

typealias PokemonListHandler = (Result<PokemonListCellStructures, Error>) -> Void

protocol PokemonListRepositoryProtocol: AnyObject {
    func loadPokemons(nextPagePath: String, completion: @escaping PokemonListHandler)
}

class PokemonListRepository: PokemonListRepositoryProtocol {
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func loadPokemons(nextPagePath: String, completion: @escaping PokemonListHandler) {
        preparePokemonListRequest(nextPagePath: nextPagePath) { result in
            switch result {
            case .success(let pokemonsModel):
                let pokemons = PokemonListCellStructures(pokemons: pokemonsModel)
                completion(.success(pokemons))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func preparePokemonListRequest(nextPagePath: String, handler: @escaping (Result<Pokemons, Error>) -> Void) {
        let endpoint = PokemonListEndpoint(nextPagePath: nextPagePath)
        networkManager.sendRequest(endpoint: endpoint.setEndpoint(), then: handler)
    }
}
