
@testable import Contacts
import XCTest



class UseCaseContactGetOneTests: XCTestCase {
    var useCase: GetOneContact!
    var mockContactRepository : MockContactRepository!
    
    override func setUp() {
        mockContactRepository = MockContactRepository()
        useCase = .init(contactRepo: mockContactRepository)
        
    }
    
    func test_repo_getContact_should_be_called() async{
        let expectedResult = ContactResponseModel(id: UUID(), name: "Paul")
        mockContactRepository.getContactResult = .success(expectedResult)
        let response = await useCase.execute(expectedResult.id)
        XCTAssertEqual(response, .success(expectedResult))
        XCTAssertTrue(mockContactRepository.getContactGotCalledWith == (expectedResult.id))
    }

    
}
