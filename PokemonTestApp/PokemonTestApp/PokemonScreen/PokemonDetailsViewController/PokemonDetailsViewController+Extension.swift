//
//  PokemonDetailsViewController+Extension.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 7.11.22.
//

import Foundation

protocol PokemonDetailsViewProtocol: AnyObject {
    func presentPokemonDetails(pokemonDetailsStructure: PokemonDetailsStructure)
}

extension PokemonDetailsViewController: PokemonDetailsViewProtocol {
    func presentPokemonDetails(pokemonDetailsStructure: PokemonDetailsStructure) {
        controllerView.setupView(pokemonDetailsStructure: pokemonDetailsStructure)
        controllerView.setNeedsDisplay()
    }
}
