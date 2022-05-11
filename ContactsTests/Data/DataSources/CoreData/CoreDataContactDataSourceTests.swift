@testable import Contacts
import XCTest
import CoreData



class CoreDataContactDataSourceTests: XCTestCase {
    var ds : CoreDataContactDataSource!
    var mockWrapper: MockCoreDataWrapper!
    
    override func setUp() {
        mockWrapper = MockCoreDataWrapper()
        ds = .init(dbWrapper: mockWrapper)
    }
    
    func test_getAll_should_return_ContactResponseModel_list() {
        let expectedData = (UUID(), "Paul")
        let item = ContactEntity(context: mockWrapper.container.viewContext)
        item.id = expectedData.0
        item.name = expectedData.1
        mockWrapper.getResult = [item]
        
        let response =  ds.getAll()
        
        XCTAssertEqual(response, .success([ContactResponseModel(id: expectedData.0, name: expectedData.1)]))
    }
    
    func test_getAll_should_return_failure_on_error() {
        mockWrapper.getThrows = true
        let response =  ds.getAll()
        XCTAssertEqual(response, .failure(.Get))
    }
    
    func test_create() {
        
        let expectedData = (UUID(), "Paul")
        let item = ContactEntity(context: mockWrapper.container.viewContext)
        item.id = expectedData.0
        item.name = expectedData.1
        
        let response =  ds.create(ContactRequestModel(name: expectedData.1))
        
        XCTAssertTrue(mockWrapper.saveGotCalled)
        XCTAssertEqual(response, .success(true))
    }
    
    func test_create_should_return_failure_on_error() {
        mockWrapper.saveThrows = true
        
        let response =  ds.create(ContactRequestModel(name: "Paul"))
        
        XCTAssertFalse(mockWrapper.saveGotCalled)
        XCTAssertEqual(response, .failure(.Create))
    }
}
