//
//  PokemonListCell.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import UIKit
import Then
import SnapKit

final class PokemonListCell: UICollectionViewCell {
    
    // MARK: - Class properties
    
    static let reuseIdentifier = "PokemonListCell"
    
    // MARK: - UI elements
    
    private lazy var cellBackgroundView = UIView().then {
        $0.clipsToBounds = true
        $0.backgroundColor = Colors.PokemonListCell.cellBackground
    }
    
    private lazy var pokeballOutlineImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = Images.PokemonListCell.pokeballOutline
        $0.alpha = Constants.View.transparentAlpha
        $0.clipsToBounds = true
    }
    
    private lazy var pokeballIconImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = Images.PokemonListCell.pokeballIcon
    }
    
    private lazy var pokemonLabel = UILabel().then {
        $0.font = Fonts.PokemonListCell.pokemonName
        $0.textColor = Colors.PokemonListCell.pokemonName
    }
    
    private lazy var arrowImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.tintColor = Colors.PokemonListCell.chevron
        $0.image = Images.PokemonListCell.chevronRight
    }
    
    // MARK: - Init methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - UICollectionViewCell setup methods
    
    private func setupView() {
        self.contentView.layer.cornerRadius = Constants.Corner.basicRadius
        self.contentView.layer.borderWidth = Constants.Border.defaultWidth
        self.contentView.layer.borderColor = Colors.PokemonListCell.cellBorder
        self.contentView.layer.masksToBounds = true
        
        self.layer.shadowColor = Colors.PokemonListCell.cellShadow
        self.layer.shadowOffset = CGSize(width: Constants.Shadow.offsetX,
                                         height: Constants.Shadow.offsetY)
        self.layer.shadowRadius = Constants.Shadow.radius
        self.layer.shadowOpacity = Constants.Shadow.opacity
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds,
                                             cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    
    private func setupSubviews() {
        contentView.addSubview(cellBackgroundView)
        contentView.addSubview(pokeballOutlineImageView)
        contentView.addSubview(pokeballIconImageView)
        contentView.addSubview(pokemonLabel)
        contentView.addSubview(arrowImageView)
    }
    
    private func setConstraints() {
        cellBackgroundView.snp.updateConstraints {
            $0.edges.equalToSuperview()
        }
        
        pokeballOutlineImageView.snp.updateConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalTo(Constants.PokemonListCell.pokeballOutlineImageViewWidth)
        }
        
        pokeballIconImageView.snp.updateConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(Constants.PokemonListCell.pokeballIconImageViewWidth)
            $0.height.equalTo(Constants.PokemonListCell.pokeballIconImageViewHeight)
            $0.leading.equalToSuperview().offset(Constants.LeadingConstraint.half)
        }
        
        pokemonLabel.snp.updateConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(Constants.LeadingConstraint.double)
        }
        
        arrowImageView.snp.updateConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(Constants.PokemonListCell.arrowImageViewWidth)
            $0.height.equalTo(Constants.PokemonListCell.arrowImageViewHeight)
            $0.trailing.equalToSuperview().inset(Constants.PokemonListCell.arrowImageViewTrailing)
        }
    }
    
    func setupCell(_ object: PokemonListCellStructure) {
        pokemonLabel.text = object.name
    }
}
