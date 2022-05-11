
@testable import Contacts
import XCTest



class UseCaseContactUpdateTests: XCTestCase {
    var useCase: UpdateContact!
    var mockContactRepository : MockContactRepository!
    
    override func setUp() {
        mockContactRepository = MockContactRepository()
        useCase = .init(contactRepo: mockContactRepository)
        
    }
    
    func test_return_success_on_repo_success() async{
        mockContactRepository.updateContactResult = .success(true)
        let expectedParams = (UUID(), ContactRequestModel(name: "Paul"))
        let response = await useCase.execute(id: expectedParams.0, data: expectedParams.1)
        XCTAssertTrue(mockContactRepository.updateContactGotCalledWith == expectedParams)
        XCTAssertEqual(response, .success(true))
    }
    

    
}
