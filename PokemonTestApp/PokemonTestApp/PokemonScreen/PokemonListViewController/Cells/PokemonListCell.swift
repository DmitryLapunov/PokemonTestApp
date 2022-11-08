//
//  PokemonListCell.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import UIKit
import Then
import SnapKit

class PokemonListCell: UICollectionViewCell {
    
    static let reuseIdentifier = "PokemonListCell"
    
    private let cellBackgroundView = UIView().then {
        $0.clipsToBounds = true
        $0.backgroundColor = Colors.PokemonListCell.cellBackground
    }
    
    private let pokeballOutlineImageview = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = Images.PokemonListCell.pokeballOutline
        $0.alpha = 0.1
        $0.clipsToBounds = true
    }
    
    private let pokeballIconImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = Images.PokemonListCell.pokeballIcon
    }
    
    private let pokemonLabel = UILabel().then {
        $0.font = Fonts.PokemonListCell.pokemonName
        $0.textColor = Colors.PokemonListCell.pokemonName
    }
    
    private let arrowImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.tintColor = Colors.PokemonListCell.chevron
        $0.image = Images.PokemonListCell.chevronRight
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        self.contentView.layer.cornerRadius = 8
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = Colors.PokemonListCell.cellBorder
        self.contentView.layer.masksToBounds = true
        
        self.layer.shadowColor = Colors.PokemonListCell.cellShadow
        self.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 0.1
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    
    private func setupSubviews() {
        contentView.addSubview(cellBackgroundView)
        contentView.addSubview(pokeballOutlineImageview)
        contentView.addSubview(pokeballIconImageView)
        contentView.addSubview(pokemonLabel)
        contentView.addSubview(arrowImageView)
    }
    
    private func setConstraints() {
        cellBackgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        pokeballOutlineImageview.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(90)
        }
        
        pokeballIconImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(16)
            $0.height.equalTo(16)
            $0.leading.equalToSuperview().offset(8)
        }
        
        pokemonLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(32)
        }
        
        arrowImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(15)
            $0.height.equalTo(15)
            $0.trailing.equalToSuperview().inset(12)
        }
    }
    
    func setupCell(_ object: PokemonListCellStructure) {
        pokemonLabel.text = object.name
    }
}
