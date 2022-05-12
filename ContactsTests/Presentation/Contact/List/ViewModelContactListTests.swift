
@testable import Contacts
import XCTest

class ViewModelContactListTests: XCTestCase {
    var vm: ContactListViewModel!
    var mockGetContacts : MockGetAllContacts!
    var mockDeleteContact: MockDeleteContact!
    
    override func setUp() {
        mockGetContacts = MockGetAllContacts()
        mockDeleteContact = MockDeleteContact()
        vm = .init(getAllContacts: mockGetContacts, deleteContact: mockDeleteContact)
        
    }
    
    func test_deleteContact_should_return_success() async {
        mockDeleteContact.executeResult = .success(true)
        let id = UUID()
        await vm.deleteContact(id)
        XCTAssertEqual(mockDeleteContact.executeGotCalledWith, (id))
    }
    
    func test_deleteContact_set_error_when_deleteContact_fails() async{
        mockDeleteContact.executeResult = (.failure(ContactError.Get))
        await vm.deleteContact(UUID())
        XCTAssertEqual(vm.errorMessage, "Error Deleting Contact")
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

