//
//  TestingEndpoint.swift
//  PokemonTestAppTests
//
//  Created by Дмитрий Лапунов on 16.11.22.
//

import XCTest
@testable import PokemonTestApp
@testable import Alamofire

final class TestingEndpoint: XCTestCase {
    
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
