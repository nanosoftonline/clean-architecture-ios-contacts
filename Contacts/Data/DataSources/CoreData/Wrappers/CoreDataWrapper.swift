import Foundation
import CoreData

class CoreDataWrapper : CoreDataWrapperProtocol {
    func save() throws {
        try container.viewContext.save()
    }
    
    func getContext() -> NSManagedObjectContext {
        return container.viewContext
    }
    
    func getData(entityName: String) throws -> [NSManagedObject] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        let entities = try container.viewContext.fetch(fetchRequest)
        return entities
        
    }
    
    func getData(entityName: String, predicate: NSPredicate) throws -> [NSManagedObject] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        let entities = try container.viewContext.fetch(fetchRequest)
        return entities
    }
    
    func getData(entityName: String, predicate: NSPredicate, limit: Int) throws -> [NSManagedObject] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityName)
        let entities = try container.viewContext.fetch(fetchRequest)
        return entities
    }
    

    
    var container: NSPersistentContainer!
    
    init(){
                container = NSPersistentContainer(name: "Contact")
                container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
                container.loadPersistentStores { storeDescription, error in
                    if let error = error {
                        print("Unresolved error \(error)")
                    }
                }
                container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
//
//    func getContext() -> NSManagedObjectContext {
//        return container.viewContext
//    }
//
//    func save() throws {
//      try container.viewContext.save()
//    }
//
//    func fetch(_ request: NSFetchRequest<NSFetchRequestResult>) throws -> [Any] {
//        return try container.viewContext.fetch(request)
//
//    }
    

    

    



}
