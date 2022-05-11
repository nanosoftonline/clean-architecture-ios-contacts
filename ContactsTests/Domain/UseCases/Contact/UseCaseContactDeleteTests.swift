
@testable import Contacts
import XCTest

class UseCaseContactDeleteTests: XCTestCase {
    var useCase: DeleteContact!
    var contactRepository : MockContactRepository!
    
    override func setUp() {
        contactRepository = MockContactRepository()
        useCase = .init(contactRepo: contactRepository)
        
    }
    
    func test_repo_deleteContact_should_be_called() async{
        contactRepository.deleteContactResult = .success(true)
        let id = UUID()
        let response = await useCase.execute(id)
        XCTAssertEqual(contactRepository.deleteContactGotCalledWith, (id))
        XCTAssertEqual(response, .success(true))
    }
    
    
}
