//
//  UIView+Extension.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 7.11.22.
//

import UIKit

extension UIView {
    func addBorderAndShadow(borderColor: CGColor, shadowColor: CGColor) {
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.layer.borderColor = borderColor
        self.layer.shadowColor = shadowColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 0.1
    }
}
