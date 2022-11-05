//
//  EndpointProtocol.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import Foundation
import Alamofire

typealias Path = String

protocol EndpointProtocol: AnyObject {
    var url: URL { get }
    var method: HTTPMethod { get }
    var path: Path { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding? { get }
    var headers: HTTPHeaders? { get }
    
    func setEndpoint() -> EndpointProtocol
}
