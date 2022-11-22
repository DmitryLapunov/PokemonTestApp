//
//  TestingEndpoint.swift
//  PokemonTestAppTests
//
//  Created by Дмитрий Лапунов on 16.11.22.
//

import XCTest
@testable import PokemonTestApp
import Alamofire

final class TestingEndpoint: XCTestCase {
    
    // MARK: - Testing Endpoint creation via protocol method
    
    class TestEndpoint: EndpointProtocol {
        var url: URL = URL(fileURLWithPath: "\(Contents.Networking.pokemonApiUrl)")
        var method: Alamofire.HTTPMethod = .get
        var path: PokemonTestApp.Path = ""
        var parameters: Alamofire.Parameters?
        var encoding: Alamofire.ParameterEncoding?
        var headers: Alamofire.HTTPHeaders?
        
        func setEndpoint() -> PokemonTestApp.EndpointProtocol {
            return TestEndpoint()
        }
    }
    
    func testEndpointCreation() {
        let testEndpoint = TestEndpoint().setEndpoint()
        XCTAssertNotNil(testEndpoint)
    }
    
    // MARK: - Validating network request
    
    func testRequestGeneration() {
        let testEndpoint = TestEndpoint().setEndpoint()
        let testRequest = AF.request(
            testEndpoint.url.appendingPathComponent(testEndpoint.path),
            method: HTTPMethod(rawValue: testEndpoint.method.rawValue),
            parameters: testEndpoint.parameters,
            encoding: testEndpoint.encoding ?? URLEncoding.queryString,
            headers: testEndpoint.headers
        )
        XCTAssertNotNil(testRequest.validate())
    }
    
    // MARK: - Testing NetworkManager
    
    struct MockPokemonData: Decodable {
        let count: Int
        var next: String?
        var previous: String?
        
        enum CodingKeys: String, CodingKey {
            case count
            case next
            case previous
        }
    }
    
    typealias TestHandler = (Result<MockPokemonData, Error>) -> Void
    
    class TestNetworkManager: NetworkManagerProtocol {
        func sendRequest<T>(endpoint: PokemonTestApp.EndpointProtocol, then handler: @escaping (Result<T, Error>) -> Void) where T: Decodable {
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
    
    func testNetworkRequest() {
        let testNetworkManager: NetworkManagerProtocol = TestNetworkManager()
        let testEndpoint = TestEndpoint().setEndpoint()
        func testRequest(handler: @escaping TestHandler) {
            testNetworkManager.sendRequest(endpoint: testEndpoint, then: handler)
        }
        testRequest { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
    }
    
    // MARK: - Standard testing methods
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
