//
//  PokemonListPresenter.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import Foundation

protocol PokemonListPresenterProtocol: AnyObject {
    func loadPokemonData()
}

class PokemonListPresenter: PokemonListPresenterProtocol {
    
    weak var view: PokemonListViewProtocol?
    private let repository: PokemonListRepositoryProtocol
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
                print(error.localizedDescription)
            }
        }
    }
}
