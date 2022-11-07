//
//  PokemonDetailsView.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 7.11.22.
//

import Foundation
import Then
import SnapKit
import Kingfisher

class PokemonDetailsView: UIView {
    
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    
    private let stackView = UIStackView().then {
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 0
        $0.axis = .vertical
    }
    
    private let contentView = UIView()
    
    private let headerView = UIView().then {
        $0.backgroundColor = Colors.PokemonDetailsView.infoViewBackground
        $0.addBorderAndShadow(borderColor: Colors.PokemonDetailsView.viewBorder,
                              shadowColor: Colors.PokemonDetailsView.viewShadow)
    }
    
    private let pokemonImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 25
        $0.layer.borderWidth = 1
        $0.layer.borderColor = Colors.PokemonDetailsView.viewBorder
        $0.backgroundColor = Colors.PokemonDetailsView.imageViewBackground
        $0.tintColor = Colors.PokemonDetailsView.imageViewTint
    }
    
    private let pokemonNameLabel = UILabel().then {
        $0.textAlignment = .left
        $0.numberOfLines = 1
        $0.textColor = Colors.PokemonDetailsView.pokemonName
        $0.font = Fonts.PokemonDetailsView.pokemonName
    }
    
    private let pokemonInfoView = UIView().then {
        $0.backgroundColor = Colors.PokemonDetailsView.infoViewBackground
        $0.addBorderAndShadow(borderColor: Colors.PokemonDetailsView.viewBorder,
                              shadowColor: Colors.PokemonDetailsView.viewShadow)
    }
    
    private let pokemonInfoLabel = UILabel().then {
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.textColor = Colors.PokemonDetailsView.pokemonDetails
        $0.font = Fonts.PokemonDetailsView.pokemonDetails
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors.PokemonDetailsView.controllerViewBackground
        setupSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(contentView)
        contentView.addSubview(headerView)
        headerView.addSubview(pokemonImageView)
        headerView.addSubview(pokemonNameLabel)
        contentView.addSubview(pokemonInfoView)
        pokemonInfoView.addSubview(pokemonInfoLabel)
    }
    
    private func setConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(self.snp.width)
        }
        
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(66)
        }
        
        pokemonImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(50)
            $0.height.equalTo(50)
            $0.leading.equalToSuperview().offset(8)
        }
        
        pokemonNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(pokemonImageView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(8)
        }
        
        pokemonInfoView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(8)
        }
        
        pokemonInfoLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview().inset(8)
        }
    }
    
    func setupView(pokemonDetailsStructure: PokemonDetailsStructure) {
        pokemonImageView.kf.setImage(with: URL(string: pokemonDetailsStructure.imageUrl),
                                     placeholder: Images.PokemonDetailsView.placeholderImage)
        pokemonNameLabel.text = pokemonDetailsStructure.name
        pokemonInfoLabel.text = "Types: \(pokemonDetailsStructure.types)\nWeight: \(pokemonDetailsStructure.weight) kg\nHeight: \(pokemonDetailsStructure.height) cm"
    }
}
