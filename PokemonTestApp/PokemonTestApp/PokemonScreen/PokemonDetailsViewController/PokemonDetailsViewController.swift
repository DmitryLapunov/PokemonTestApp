//
//  PokemonDetailsViewController.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 7.11.22.
//

import UIKit

final class PokemonDetailsViewController: UIViewController {
    
    // MARK: - Class properties
    
    var presenter: PokemonDetailsPresenterProtocol?
    let controllerView = PokemonDetailsView()
    
    // MARK: - UIViewController events
    
    override func loadView() {
        super.loadView()
        self.view = controllerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadPokemonDetails()
    }
    
    // MARK: - Init methods
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder: NSCoder) {
        self.init()
    }
}
