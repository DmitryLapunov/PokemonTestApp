//
//  PokemonListBuilder.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import Foundation

final class PokemonListBuilder {
    func build() -> PokemonListViewController {
        let view = PokemonListViewController()
        let presenter = PokemonListPresenter(view: view)
        view.presenter = presenter
        return view
    }
}
