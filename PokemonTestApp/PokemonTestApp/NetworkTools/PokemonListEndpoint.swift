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
                  parameters: [String: Any](),
                  encoding: URLEncoding.queryString,
                  nextPagePath: nextPagePath)
    }
    
    func setEndpoint() -> EndpointProtocol {
        var parameters: [String: Any] = [String: Any]()
        if let nextPage = nextPagePath, !nextPage.isEmpty {
            let offset = UrlFormatter.getQueryStringParameter(url: nextPage, parameter: "offset")
            if let offset = offset {
                parameters = ["offset": "\(offset)",
                              "limit": "20"]
            }
        }
        return PokemonListEndpoint(url: url,
                                   method: method,
                                   path: path,
                                   parameters: parameters,
                                   encoding: encoding)
    }
}
