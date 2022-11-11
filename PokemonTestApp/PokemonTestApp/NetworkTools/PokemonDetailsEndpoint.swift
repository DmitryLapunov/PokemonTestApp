//
//  PokemonDetailsEndpoint.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 7.11.22.
//

import Foundation
import Alamofire

final class PokemonDetailsEndpoint: EndpointProtocol {
    let url: URL
    let method: HTTPMethod
    let path: Path
    let parameters: Parameters?
    let encoding: ParameterEncoding?
    let headers: HTTPHeaders?
    var pokemonId: String?
    
    private init(url: URL,
                 method: HTTPMethod,
                 path: Path,
                 parameters: Parameters? = nil,
                 encoding: ParameterEncoding? = nil,
                 headers: HTTPHeaders? = nil,
                 pokemonId: String? = "") {
        self.url = url
        self.method = method
        self.path = path
        self.parameters = parameters
        self.encoding = encoding
        self.headers = headers
        self.pokemonId = pokemonId
    }
    
    convenience init(pokemonId: String) {
        self.init(url: URL(string: Contents.Networking.pokemonApiUrl)!,
                  method: .get,
                  path: "",
                  encoding: URLEncoding.queryString,
                  pokemonId: pokemonId)
    }
    
    func setEndpoint() -> EndpointProtocol {
        var path: String = ""
        if let pokemonId = pokemonId {
            path = "/\(pokemonId)"
        }
        return PokemonDetailsEndpoint(url: url,
                                      method: method,
                                      path: path,
                                      parameters: parameters,
                                      encoding: encoding)
    }
}
