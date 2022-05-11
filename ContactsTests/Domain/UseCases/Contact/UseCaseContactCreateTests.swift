
@testable import Contacts
import XCTest



class UseCaseContactCreateTests: XCTestCase {
    var useCase: CreateContact!
    var mockContactRepository : MockContactRepository!
    
    override func setUp() {
        mockContactRepository = MockContactRepository()
        useCase = .init(contactRepo: mockContactRepository)
        
    }
    
    func test_repo_createContact_should_be_called() async{
        mockContactRepository.createContactResult = .success(true)
        let response = await useCase.execute(ContactRequestModel(name: "Paul"))
        XCTAssertEqual(response, .success(true))
    }
    
}
