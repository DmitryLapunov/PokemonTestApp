//
//  PokemonListViewController.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import UIKit

class PokemonListViewController: UIViewController {
    
    var presenter: PokemonListPresenterProtocol!
    var pokemons: [PokemonListCellStructure] = []
    
    var controllerView: PokemonListView {
        return (self.view as! PokemonListView)
    }
    
    override func loadView() {
        super.loadView()
        self.view = PokemonListView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.loadPokemonData()
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
    }
}
