//
//  PokemonListViewDelegate.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 8.11.22.
//

import Foundation

protocol PokemonListViewDelegate: AnyObject {
    func refreshPokemonData()
}

extension PokemonListViewController: PokemonListViewDelegate {
    func refreshPokemonData() {
        presenter.reloadPokemonData()
    }
}
