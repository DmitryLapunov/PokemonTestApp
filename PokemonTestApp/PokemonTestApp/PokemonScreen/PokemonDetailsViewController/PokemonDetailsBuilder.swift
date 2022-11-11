//
//  PokemonDetailsBuilder.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 7.11.22.
//

import Foundation

final class PokemonDetailsBuilder {
    func build(pokemonId: String) -> PokemonDetailsViewController {
        let view = PokemonDetailsViewController()
        let presenter = PokemonDetailsPresenter(view: view, pokemonId: pokemonId)
        view.presenter = presenter
        return view
    }
}
