//
//  NavBarFormatter.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 7.11.22.
//

import UIKit

final class NavBarFormatter {
    
    /// Method to configure app's navigation bar
    
    func configureNavBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        navigationBarAppearance.shadowColor = .clear
        navigationBarAppearance.backgroundColor = Colors.NavigationBar.background
        navigationBarAppearance.backgroundImage = UIImage(named: "pokemon_logo")
        navigationBarAppearance.backgroundImageContentMode = .bottom
        
        let navigationAppearance = UINavigationBar.appearance()
        navigationAppearance.standardAppearance = navigationBarAppearance
        navigationAppearance.compactAppearance = navigationBarAppearance
        navigationAppearance.scrollEdgeAppearance = navigationBarAppearance
        navigationAppearance.tintColor = Colors.NavigationBar.tint
    }
}
