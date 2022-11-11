//
//  UIView+Extension.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 7.11.22.
//

import UIKit

extension UIView {
    func addBorderAndShadow(borderColor: CGColor, shadowColor: CGColor) {
        self.layer.cornerRadius = Constants.Corner.basicRadius
        self.layer.borderWidth = Constants.Border.defaultWidth
        self.layer.borderColor = borderColor
        self.layer.shadowColor = shadowColor
        self.layer.shadowOffset = CGSize(width: Constants.Shadow.offsetX,
                                         height: Constants.Shadow.offsetY)
        self.layer.shadowRadius = Constants.Shadow.radius
        self.layer.shadowOpacity = Constants.Shadow.opacity
    }
}
