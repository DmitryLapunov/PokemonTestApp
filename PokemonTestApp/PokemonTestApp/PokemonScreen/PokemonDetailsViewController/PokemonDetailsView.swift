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
    
    private let pokemonImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 50
        $0.backgroundColor = Colors.PokemonDetailsView.imageViewBackground
        $0.tintColor = Colors.PokemonDetailsView.imageViewTint
    }
    
    private let pokemonIdLabel = UILabel().then {
        $0.textAlignment = .left
        $0.numberOfLines = 1
        $0.textColor = Colors.PokemonDetailsView.pokemonId
        $0.font = Fonts.PokemonDetailsView.pokemonId
    }
    
    private let pokemonNameLabel = UILabel().then {
        $0.textAlignment = .left
        $0.numberOfLines = 1
        $0.textColor = Colors.PokemonDetailsView.pokemonName
        $0.font = Fonts.PokemonDetailsView.pokemonName
    }
    
    private let statsStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .fill
        $0.spacing = 16
    }
    
    private let weightView = UIView().then {
        $0.backgroundColor = Colors.PokemonDetailsView.infoViewBackground
        $0.addBorderAndShadow(borderColor: Colors.PokemonDetailsView.viewBorder,
                              shadowColor: Colors.PokemonDetailsView.viewShadow)
    }
    
    private let weightImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.tintColor = Colors.PokemonDetailsView.icon
        $0.image = Images.PokemonDetailsView.scalemass
    }
    
    private let weightLabel = UILabel().then {
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.textColor = Colors.PokemonDetailsView.pokemonDetails
        $0.font = Fonts.PokemonDetailsView.pokemonDetails
    }
    
    private let heightView = UIView().then {
        $0.backgroundColor = Colors.PokemonDetailsView.infoViewBackground
        $0.addBorderAndShadow(borderColor: Colors.PokemonDetailsView.viewBorder,
                              shadowColor: Colors.PokemonDetailsView.viewShadow)
    }
    
    private let heightImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.tintColor = Colors.PokemonDetailsView.icon
        $0.image = Images.PokemonDetailsView.pencilAndRuler
    }
    
    private let heightLabel = UILabel().then {
        $0.textAlignment = .center
        $0.numberOfLines = 1
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
        contentView.addSubview(pokemonImageView)
        contentView.addSubview(pokemonIdLabel)
        contentView.addSubview(pokemonNameLabel)
        contentView.addSubview(statsStackView)
        statsStackView.addArrangedSubview(weightView)
        statsStackView.addArrangedSubview(heightView)
        weightView.addSubview(weightImageView)
        weightView.addSubview(weightLabel)
        heightView.addSubview(heightImageView)
        heightView.addSubview(heightLabel)
    }
    
    private func setConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(self.snp.width)
        }
        
        pokemonImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.width.equalTo(100)
            $0.height.equalTo(100)
            $0.leading.equalToSuperview().offset(16)
        }
        
        pokemonIdLabel.snp.makeConstraints {
            $0.top.equalTo(pokemonImageView.snp.top)
            $0.leading.equalTo(pokemonImageView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        pokemonNameLabel.snp.makeConstraints {
            $0.top.equalTo(pokemonIdLabel.snp.bottom)
            $0.leading.equalTo(pokemonImageView.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        statsStackView.snp.makeConstraints {
            $0.top.equalTo(pokemonImageView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        weightImageView.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(40)
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
        }
        
        weightLabel.snp.makeConstraints {
            $0.top.equalTo(weightImageView.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview().inset(8)
        }
        
        heightImageView.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(40)
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
        }
        
        heightLabel.snp.makeConstraints {
            $0.top.equalTo(heightImageView.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview().inset(8)
        }
    }
    
    private func createTypeTiles(types: [String]) {
        var typeViewsArray: [UIView] = []
        types.forEach {
            let type = $0
            if let pokemonType = PokemonOfficialTypes(rawValue: type) {
                let typeView = UIView().then {
                    $0.backgroundColor = pokemonType.typeColor
                    $0.layer.cornerRadius = 4
                }
                let typeLabel = UILabel().then {
                    $0.text = pokemonType.rawValue.uppercased()
                    $0.textColor = UIColor.white
                    $0.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
                }
                typeView.addSubview(typeLabel)
                typeLabel.snp.makeConstraints {
                    $0.top.equalToSuperview().offset(2)
                    $0.leading.equalToSuperview().offset(4)
                    $0.trailing.equalToSuperview().inset(4)
                    $0.bottom.equalToSuperview().inset(2)
                }
                typeViewsArray.append(typeView)
            }
        }
        let typeStackView = UIStackView(arrangedSubviews: typeViewsArray).then {
            $0.axis = .horizontal
            $0.distribution = .fillProportionally
            $0.alignment = .fill
            $0.spacing = 4
        }
        contentView.addSubview(typeStackView)
        typeStackView.snp.makeConstraints {
            $0.top.equalTo(pokemonNameLabel.snp.bottom).offset(2)
            $0.leading.equalTo(pokemonImageView.snp.trailing).offset(8)
        }
    }
    
    func setupView(pokemonDetailsStructure: PokemonDetailsStructure) {
        pokemonImageView.kf.setImage(with: URL(string: pokemonDetailsStructure.imageUrl),
                                     placeholder: Images.PokemonDetailsView.placeholderImage)
        pokemonIdLabel.text = "#\(pokemonDetailsStructure.id)"
        pokemonNameLabel.text = pokemonDetailsStructure.name
        weightLabel.text = "\(pokemonDetailsStructure.weight) kg"
        heightLabel.text = "\(pokemonDetailsStructure.height) cm"
        createTypeTiles(types: pokemonDetailsStructure.types)
    }
}
