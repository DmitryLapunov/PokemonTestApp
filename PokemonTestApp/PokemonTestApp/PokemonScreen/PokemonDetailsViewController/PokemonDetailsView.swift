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

final class PokemonDetailsView: UIView {
    
    // MARK: - UI elements
    
    private lazy var scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    
    private lazy var stackView = UIStackView().then {
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = Constants.StackView.zeroSpacing
        $0.axis = .vertical
    }
    
    private let contentView = UIView()
    
    private lazy var pokemonImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.backgroundColor = Colors.PokemonDetailsView.imageViewBackground
        $0.tintColor = Colors.PokemonDetailsView.imageViewTint
    }
    
    private lazy var pokemonIdLabel = UILabel().then {
        $0.textAlignment = .left
        $0.numberOfLines = Constants.Label.singleLine
        $0.textColor = Colors.PokemonDetailsView.pokemonId
        $0.font = Fonts.PokemonDetailsView.pokemonId
    }
    
    private lazy var pokemonNameLabel = UILabel().then {
        $0.textAlignment = .left
        $0.numberOfLines = Constants.Label.singleLine
        $0.textColor = Colors.PokemonDetailsView.pokemonName
        $0.font = Fonts.PokemonDetailsView.pokemonName
    }
    
    private lazy var statsStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .fill
        $0.spacing = Constants.StackView.basicSpacing
    }
    
    private lazy var weightView = UIView().then {
        $0.backgroundColor = Colors.PokemonDetailsView.infoViewBackground
        $0.addBorderAndShadow(borderColor: Colors.PokemonDetailsView.viewBorder,
                              shadowColor: Colors.PokemonDetailsView.viewShadow)
    }
    
    private lazy var weightImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.tintColor = Colors.PokemonDetailsView.icon
        $0.image = Images.PokemonDetailsView.scalemass
    }
    
    private lazy var weightLabel = UILabel().then {
        $0.textAlignment = .center
        $0.numberOfLines = Constants.Label.singleLine
        $0.textColor = Colors.PokemonDetailsView.pokemonDetails
        $0.font = Fonts.PokemonDetailsView.pokemonDetails
    }
    
    private lazy var heightView = UIView().then {
        $0.backgroundColor = Colors.PokemonDetailsView.infoViewBackground
        $0.addBorderAndShadow(borderColor: Colors.PokemonDetailsView.viewBorder,
                              shadowColor: Colors.PokemonDetailsView.viewShadow)
    }
    
    private lazy var heightImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.tintColor = Colors.PokemonDetailsView.icon
        $0.image = Images.PokemonDetailsView.pencilAndRuler
    }
    
    private lazy var heightLabel = UILabel().then {
        $0.textAlignment = .center
        $0.numberOfLines = Constants.Label.singleLine
        $0.textColor = Colors.PokemonDetailsView.pokemonDetails
        $0.font = Fonts.PokemonDetailsView.pokemonDetails
    }
    
    // MARK: - Init methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors.PokemonDetailsView.controllerViewBackground
        setupSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - UIView setup methods
    
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
            $0.top.equalToSuperview().offset(Constants.TopConstraint.half)
            $0.width.equalTo(Constants.PokemonDetailsView.pokemonImageViewWidth)
            $0.height.equalTo(Constants.PokemonDetailsView.pokemonImageViewHeight)
            $0.leading.equalToSuperview().offset(Constants.LeadingConstraint.basic)
        }
        
        pokemonIdLabel.snp.makeConstraints {
            $0.top.equalTo(pokemonImageView.snp.top)
            $0.leading.equalTo(pokemonImageView.snp.trailing).offset(Constants.LeadingConstraint.half)
            $0.trailing.equalToSuperview().inset(Constants.TrailingConstraint.basic)
        }
        
        pokemonNameLabel.snp.makeConstraints {
            $0.top.equalTo(pokemonIdLabel.snp.bottom)
            $0.leading.equalTo(pokemonImageView.snp.trailing).offset(Constants.LeadingConstraint.half)
            $0.trailing.equalToSuperview().inset(Constants.TrailingConstraint.basic)
        }
        
        statsStackView.snp.makeConstraints {
            $0.top.equalTo(pokemonImageView.snp.bottom).offset(Constants.TopConstraint.basic)
            $0.leading.equalToSuperview().offset(Constants.LeadingConstraint.basic)
            $0.trailing.equalToSuperview().inset(Constants.TrailingConstraint.basic)
        }
        
        weightImageView.snp.makeConstraints {
            $0.height.equalTo(Constants.PokemonDetailsView.pokemonInfoImageViewHeight)
            $0.width.equalTo(Constants.PokemonDetailsView.pokemonInfoImageViewWidth)
            $0.top.equalToSuperview().offset(Constants.TopConstraint.half)
            $0.centerX.equalToSuperview()
        }
        
        weightLabel.snp.makeConstraints {
            $0.top.equalTo(weightImageView.snp.bottom).offset(Constants.TopConstraint.quarter)
            $0.leading.equalToSuperview().offset(Constants.LeadingConstraint.half)
            $0.trailing.equalToSuperview().inset(Constants.TrailingConstraint.half)
            $0.bottom.equalToSuperview().inset(Constants.BottomConstraint.half)
        }
        
        heightImageView.snp.makeConstraints {
            $0.height.equalTo(Constants.PokemonDetailsView.pokemonInfoImageViewHeight)
            $0.width.equalTo(Constants.PokemonDetailsView.pokemonInfoImageViewWidth)
            $0.top.equalToSuperview().offset(Constants.TopConstraint.half)
            $0.centerX.equalToSuperview()
        }
        
        heightLabel.snp.makeConstraints {
            $0.top.equalTo(heightImageView.snp.bottom).offset(Constants.TopConstraint.quarter)
            $0.leading.equalToSuperview().offset(Constants.LeadingConstraint.half)
            $0.trailing.equalToSuperview().inset(Constants.TrailingConstraint.half)
            $0.bottom.equalToSuperview().inset(Constants.BottomConstraint.half)
        }
    }
    
    private func createTypeTiles(types: [String]) {
        var typeViewsArray: [UIView] = []
        types.forEach {
            let type = $0
            if let pokemonType = PokemonOfficialTypes(rawValue: type) {
                let typeView = UIView().then {
                    $0.backgroundColor = pokemonType.typeColor
                    $0.layer.cornerRadius = Constants.Corner.smallRadius
                }
                let typeLabel = UILabel().then {
                    $0.text = pokemonType.rawValue.uppercased()
                    $0.textColor = Colors.PokemonDetailsView.typeLabel
                    $0.font = Fonts.PokemonDetailsView.typeLabel
                }
                typeView.addSubview(typeLabel)
                typeLabel.snp.makeConstraints {
                    $0.top.equalToSuperview().offset(Constants.TopConstraint.eighth)
                    $0.leading.equalToSuperview().offset(Constants.LeadingConstraint.quarter)
                    $0.trailing.equalToSuperview().inset(Constants.TrailingConstraint.quarter)
                    $0.bottom.equalToSuperview().inset(Constants.BottomConstraint.eighth)
                }
                typeViewsArray.append(typeView)
            }
        }
        let typeStackView = UIStackView(arrangedSubviews: typeViewsArray).then {
            $0.axis = .horizontal
            $0.distribution = .fillProportionally
            $0.alignment = .fill
            $0.spacing = Constants.StackView.quarterSpacing
        }
        contentView.addSubview(typeStackView)
        typeStackView.snp.makeConstraints {
            $0.top.equalTo(pokemonNameLabel.snp.bottom).offset(Constants.TopConstraint.eighth)
            $0.leading.equalTo(pokemonImageView.snp.trailing).offset(Constants.LeadingConstraint.half)
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
