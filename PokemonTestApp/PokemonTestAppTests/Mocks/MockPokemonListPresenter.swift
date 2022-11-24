//
//  MockPokemonListPresenter.swift
//  PokemonTestAppTests
//
//  Created by Дмитрий Лапунов on 24.11.22.
//

import Foundation
@testable import PokemonTestApp

final class MockPokemonListPresenter: PokemonListPresenterProtocol {
    weak var view: PokemonListViewProtocol?
    private let repository: PokemonListRepositoryProtocol
    var pokemonsCount: Int = 0
    
    init(view: PokemonListViewProtocol, repository: PokemonListRepositoryProtocol = MockPokemonListRepository()) {
        self.view = view
        self.repository = repository
    }
    
    func loadPokemonData() {
        // A call to Presenter to start loading data via sending network requests using appropriate services.
        repository.loadPokemons(nextPagePath: "") { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let pokemonData):
                self.pokemonsCount = pokemonData.count
                self.view?.presentPokemonData(pokemons: pokemonData.pokemons)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func reloadPokemonData() {
        // Wipe all the existing local Pokemon data and resend requests.
    }
    
    func loadPokemonDetails(pokemonId: String) {
        // A call to Presenter to start loading specific Pokemon data via sending network requests using appropriate services.
    }
    
    func handleCollectionViewInteraction(action: PokemonTestApp.CollectionViewInteraction) {
        // Locking CollectionView user interaction during a network request to avoid accidental cell taps.
    }
}
