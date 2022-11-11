//
//  PokemonListViewController.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import UIKit

final class PokemonListViewController: UIViewController {
    
    var presenter: PokemonListPresenterProtocol?
    let controllerView = PokemonListView()
    var pokemons: [PokemonListCellStructure] = []
    
    override func loadView() {
        super.loadView()
        self.view = controllerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.loadPokemonData()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder: NSCoder) {
        self.init()
    }
    
    private func setupView() {
        controllerView.collectionView.delegate = self
        controllerView.collectionView.dataSource = self
        controllerView.pokemonListViewDelegate = self
    }
}
