//
//  UrlFormatter.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import Foundation

final class UrlFormatter {
    
    // MARK: - Method to retrieve query string parameters from an URL
    
    static func getQueryStringParameter(url: String, parameter: String) -> String? {
        guard let url = URLComponents(string: url) else { return nil }
        return url.queryItems?.first(where: { $0.name == parameter })?.value
    }
    
    // MARK: - Method to retrive the last URL component between two "/" symbols
    
    static func getPathLastComponent(url: String) -> String? {
        guard let _ = URL(string: url) else { return nil }
        let contractedUrl = url.dropLast()
        let lastComponent = contractedUrl.components(separatedBy: "/").last
        return lastComponent
    }
}
