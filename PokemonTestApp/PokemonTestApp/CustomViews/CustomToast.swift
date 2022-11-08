//
//  CustomToast.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 8.11.22.
//

import UIKit
import Then
import SnapKit

class CustomToast: UIView {
    
    private let backgroundView = UIView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 6
        $0.layer.borderWidth = 1
        $0.layer.borderColor = Colors.CustomToast.error.cgColor
        $0.backgroundColor = Colors.CustomToast.lightError
    }
    
    private let sideBarView = UIView().then {
        $0.backgroundColor = Colors.CustomToast.error
    }
    
    private let iconBackgroundView = UIView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
        $0.backgroundColor = Colors.CustomToast.error
    }
    
    private let iconImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.tintColor = Colors.CustomToast.white
        $0.image = Images.CustomToast.error
    }
    
    private let toastMessageLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.font = Fonts.CustomToast.label
        $0.textAlignment = .left
        $0.textColor = Colors.CustomToast.error
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
        addSubview(backgroundView)
        backgroundView.addSubview(sideBarView)
        backgroundView.addSubview(iconBackgroundView)
        iconBackgroundView.addSubview(iconImageView)
        backgroundView.addSubview(toastMessageLabel)
    }
    
    private func setConstraints() {
        self.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.height.greaterThanOrEqualTo(46)
        }
        
        backgroundView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.height.equalToSuperview()
        }
        
        sideBarView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.equalTo(7)
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        iconBackgroundView.snp.makeConstraints {
            $0.width.equalTo(20)
            $0.height.equalTo(20)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(25)
        }
        
        iconImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        toastMessageLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(63)
            $0.trailing.equalToSuperview().inset(15)
            $0.top.equalToSuperview().offset(12)
            $0.bottom.equalToSuperview().inset(12)
        }
    }
    
    func setupCustomToast(toastMessage: String) {
        toastMessageLabel.text = toastMessage
    }
}
