//
//  PokemonDetailsViewController.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 7.11.22.
//

import UIKit

final class PokemonDetailsViewController: UIViewController {
    
    var presenter: PokemonDetailsPresenterProtocol?
    let controllerView = PokemonDetailsView()
    
    override func loadView() {
        super.loadView()
        self.view = controllerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadPokemonDetails()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder: NSCoder) {
        self.init()
    }
}
