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
        self.backgroundColor = Colors.PokemonListCell.cellBackground
        
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
        contentView.addSubview(pokemonLabel)
        contentView.addSubview(arrowImageView)
    }
    
    private func setConstraints() {
        pokemonLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(8)
        }
        
        arrowImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(20)
            $0.height.equalTo(20)
            $0.trailing.equalToSuperview().inset(8)
        }
    }
    
    func setupCell(_ object: PokemonListCellStructure) {
        pokemonLabel.text = object.name
    }
}
