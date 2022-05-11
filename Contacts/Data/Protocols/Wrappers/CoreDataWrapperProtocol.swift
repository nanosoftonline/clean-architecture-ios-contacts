

import Foundation

import CoreData
protocol CoreDataWrapperProtocol {
    func getData(entityName: String) throws -> [NSManagedObject]
    func getData(entityName: String, predicate: NSPredicate) throws -> [NSManagedObject]
    func getData(entityName: String, predicate: NSPredicate, limit: Int) throws -> [NSManagedObject]
    func deleteEntity(entity: NSManagedObject) throws
    func saveEntity(entity: NSManagedObject) throws
    func getContext() -> NSManagedObjectContext
    
}
