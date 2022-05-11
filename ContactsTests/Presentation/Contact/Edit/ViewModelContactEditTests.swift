

@testable import Contacts
import XCTest



class ViewModelContactEditTests: XCTestCase {
    var vm: ContactEditViewModel!
    var mockUpdateContact : MockUpdateContact!
    var mockDeleteContact : MockDeleteContact!
    
    override func setUp() {
        mockUpdateContact = MockUpdateContact()
        mockDeleteContact = MockDeleteContact()
        vm = .init(updateContact: mockUpdateContact, deleteContact: mockDeleteContact)
        
    }
    
    func test_deleteContact_should_be_called() async{
        mockDeleteContact.executeResult = .success(true)
        let id = UUID()
        await vm.deleteContact(id: id)
        XCTAssertEqual(vm.errorMessage, "")
        XCTAssertTrue(mockDeleteContact.executeGotCalled)
        XCTAssertEqual(mockDeleteContact.executeGotCalledWith, id)
    }
    
    
    func test_should_set_error_when_deleteContact_fails() async{
        mockDeleteContact.executeResult = .failure(ContactError.Delete)
        let id = UUID()
        await vm.deleteContact(id: id)
        XCTAssertEqual(vm.errorMessage, "Error Deleting Contact")
    }
    
    
    func test_updateContact_should_return_called() async{
        mockUpdateContact.executeResult = .success(true)
        let id = UUID()
        vm.onNameChange(name: "Paul")
        await vm.updateContact(id: id)
        XCTAssertTrue(mockUpdateContact.executeGotCalled)
        let expectedParams = (id, ContactRequestModel(name: "Paul"))
        XCTAssertTrue(mockUpdateContact.executeGotCalledWith == expectedParams)
    }
    
    func test_should_set_error_when_updateContact_fails() async{
        mockUpdateContact.executeResult = .failure(ContactError.Update)
        let id = UUID()
        await vm.updateContact(id: id)
        XCTAssertEqual(vm.errorMessage, "Error Updating Contact")
    }
    
}
