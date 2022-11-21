//
//  PokemonListViewController.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import UIKit

final class PokemonListViewController: UIViewController {
    
    // MARK: - Class properties
    
    var presenter: PokemonListPresenterProtocol?
    let controllerView = PokemonListView()
    var pokemons: [PokemonListCellStructure] = []
    
    // MARK: - UIViewController events
    
    override func loadView() {
        super.loadView()
        self.view = controllerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.loadPokemonData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.handleCollectionViewInteraction(action: .enable)
    }
    
    // MARK: - Init methods
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder: NSCoder) {
        self.init()
    }
    
    // MARK: - UIViewController setup
    
    private func setupView() {
        controllerView.collectionView.delegate = self
        controllerView.collectionView.dataSource = self
        controllerView.pokemonListViewDelegate = self
    }
}
