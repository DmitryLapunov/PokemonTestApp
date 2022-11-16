//
//  PokemonDetailsBuilder.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 7.11.22.
//

import Foundation

final class PokemonDetailsBuilder {
    func build(pokemonDetails: PokemonDetailsStructure) -> PokemonDetailsViewController {
        let view = PokemonDetailsViewController()
        let presenter = PokemonDetailsPresenter(view: view, pokemonDetails: pokemonDetails)
        view.presenter = presenter
        return view
    }
}
