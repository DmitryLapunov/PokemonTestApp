//
//  NetworkManager.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 5.11.22.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol: AnyObject {
    func sendRequest<T: Decodable>(endpoint: EndpointProtocol, then handler: @escaping (Result<T, Error>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    func sendRequest<T>(endpoint: EndpointProtocol, then handler: @escaping (Result<T, Error>) -> Void) where T: Decodable {
        let request = AF.request(
            endpoint.url.appendingPathComponent(endpoint.path),
            method: HTTPMethod(rawValue: endpoint.method.rawValue),
            parameters: endpoint.parameters,
            encoding: endpoint.encoding ?? URLEncoding.queryString,
            headers: endpoint.headers
        )
        request.validate().responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let networkResponse):
                handler(.success(networkResponse))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
