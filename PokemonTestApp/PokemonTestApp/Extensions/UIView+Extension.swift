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
    
    func launchShimmerAnimation(gradientColorOne: CGColor, gradientColorTwo: CGColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = [gradientColorOne, gradientColorTwo, gradientColorOne]
        gradientLayer.locations = [0.0, 0.5, 1.0]
        self.layer.addSublayer(gradientLayer)
        
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.repeatCount = .infinity
        gradientLayer.add(animation, forKey: animation.keyPath)
        gradientLayer.frame = self.bounds
    }
}
