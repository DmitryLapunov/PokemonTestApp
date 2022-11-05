//
//  PokemonListEndpoint.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import Foundation
import Alamofire

class PokemonListEndpoint: EndpointProtocol {
    let url: URL
    let method: HTTPMethod
    let path: Path
    let parameters: Parameters?
    let encoding: ParameterEncoding?
    let headers: HTTPHeaders?
    
    private init(url: URL,
                 method: HTTPMethod,
                 path: Path,
                 parameters: Parameters? = nil,
                 encoding: ParameterEncoding? = nil,
                 headers: HTTPHeaders? = nil) {
        self.url = url
        self.method = method
        self.path = path
        self.parameters = parameters
        self.encoding = encoding
        self.headers = headers
    }
    
    convenience init() {
        self.init(url: URL(string: "https://pokeapi.co/api/v2/pokemon")!,
                  method: .get,
                  path: "",
                  encoding: URLEncoding.queryString)
    }
    
    func setEndpoint() -> EndpointProtocol {
        return PokemonListEndpoint(url: url,
                                   method: method,
                                   path: path,
                                   encoding: encoding)
    }
}
