//
//  CoreDataProvider.swift
//  PokemonTestApp
//
//  Created by Дмитрий Лапунов on 22.11.22.
//

import Foundation
import CoreData

typealias ResultBoolError = Result<Bool, Error>

protocol CoreDataProviderProtocol: AnyObject {
    associatedtype CoreDataEntity
    
    func readCache(predicate: NSPredicate?) -> Result<[CoreDataEntity], Error>
    func saveCache() -> Result<CoreDataEntity, Error>
    func deleteSingleEntity(entity: CoreDataEntity) -> ResultBoolError
    func deleteAllCache(predicate: NSPredicate?) -> ResultBoolError
}

final class CoreDataProvider<T: NSManagedObject>: CoreDataProviderProtocol {
    typealias CoreDataEntity = T
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: Contents.CoreData.persistentContainer)
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    private lazy var managedContext = persistentContainer.viewContext
    
    func readCache(predicate: NSPredicate?) -> Result<[T], Error> {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: String(describing: T.self))
        fetchRequest.predicate = predicate
        do {
            if let fetchResult = try managedContext.fetch(fetchRequest) as? [T] {
                return .success(fetchResult)
            } else {
                return .failure(CoreDataError.invalidManagedObjectType)
            }
        } catch let error {
            return .failure(error)
        }
    }
    
    func saveCache() -> Result<T, Error> {
        let structureName = String(describing: T.self)
        guard let managedObject = NSEntityDescription.insertNewObject(forEntityName: structureName,
                                                                      into: managedContext) as? T else {
            return .failure(CoreDataError.invalidManagedObjectType)
        }
        return .success(managedObject)
    }
    
    @discardableResult func deleteSingleEntity(entity: T) -> ResultBoolError {
        managedContext.delete(entity)
        return .success(true)
    }
    
    func deleteAllCache(predicate: NSPredicate?) -> ResultBoolError {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: String(describing: T.self))
        fetchRequest.predicate = predicate
        do {
            if let fetchResult = try managedContext.fetch(fetchRequest) as? [T] {
                fetchResult.forEach {
                    deleteSingleEntity(entity: $0)
                }
                return .success(true)
            } else {
                return .failure(CoreDataError.unableToClearCache)
            }
        } catch let error {
            return .failure(error)
        }
    }
}
