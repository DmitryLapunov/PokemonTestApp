//
//  CoreDataManager.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 8.11.22.
//

import Foundation
import CoreData

protocol CoreDataManagerProtocol: AnyObject {
    func readPokemonById(id: Int) -> PokemonDetailsStructure?
    func savePokemonDetails(details: PokemonDetailsStructure)
    func readPokemonData(dataCategory: String) -> [PokemonModel]
    func savePokemonData(pokemon: PokemonModel, dataCategory: String)
    func deletePokemonData(dataCategory: String)
}

final class CoreDataManager: CoreDataManagerProtocol {
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: Contents.CoreData.persistentContainer)
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func readPokemonById(id: Int) -> PokemonDetailsStructure? {
        let managedContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: Contents.CoreData.pokemonDetailsEntity)
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        var pokemon: PokemonDetailsStructure?
        do {
            let fetchedPokemon = try managedContext.fetch(fetchRequest)
            pokemon = PokemonDetailsStructure(id: fetchedPokemon[0].value(forKey: "id") as! Int,
                                              name: fetchedPokemon[0].value(forKey: "name") as! String,
                                              imageUrl: fetchedPokemon[0].value(forKey: "imageUrl") as! String,
                                              height: fetchedPokemon[0].value(forKey: "height") as! Int,
                                              weight: fetchedPokemon[0].value(forKey: "weight") as! Double,
                                              types: fetchedPokemon[0].value(forKey: "types") as! [String])
        } catch let error {
            print(error.localizedDescription)
        }
        return pokemon
    }
    
    func savePokemonDetails(details: PokemonDetailsStructure) {
        let managedContext = persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: Contents.CoreData.pokemonDetailsEntity, in: managedContext)!
        let pokemonEntity = NSManagedObject(entity: entity, insertInto: managedContext)
        
        pokemonEntity.setValue(details.id, forKey: "id")
        pokemonEntity.setValue(details.name, forKey: "name")
        pokemonEntity.setValue(details.imageUrl, forKey: "imageUrl")
        pokemonEntity.setValue(details.height, forKey: "height")
        pokemonEntity.setValue(details.weight, forKey: "weight")
        pokemonEntity.setValue(details.types, forKey: "types")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func readPokemonData(dataCategory: String) -> [PokemonModel] {
        let managedContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: Contents.CoreData.pokemonEntity)
        fetchRequest.predicate = NSPredicate(format: "dataCategory = %@", dataCategory)
        var pokemons: [PokemonModel] = []
        do {
            let fetchedPokemons = try managedContext.fetch(fetchRequest)
            pokemons = fetchedPokemons.map {
                PokemonModel(name: $0.value(forKey: "name") as! String,
                             url: $0.value(forKey: "url") as! String) }
        } catch let error {
            print(error.localizedDescription)
        }
        return pokemons
    }
    
    func savePokemonData(pokemon: PokemonModel, dataCategory: String) {
        let managedContext = persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: Contents.CoreData.pokemonEntity, in: managedContext)!
        let pokemonEntity = NSManagedObject(entity: entity, insertInto: managedContext)
        
        pokemonEntity.setValue(pokemon.name, forKey: "name")
        pokemonEntity.setValue(pokemon.url, forKey: "url")
        pokemonEntity.setValue(Contents.BasicContent.dataCategory, forKey: "dataCategory")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func deletePokemonData(dataCategory: String) {
        let managedContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: Contents.CoreData.pokemonEntity)
        fetchRequest.predicate = NSPredicate(format: "dataCategory = %@", dataCategory)
        
        do {
            let fetchedPokemons = try managedContext.fetch(fetchRequest)
            for managedObject in fetchedPokemons {
                managedContext.delete(managedObject)
            }
        } catch let error as NSError {
            print("Detele all data in \(dataCategory) category error : \(error) \(error.userInfo)")
        }
    }
}
