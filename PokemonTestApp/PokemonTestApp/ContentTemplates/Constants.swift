//
//  Constants.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 11.11.22.
//

import Foundation

enum Constants {
    enum LeadingConstraint {
        static let double = 32
        static let basic = 16
        static let half = 8
        static let quarter = 4
    }
    
    enum TrailingConstraint {
        static let double = 32
        static let basic = 16
        static let half = 8
        static let quarter = 4
    }
    
    enum TopConstraint {
        static let double = 32
        static let basic = 16
        static let half = 8
        static let quarter = 4
        static let eighth = 2
    }
    
    enum BottomConstraint {
        static let double = 32
        static let basic = 16
        static let half = 8
        static let quarter = 4
        static let eighth = 2
    }
    
    enum View {
        static let transparentAlpha = 0.1
    }
    
    enum Label {
        static let singleLine = 1
        static let infiniteLines = 0
    }
    
    enum StackView {
        static let zeroSpacing: CGFloat = 0
        static let basicSpacing: CGFloat = 16
        static let quarterSpacing: CGFloat = 4
    }
    
    enum Shadow {
        static let offsetX = 0.0
        static let offsetY = 3.0
        static let radius = 3.0
        static let opacity: Float = 0.1
    }
    
    enum Corner {
        static let basicRadius = 8.0
        static let smallRadius = 4.0
    }
    
    enum Border {
        static let defaultWidth = 1.0
    }
    
    enum PokemonListCell {
        static let pokeballOutlineImageViewWidth = 90
        static let pokeballIconImageViewWidth = 16
        static let pokeballIconImageViewHeight = 16
        static let arrowImageViewWidth = 15
        static let arrowImageViewHeight = 15
        static let arrowImageViewTrailing = 12
    }
    
    enum PokemonDetailsView {
        static let pokemonImageViewWidth = 100
        static let pokemonImageViewHeight = 100
        static let pokemonInfoImageViewWidth = 40
        static let pokemonInfoImageViewHeight = 40
    }
}
