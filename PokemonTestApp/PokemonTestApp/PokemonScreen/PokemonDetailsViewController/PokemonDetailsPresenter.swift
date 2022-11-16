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
    private let pokemonDetails: PokemonDetailsStructure
    
    init(view: PokemonDetailsViewProtocol,
         pokemonDetails: PokemonDetailsStructure) {
        self.view = view
        self.pokemonDetails = pokemonDetails
    }
    
    func loadPokemonDetails() {
        view?.presentPokemonDetails(pokemonDetailsStructure: pokemonDetails)
    }
}
