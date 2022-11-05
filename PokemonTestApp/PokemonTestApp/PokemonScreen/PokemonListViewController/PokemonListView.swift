//
//  PokemonListView.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import UIKit
import Then
import SnapKit

class PokemonListView: UIView {
    
    private let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init().then {
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = 8
    }
    
    lazy var collectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout).then {
        $0.register(PokemonListCell.self, forCellWithReuseIdentifier: PokemonListCell.reuseIdentifier)
        $0.showsVerticalScrollIndicator = false
        $0.contentInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
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
}
