//
//  NavBarFormatter.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 7.11.22.
//

import UIKit

class NavBarFormatter {
    func configureNavBar() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        navigationBarAppearance.shadowColor = .clear
        navigationBarAppearance.backgroundColor = Colors.NavigationBar.background
        navigationBarAppearance.backgroundImage = UIImage(named: "pokemon_logo")
        navigationBarAppearance.backgroundImageContentMode = .bottom
        
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        UINavigationBar.appearance().tintColor = Colors.NavigationBar.tint
    }
}
