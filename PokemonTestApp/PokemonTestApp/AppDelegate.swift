//
//  AppDelegate.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 4.11.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navBarFormatter = NavBarFormatter()
        navBarFormatter.configureNavBar()
        let builder = PokemonListBuilder()
        let rootViewController = builder.build()
        window?.rootViewController = UINavigationController(rootViewController: rootViewController)
        window?.makeKeyAndVisible()
        
        return true
    }
    
}
