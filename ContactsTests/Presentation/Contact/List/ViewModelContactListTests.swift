
@testable import Contacts
import XCTest

class ViewModelContactListTests: XCTestCase {
    var vm: ContactListViewModel!
    var mockGetContacts : MockGetAllContacts!
    
    override func setUp() {
        mockGetContacts = MockGetAllContacts()
        vm = .init(getAllContacts: mockGetContacts)
        
    }
    
    func test_should_set_contacts_with_data() async{
        let expectedResult: [ContactResponseModel] = [
            ContactResponseModel(id: UUID(), name: "Paul"),
            ContactResponseModel(id: UUID(), name: "John")
        ]
        mockGetContacts.executeResult = .success(expectedResult)
        await vm.getContacts()
        XCTAssertTrue(mockGetContacts.executeGotCalled)
        XCTAssertEqual(vm.contacts, expectedResult)
    }
    
    
    func test_should_set_error_when_getContacts_fails() async{
        mockGetContacts.executeResult = (.failure(ContactError.Get))
        await vm.getContacts()
        XCTAssertEqual(vm.contacts.count, 0)
        XCTAssertEqual(vm.errorMessage, "Error Fetching Contacts")
    }
}

