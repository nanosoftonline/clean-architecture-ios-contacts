
@testable import Contacts
import XCTest



class UseCaseContactGetAllTests: XCTestCase {
    var useCase: GetAllContacts!
    var mockContactRepository : MockContactRepository!
    
    override func setUp() {
        mockContactRepository = MockContactRepository()
        useCase = .init(contactRepo: mockContactRepository)
        
    }
    
    func test_repo_getContacts_should_be_called() async{
        let expectedResult = [ContactResponseModel(id: UUID(), name: "Paul")]
        mockContactRepository.getContactsResult = .success(expectedResult)
        let response = await useCase.execute()
        XCTAssertEqual(response, .success(expectedResult))
        XCTAssertTrue(mockContactRepository.getContactsGotCalled)
    }
    
    
}
