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
    
    // MARK: - Class properties
    
    weak var view: PokemonDetailsViewProtocol?
    private let pokemonDetails: PokemonDetailsStructure
    
    // MARK: - Init method
    
    init(view: PokemonDetailsViewProtocol,
         pokemonDetails: PokemonDetailsStructure) {
        self.view = view
        self.pokemonDetails = pokemonDetails
    }
    
    // MARK: - Presenter data-handling methods
    
    func loadPokemonDetails() {
        view?.presentPokemonDetails(pokemonDetailsStructure: pokemonDetails)
    }
}
