@testable import Contacts
import XCTest
import CoreData



class CoreDataContactDataSourceTests: XCTestCase {
    var ds : CoreDataContactDataSource!
    var dbWrapper: MockCoreDataWrapper!
    
    override func setUp() {
        dbWrapper = MockCoreDataWrapper()
        ds = .init(dbWrapper: dbWrapper)
    }
    
    func test_getAll_should_return_ContactResponseModel_list() {
        let expectedData = (UUID(), "Paul")
        let item = ContactEntity(context: dbWrapper.container.viewContext)
        item.id = expectedData.0
        item.name = expectedData.1
        dbWrapper.getResult = [item]
        
        let response =  ds.getAll()
        
        XCTAssertEqual(response, .success([ContactResponseModel(id: expectedData.0, name: expectedData.1)]))
    }
    
    func test_getAll_should_return_failure_on_error() {
        dbWrapper.getThrows = true
        let response =  ds.getAll()
        XCTAssertEqual(response, .failure(.Get))
    }
    
    func test_getOne_should_return_one_ContactResponseModel() {
        let expectedData = (UUID(), "Paul")
        let item = ContactEntity(context: dbWrapper.container.viewContext)
        item.id = expectedData.0
        item.name = expectedData.1
        dbWrapper.getResult = [item]
        
        let response =  ds.getOne(UUID())
        
        XCTAssertEqual(response, .success(ContactResponseModel(id: expectedData.0, name: expectedData.1)))
    }
    
    func test_getOne_should_return_failure_on_error() {
        dbWrapper.getThrows = true
        let response =  ds.getOne(UUID())
        XCTAssertEqual(response, .failure(.Get))
    }
    
    func test_create() {
        
        let expectedData = (UUID(), "Paul")
        let item = ContactEntity(context: dbWrapper.container.viewContext)
        item.id = expectedData.0
        item.name = expectedData.1
        
        let response =  ds.create(ContactRequestModel(name: expectedData.1))
        
        XCTAssertTrue(dbWrapper.saveGotCalled)
        XCTAssertEqual(response, .success(true))
    }
    
    func test_create_should_return_failure_on_error() {
        dbWrapper.saveThrows = true
        
        let response =  ds.create(ContactRequestModel(name: "Paul"))
        
        XCTAssertFalse(dbWrapper.saveGotCalled)
        XCTAssertEqual(response, .failure(.Create))
    }
    
    func test_delete_should_call_true() {
        let expectedData = (UUID(), "Paul")
        let item = ContactEntity(context: dbWrapper.container.viewContext)
        item.id = expectedData.0
        item.name = expectedData.1
        dbWrapper.getResult = [item]
        
        let response =  ds.delete(UUID())
        
        XCTAssertTrue(dbWrapper.saveGotCalled)
        XCTAssertEqual(response, .success(true))
    }
    
    func test_delete_should_return_failure_on_error() {
        let expectedData = (UUID(), "Paul")
        let item = ContactEntity(context: dbWrapper.container.viewContext)
        item.id = expectedData.0
        item.name = expectedData.1
        dbWrapper.getResult = [item]
        dbWrapper.saveThrows = true
        
        let response =  ds.delete(UUID())
        
        XCTAssertFalse(dbWrapper.saveGotCalled)
        XCTAssertEqual(response, .failure(.Delete))
    }
    
    func test_update_should_call_true() {
        let mockData = ContactEntity(context: dbWrapper.container.viewContext)
        mockData.id = UUID()
        mockData.name = "Some Name"
        dbWrapper.getResult = [mockData]
        
        let response =  ds.update(id: UUID(),data:ContactRequestModel(name: "Another Name"))
        let expectedEntityToSave =  dbWrapper.entityToSave as! ContactEntity
        

        XCTAssertEqual(expectedEntityToSave.id, mockData.id)
        XCTAssertEqual(expectedEntityToSave.name, "Another Name")
        XCTAssertEqual(response, .success(true))
    }
    
    func test_update_should_return_failure_on_error() {

        let mockData = ContactEntity(context: dbWrapper.container.viewContext)
        mockData.id = UUID()
        mockData.name = "Some Name"
        dbWrapper.getResult = [mockData]
        dbWrapper.saveThrows = true
        
        let response =  ds.update(id: UUID(), data: ContactRequestModel(name: "Another Name"))
                        
        XCTAssertFalse(dbWrapper.saveGotCalled)
        XCTAssertEqual(response, .failure(.Update))
    }
}
