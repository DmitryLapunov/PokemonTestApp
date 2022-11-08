//
//  PokemonListViewController+Extension.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import Foundation

protocol PokemonListViewProtocol: AnyObject {
    func presentPokemonData(pokemons: [PokemonListCellStructure])
    func continueLoadingData(pokemons: [PokemonListCellStructure])
    func wipeOutdatedPokemonData()
    func stopRefreshing()
}

extension PokemonListViewController: PokemonListViewProtocol {
    func presentPokemonData(pokemons: [PokemonListCellStructure]) {
        self.pokemons = pokemons
        controllerView.collectionView.reloadData()
    }
    
    func continueLoadingData(pokemons: [PokemonListCellStructure]) {
        for pokemon in pokemons {
            controllerView.collectionView.performBatchUpdates {
                self.pokemons.append(pokemon)
                controllerView.collectionView.insertItems(at: [IndexPath(item: self.pokemons.count - 1, section: 0)])
            }
        }
    }
    
    func wipeOutdatedPokemonData() {
        self.pokemons = []
    }
    
    func stopRefreshing() {
        controllerView.stopRefreshing()
    }
}
