//
//  PokemonListPresenter.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import Foundation

protocol PokemonListPresenterProtocol: AnyObject {
    func loadPokemonData()
    func reloadPokemonData()
    func loadPokemonDetails(pokemonId: String)
}

final class PokemonListPresenter: PokemonListPresenterProtocol {
    
    weak var view: PokemonListViewProtocol?
    private let repository: PokemonListRepositoryProtocol
    private let alertManager = AlertManager()
    private var nextPagePath = ""
    private var page = 0
    private var totalPages = 0
    private var isLoadingContent = false
    
    init(view: PokemonListViewProtocol, repository: PokemonListRepositoryProtocol = PokemonListRepository()) {
        self.view = view
        self.repository = repository
    }
    
    func loadPokemonData() {
        guard !isLoadingContent else { return }
        if page != 0 {
            guard page < totalPages else {
                return
            }
        }
        
        isLoadingContent = true
        repository.loadPokemons(nextPagePath: nextPagePath) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let pokemonData):
                self.totalPages = Int(pokemonData.count / 20) + 1
                self.view?.stopRefreshing()
                if self.page == 0 {
                    self.view?.presentPokemonData(pokemons: pokemonData.pokemons)
                    self.isLoadingContent = false
                } else {
                    self.view?.continueLoadingData(pokemons: pokemonData.pokemons)
                    self.isLoadingContent = false
                }
                if !pokemonData.next.isEmpty {
                    self.nextPagePath = pokemonData.next
                }
                self.page += 1
            case .failure(let error):
                self.view?.stopRefreshing()
                self.alertManager.createAlert(message: error.localizedDescription)
            }
        }
    }
    
    func reloadPokemonData() {
        nextPagePath = ""
        page = 0
        totalPages = 0
        isLoadingContent = false
        repository.wipeCachedPokemons()
        view?.wipeOutdatedPokemonData()
        loadPokemonData()
    }
    
    func loadPokemonDetails(pokemonId: String) {
        repository.loadPokemonDetails(pokemonId: pokemonId) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let pokemonDetails):
                self.view?.presentPokemonDetails(pokemonDetails: pokemonDetails)
            case .failure(let error):
                self.alertManager.createAlert(message: error.localizedDescription)
            }
        }
    }
}
