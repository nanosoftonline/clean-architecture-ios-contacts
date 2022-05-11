@testable import Contacts
import CoreData
import Foundation

final class MockCoreDataWrapper: CoreDataWrapperProtocol{
    var container: NSPersistentContainer!
    var getResult: [NSManagedObject] = []
    var getThrows = false
    var saveGotCalled = false
    var saveThrows = false
    var entityToSave :NSManagedObject!
    var entityToDelete :NSManagedObject!
    
    init(){
        container = NSPersistentContainer(name: "Contact");
    }
    
    
    func getData(entityName: String) throws -> [NSManagedObject] {
        if(getThrows){
            throw CoreDataError.Fetch
        }
        return getResult
        
    }
    
    func getData(entityName: String, predicate: NSPredicate) throws -> [NSManagedObject] {
        if(getThrows){
            throw CoreDataError.Fetch
        }
        return getResult
    }
    
    func getData(entityName: String, predicate: NSPredicate, limit: Int) throws -> [NSManagedObject] {
        if(getThrows){
            throw CoreDataError.Fetch
        }
        return getResult
    }
    
    internal func save() throws {
        if(saveThrows){
            throw CoreDataError.Save
        }
        saveGotCalled = true
    }
    
    func deleteEntity(entity: NSManagedObject) throws{
        entityToDelete = entity
        try save()
    }

    
    func saveEntity(entity: NSManagedObject) throws {
        entityToSave = entity
        try save()
    }
    
    func getContext() -> NSManagedObjectContext {
        return container.viewContext
    }
    
}

