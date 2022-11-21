//
//  PokemonListView.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import UIKit
import Then
import SnapKit

final class PokemonListView: UIView {
    
    // MARK: - Class properties
    
    weak var pokemonListViewDelegate: PokemonListViewDelegate?
    
    // MARK: - UI elements
    
    private lazy var layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init().then {
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = Constants.CollectionView.halfSpacing
    }
    
    private lazy var refreshControl = UIRefreshControl().then {
        $0.addTarget(self, action: #selector(refreshCollectionView), for: .valueChanged)
        $0.tintColor = Colors.PokemonListView.refreshControlTint
    }
    
    lazy var collectionView: UICollectionView = UICollectionView(frame: CGRect.zero,
                                                            collectionViewLayout: UICollectionViewFlowLayout.init()).then {
        $0.register(PokemonListCell.self, forCellWithReuseIdentifier: PokemonListCell.reuseIdentifier)
        $0.showsVerticalScrollIndicator = false
        $0.contentInset = UIEdgeInsets(top: CGFloat(Constants.TopConstraint.half),
                                       left: CGFloat(Constants.LeadingConstraint.basic),
                                       bottom: CGFloat(Constants.BottomConstraint.half),
                                       right: CGFloat(Constants.TrailingConstraint.basic))
        $0.backgroundColor = Colors.PokemonListView.collectionViewBackground
        $0.setCollectionViewLayout(layout, animated: true)
        $0.refreshControl = refreshControl
    }
    
    // MARK: - Init methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - UIView setup methods
    
    private func setupSubviews() {
        addSubview(collectionView)
    }
    
    private func setConstraints() {
        collectionView.snp.updateConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    @objc private func refreshCollectionView() {
        pokemonListViewDelegate?.refreshPokemonData()
    }
    
    func stopRefreshing() {
        refreshControl.endRefreshing()
    }
}
