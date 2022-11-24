//
//  MockPokemonListView.swift
//  PokemonTestAppTests
//
//  Created by Дмитрий Лапунов on 24.11.22.
//

import Foundation
@testable import PokemonTestApp

final class MockPokemonListView: PokemonListViewProtocol {
    var isPresenterCallReceived: Bool = false
    var pokemons: [PokemonListCellStructure] = []
    
    func presentPokemonData(pokemons: [PokemonTestApp.PokemonListCellStructure]) {
        // Initial method to retrieve Pokemon data.
        isPresenterCallReceived = true
        self.pokemons = pokemons
    }
    
    func continueLoadingData(pokemons: [PokemonTestApp.PokemonListCellStructure]) {
        // Sending another network request to handle pagination.
    }
    
    func wipeOutdatedPokemonData() {
        // Clearing any local properties used to temporarily store received data.
    }
    
    func stopRefreshing() {
        // Calling the RefreshControl to stop refreshing.
    }
    
    func presentPokemonDetails(pokemonDetails: PokemonTestApp.PokemonDetailsStructure) {
        // Initial method to retrieve detailed Pokemon data.
    }
    
    func handleCollectionViewInteraction(action: PokemonTestApp.CollectionViewInteraction) {
        // Locking CollectionView user interaction during a network request to avoid accidental cell taps.
    }
}
