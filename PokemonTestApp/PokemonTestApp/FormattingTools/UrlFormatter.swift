//
//  UrlFormatter.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import Foundation

class UrlFormatter {
    static func getQueryStringParameter(url: String, parameter: String) -> String? {
        guard let url = URLComponents(string: url) else { return nil }
        return url.queryItems?.first(where: { $0.name == parameter })?.value
    }
    
    static func getPathLastComponent(url: String) -> String? {
        guard let _ = URL(string: url) else { return nil }
        let lastComponent = url.components(separatedBy: "/").last
        return lastComponent
    }
}
