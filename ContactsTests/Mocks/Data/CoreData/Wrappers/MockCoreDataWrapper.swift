@testable import Contacts
import CoreData
import Foundation

final class MockCoreDataWrapper: CoreDataWrapperProtocol{
    func getContext() -> NSManagedObjectContext {
        return container.viewContext
    }
    
    
    var container: NSPersistentContainer!
    var getResult: [NSManagedObject] = []
    var getThrows = false
    var createGotCalledWith :(NSManagedObject) = (NSManagedObject())
    var saveGotCalled = false
    var saveThrows = false
    
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
    
    func save() throws {
        if(saveThrows){
            throw CoreDataError.Save
        }
        saveGotCalled = true
    }
    
}

