//
//  PokemonListShimmerCell.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 8.11.22.
//

import UIKit
import Then
import SnapKit

class PokemonListShimmerCell: UICollectionViewCell {
    
    static let reuseIdentifier = "PokemonListShimmerCell"
    
    private let shimmerCellBackgroundView = UIView().then {
        $0.clipsToBounds = true
        $0.backgroundColor = Colors.PokemonListCell.cellBackground
    }
    
    private let gradientColorOne: CGColor = UIColor(white: 0.85, alpha: 1.0).cgColor
    private let gradientColorTwo: CGColor = UIColor(white: 0.95, alpha: 1.0).cgColor
    
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
        contentView.addSubview(shimmerCellBackgroundView)
    }
    
    private func setConstraints() {
        shimmerCellBackgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setupShimmerAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            guard let self = self else { return }
            self.shimmerCellBackgroundView.launchShimmerAnimation(gradientColorOne: self.gradientColorOne,
                                                                  gradientColorTwo: self.gradientColorTwo)
        }
    }
}
