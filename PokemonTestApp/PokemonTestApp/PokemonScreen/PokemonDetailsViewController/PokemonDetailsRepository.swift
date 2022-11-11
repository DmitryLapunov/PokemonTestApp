//
//  PokemonDetailsRepository.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 7.11.22.
//

import Foundation

typealias PokemonDetailsHandler = (Result<PokemonDetailsStructure, Error>) -> Void

protocol PokemonDetailsRepositoryProtocol: AnyObject {
    func loadPokemonDetails(pokemonId: String, completion: @escaping PokemonDetailsHandler)
}

final class PokemonDetailsRepository: PokemonDetailsRepositoryProtocol {
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func loadPokemonDetails(pokemonId: String, completion: @escaping PokemonDetailsHandler) {
        preparePokemonDetailsRequest(pokemonId: pokemonId) { result in
            switch result {
            case .success(let pokemonDetails):
                let pokemonDetailsStructure = PokemonDetailsStructure(pokemonDetails: pokemonDetails)
                completion(.success(pokemonDetailsStructure))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func preparePokemonDetailsRequest(pokemonId: String, handler: @escaping (Result<PokemonDetailsModel, Error>) -> Void) {
        let endpoint = PokemonDetailsEndpoint(pokemonId: pokemonId)
        networkManager.sendRequest(endpoint: endpoint.setEndpoint(), then: handler)
    }
}
