

import Foundation

import CoreData
protocol CoreDataWrapperProtocol {
    func getData(entityName: String) throws -> [NSManagedObject]
    func getData(entityName: String, predicate: NSPredicate) throws -> [NSManagedObject]
    func getData(entityName: String, predicate: NSPredicate, limit: Int) throws -> [NSManagedObject]
    func save() throws
//    func fetch(_ request: NSFetchRequest<NSFetchRequestResult>) throws -> [Any]
    func getContext() -> NSManagedObjectContext
//    func save() throws
    
}
