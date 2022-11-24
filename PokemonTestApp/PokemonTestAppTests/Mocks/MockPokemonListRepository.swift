//
//  MockPokemonListRepository.swift
//  PokemonTestAppTests
//
//  Created by Дмитрий Лапунов on 24.11.22.
//

import Foundation
@testable import PokemonTestApp

final class MockPokemonListRepository: PokemonListRepositoryProtocol {
    private var parsedPokemonsModel: PokemonsModel?
    
    func loadPokemons(nextPagePath: String, completion: @escaping PokemonTestApp.PokemonListHandler) {
        // Loading general Pokemon data either from Core Data cache or via a network request.
        prepareMockRequest()
        if let parsedPokemonsModel = parsedPokemonsModel {
            let pokemons = PokemonListCellStructures(pokemons: parsedPokemonsModel)
            completion(.success(pokemons))
        }
    }
    
    func loadPokemonDetails(pokemonId: String, completion: @escaping PokemonTestApp.PokemonDetailsHandler) {
        // Loading specific Pokemon data either from Core Data cache or via a network request.
    }
    
    func wipeCachedPokemons() {
        // Wiping all the general Pokemon data stored in Core Data.
    }
    
    private func prepareMockRequest() {
        let jsonData = readJsonFile(fileName: "pokemons")
        guard let pokemonsModel: PokemonsModel = try? JSONDecoder().decode(PokemonsModel.self, from: jsonData) else { return }
        parsedPokemonsModel = pokemonsModel
    }
    
    private func readJsonFile(fileName: String) -> Data {
        do {
            if let bundlePath = Bundle.main.path(forResource: fileName,
                                                 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        fatalError("Could not read local json")
    }
}
