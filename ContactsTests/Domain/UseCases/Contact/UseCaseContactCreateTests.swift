
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
        mockContactRepository.createContactResult = .success(())
        _ = await useCase.execute(contact: ContactRequestModel(name: "Paul"))
        XCTAssertTrue(mockContactRepository.createContactGotCalledWith == ContactRequestModel(name: "Paul"))
    }
    
}
