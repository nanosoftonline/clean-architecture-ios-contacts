

@testable import Contacts
import XCTest



class ViewModelContactEditTests: XCTestCase {
    var vm: ContactEditViewModel!
    var mockUpdateContact : MockUpdateContact!
    var mockGetContact : MockGetContact!
    
    override func setUp() {
        mockUpdateContact = MockUpdateContact()
        mockGetContact = MockGetContact()
        vm = .init(
            updateContact: mockUpdateContact,
            getContact: mockGetContact
        )
        
    }
    
    func test_getContact_should_return_ContactResponseModel() async{
        let id = UUID()
        mockGetContact.executeResult = .success(ContactResponseModel(id: id, name: "Paul"))
        await vm.getContact(id)
        XCTAssertTrue(mockGetContact.executeGotCalled)
        XCTAssertEqual(vm.name, "Paul")
        XCTAssertEqual(vm.isLoading, false)
        XCTAssertEqual(vm.errorMessage, "")
    }
    
    func test_getContact_should_return_failure_on_error() async{
        let id = UUID()
        mockGetContact.executeResult = .failure(.Get)
        await vm.getContact(id)
        XCTAssertTrue(mockGetContact.executeGotCalled)
        XCTAssertEqual(vm.name, "")
        XCTAssertEqual(vm.isLoading, false)
        XCTAssertEqual(vm.errorMessage, "Error Fetching Contact")
    }
    
    func test_canSave_should_be_true_new_and_original_values_are_diff(){
        vm.name = "Another Name"
        vm.originalContact = ContactResponseModel(id: UUID(), name: "Some Name")
        XCTAssertTrue(vm.canSave)
    }
    
    func test_canSave_should_be_false_new_and_original_values_are_equal(){
        vm.name = "Some Name"
        vm.originalContact = ContactResponseModel(id: UUID(), name: "Some Name")
        XCTAssertFalse(vm.canSave)
    }
       
    
    func test_updateContact_should_return_called() async{
        mockUpdateContact.executeResult = .success(true)
        let id = UUID()
        vm.name = "Paul"
        await vm.updateContact( id)
        XCTAssertTrue(mockUpdateContact.executeGotCalled)
        let expectedParams = (id, ContactRequestModel(name: "Paul"))
        XCTAssertTrue(mockUpdateContact.executeGotCalledWith == expectedParams)
    }
    
    func test_should_set_error_when_updateContact_fails() async{
        mockUpdateContact.executeResult = .failure(ContactError.Update)
        let id = UUID()
        await vm.updateContact(id)
        XCTAssertEqual(vm.errorMessage, "Error Updating Contact")
    }
    
}
