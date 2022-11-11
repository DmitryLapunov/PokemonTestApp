//
//  PokemonDetailsPresenter.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 7.11.22.
//

import Foundation

protocol PokemonDetailsPresenterProtocol: AnyObject {
    func loadPokemonDetails()
}

final class PokemonDetailsPresenter: PokemonDetailsPresenterProtocol {
    
    weak var view: PokemonDetailsViewProtocol?
    private let repository: PokemonDetailsRepositoryProtocol
    private let pokemonId: String
    
    init(view: PokemonDetailsViewProtocol,
         repository: PokemonDetailsRepositoryProtocol = PokemonDetailsRepository(),
         pokemonId: String) {
        self.view = view
        self.repository = repository
        self.pokemonId = pokemonId
    }
    
    func loadPokemonDetails() {
        repository.loadPokemonDetails(pokemonId: pokemonId) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let pokemonDetailsStructure):
                self.view?.presentPokemonDetails(pokemonDetailsStructure: pokemonDetailsStructure)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
