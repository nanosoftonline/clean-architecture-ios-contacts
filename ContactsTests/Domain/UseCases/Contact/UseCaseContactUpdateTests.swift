
@testable import Contacts
import XCTest



class UseCaseContactUpdateTests: XCTestCase {
    var useCase: UpdateContact!
    var mockContactRepository : MockContactRepository!
    
    override func setUp() {
        mockContactRepository = MockContactRepository()
        useCase = .init(contactRepo: mockContactRepository)
        
    }
    
    func test_repo_updateContact_should_be_called() async{
        mockContactRepository.updateContactResult = .success(())
        let expectedParams = (UUID(), ContactRequestModel(name: "Paul"))
        _ = await useCase.execute(id: expectedParams.0, data: expectedParams.1)
        XCTAssertTrue(mockContactRepository.updateContactGotCalledWith == expectedParams)
    }
    
}
