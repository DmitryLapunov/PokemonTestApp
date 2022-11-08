//
//  CoreDataManager.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 8.11.22.
//

import Foundation
import CoreData

protocol CoreDataManagerProtocol: AnyObject {
    func readPokemonData(dataCategory: String) -> [Pokemon]
    func savePokemonData(pokemon: Pokemon, dataCategory: String)
    func deletePokemonData(dataCategory: String)
}

class CoreDataManager: CoreDataManagerProtocol {
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PokemonTestApp")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func readPokemonData(dataCategory: String) -> [Pokemon] {
        let managedContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CachedPokemonListing")
        fetchRequest.predicate = NSPredicate(format: "dataCategory = %@", dataCategory)
        var pokemons: [Pokemon] = []
        do {
            let fetchedPokemons = try managedContext.fetch(fetchRequest)
            pokemons = fetchedPokemons.map {
                Pokemon(name: $0.value(forKey: "name") as! String,
                        url: $0.value(forKey: "url") as! String) }
        } catch let error {
            print(error.localizedDescription)
        }
        return pokemons
    }
    
    func savePokemonData(pokemon: Pokemon, dataCategory: String) {
        let managedContext = persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "CachedPokemonListing", in: managedContext)!
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
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "CachedPokemonListing")
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
