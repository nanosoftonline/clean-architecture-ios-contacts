import Foundation
import CoreData

class CoreDataWrapper : CoreDataWrapperProtocol {
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
    
    
    internal func save() throws {
        if(container.viewContext.hasChanges){
            try container.viewContext.save()
        }
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
    
    func saveEntity(entity: NSManagedObject) throws{
        try save()
    }
    
    
    func deleteEntity(entity: NSManagedObject) throws {
        entity.prepareForDeletion()
        try save()
    }
    
}
