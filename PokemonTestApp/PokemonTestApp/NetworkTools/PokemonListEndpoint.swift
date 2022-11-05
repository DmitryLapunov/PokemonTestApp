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
    var nextPagePath: String?
    
    private init(url: URL,
                 method: HTTPMethod,
                 path: Path,
                 parameters: Parameters? = nil,
                 encoding: ParameterEncoding? = nil,
                 headers: HTTPHeaders? = nil,
                 nextPagePath: String? = "") {
        self.url = url
        self.method = method
        self.path = path
        self.parameters = parameters
        self.encoding = encoding
        self.headers = headers
        self.nextPagePath = nextPagePath
    }
    
    convenience init(nextPagePath: String) {
        self.init(url: URL(string: "https://pokeapi.co/api/v2/pokemon")!,
                  method: .get,
                  path: "",
                  encoding: URLEncoding.queryString,
                  nextPagePath: nextPagePath)
    }
    
    func setEndpoint() -> EndpointProtocol {
        var path: String = ""
        if let nextPage = nextPagePath, !nextPage.isEmpty {
            path = nextPage
        }
        return PokemonListEndpoint(url: url,
                                   method: method,
                                   path: path,
                                   encoding: encoding)
    }
}
