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
    
    weak var pokemonListViewDelegate: PokemonListViewDelegate?
    
    private let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init().then {
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = Constants.CollectionView.halfSpacing
    }
    
    private let refreshControl = UIRefreshControl().then {
        $0.addTarget(self, action: #selector(refreshCollectionView), for: .valueChanged)
    }
    
    lazy var collectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout).then {
        $0.register(PokemonListCell.self, forCellWithReuseIdentifier: PokemonListCell.reuseIdentifier)
        $0.showsVerticalScrollIndicator = false
        $0.contentInset = UIEdgeInsets(top: CGFloat(Constants.TopConstraint.half),
                                       left: CGFloat(Constants.LeadingConstraint.basic),
                                       bottom: CGFloat(Constants.BottomConstraint.half),
                                       right: CGFloat(Constants.TrailingConstraint.basic))
        $0.refreshControl = refreshControl
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupSubviews() {
        addSubview(collectionView)
    }
    
    private func setConstraints() {
        collectionView.snp.makeConstraints {
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
