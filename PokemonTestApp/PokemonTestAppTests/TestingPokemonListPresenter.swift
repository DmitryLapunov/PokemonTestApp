//
//  TestingPokemonListPresenter.swift
//  PokemonTestAppTests
//
//  Created by Дмитрий Лапунов on 23.11.22.
//

import XCTest
@testable import PokemonTestApp

final class TestingPokemonListPresenter: XCTestCase {
    
    // MARK: - Test properties.
    
    var testSubject: MockPokemonListPresenter!
    var mockRepository: MockPokemonListRepository!
    var mockView: MockPokemonListView!
    
    // MARK: - Testing MVP pattern

    func testMockViewCreation() {
        XCTAssertNotNil(mockView)
    }
    
    func testMockRepositoryCreation() {
        XCTAssertNotNil(mockRepository)
    }
    
    func testPresenterCreation() {
        XCTAssertNotNil(testSubject)
    }
    
    func testViewFunctionality() {
        testSubject.view?.presentPokemonData(pokemons: [])
        XCTAssertTrue(mockView.isPresenterCallReceived)
    }
    
    func testMockRepositoryNetworking() {
        testSubject.loadPokemonData()
        let pokemons = mockView.pokemons
        XCTAssertTrue(pokemons.count > 0)
        let pokemonsCount = testSubject.pokemonsCount
        XCTAssertEqual(pokemonsCount, 1154)
    }
    
    // MARK: - Standard testing methods

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        mockView = MockPokemonListView()
        mockRepository = MockPokemonListRepository()
        testSubject = MockPokemonListPresenter(view: mockView, repository: mockRepository)
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
